import os
import json

from firebase_functions import https_fn
from firebase_admin import initialize_app

from langchain.chat_models import ChatOpenAI
from langchain.document_loaders import PyPDFLoader
from langchain.output_parsers import ResponseSchema
from langchain.output_parsers import StructuredOutputParser
from langchain.prompts import ChatPromptTemplate

initialize_app()

@https_fn.on_request(
        region='europe-west3',
        secrets=['openai_api_key'],
)
def get_summary(req: https_fn.Request) -> https_fn.Response:
    data = req.get_json()

    template = get_prompt()

    pdf_data = get_pdf_data(data['pdf_url'])

    output_parser = get_output_parser()
    format_instructions = output_parser.get_format_instructions()

    prompt = template.format(
        text=pdf_data,
        format_instructions=format_instructions,
    )

    print(prompt)

    llm = get_llm()

    response = llm.predict(prompt)

    print(response)

    structured_output = output_parser.parse(response)

    print(structured_output)

    response = json.dumps(structured_output)

    return https_fn.Response(
        response=response,
        status=200,
        content_type='application/json',
        )


def get_llm() -> ChatOpenAI:
    openai_api_key = os.environ.get('openai_api_key')

    llm_model = 'gpt-3.5-turbo'
    llm = ChatOpenAI(temperature=0.0, model=llm_model, openai_api_key=openai_api_key)

    return llm

def get_prompt() -> ChatPromptTemplate:
    template = """\
    Act as a legal advisor and assistant to the user. Provide accurate, truthful \
    information on legal matters without giving legal advice. If uncertain or \
    beyond your knowledge, admit it. Prioritize user\'s interests, respect \
    confidentiality, and maintain professionalism. Answer in the language of the \
    document.

    For the following text, extract the following information:

    category: In what category or branch of law does this text fit best? If no \
    category applies, return unknown.

    summary: What are the key points and legal obligations that each party named \
    in the legal document has to follow.

    citations: A list of citations to legal paragraphs included in the document \
    in the standard correct legal format. If none were found, return an empty list.

    Text:
    {text}

    {format_instructions}"""

    prompt = ChatPromptTemplate.from_template(template)

    return prompt

def get_pdf_data(pdf_url: str) -> str:
    loader = PyPDFLoader(pdf_url)
    pages = loader.load_and_split()

    pdf_data = ''
    for page in pages:
        pdf_data += page.page_content

    return pdf_data


def get_output_parser() -> StructuredOutputParser:
    category_schema = ResponseSchema(
        name='category',
        description='In what category or branch of law does this text fit best? If \
        no category applies, return unknown.'
    )

    summary_schema = ResponseSchema(
        name='summary',
        description='What are the key points and legal obligations that each party \
        named in the legal document has to follow.'
    )

    # https://github.com/kiersch/jura_regex#regul%C3%A4rer-ausdruck
    citations_schema = ResponseSchema(
        name='citations',
        description='A list of citations to legal paragraphs included in the document \
        in the standard correct legal format.'
    )

    response_schemas = [
        category_schema,
        summary_schema,
        citations_schema,
        ]

    output_parser = StructuredOutputParser.from_response_schemas(response_schemas)

    return output_parser