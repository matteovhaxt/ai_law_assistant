#%%
from langchain.chat_models import ChatOpenAI
from langchain.chains import ConversationChain
from dotenv import load_dotenv, find_dotenv
import os
from langchain.document_loaders import PyPDFLoader
from langchain.output_parsers import ResponseSchema
from langchain.output_parsers import StructuredOutputParser
from langchain.prompts import ChatPromptTemplate
from langchain.chains import LLMChain
from langchain.chains import SequentialChain
import pprint

logger = pprint.PrettyPrinter(indent=4).pprint
#%%
env_path = find_dotenv('.env')
_ = load_dotenv(env_path)

llm_model = 'gpt-3.5-turbo'
llm = ChatOpenAI(temperature=0.0, model=llm_model)
conversation = ConversationChain(
    llm=llm,
    verbose=True,
)

file_directory = os.path.dirname(os.path.abspath(__file__))
pdf_path = os.path.join(file_directory, 'example_data', 'Mietvertrag.pdf')
loader = PyPDFLoader(pdf_path)
pages = loader.load_and_split()

pdf_data = ''
for page in pages:
    pdf_data += page.page_content

logger(pdf_data)
#%%
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
format_instructions = output_parser.get_format_instructions()

logger(format_instructions)

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

logger(prompt.messages)

chain = LLMChain(llm=llm, prompt=prompt, output_key='summary')
#%%
process_chain = SequentialChain(
    chains=[chain],
    input_variables=['text', 'format_instructions'],
    output_variables=['summary'],
    verbose=True,
)

result = process_chain({
    'text': pdf_data,
    'format_instructions': format_instructions,
    }, )
#%%
parsed_result = output_parser.parse(result['summary'])
logger(parsed_result['category'])
logger(parsed_result['summary'])
logger(parsed_result['citations'])
# %%
