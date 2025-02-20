#Import  necessary libraries 
import nltk
from nltk.tokenize import word_tokenize
from nltk.corpus import stopwords

#Download necessary NLTK data
nltk.download('punkt')
nltk.download('stopwords')
nltk.download('averaged_perceptron_tagger')

#Sample text for tokenization
text = "Hello, how are you doing today? The weather is great and Python is awesome."

# text = "Natural Language Processing is a fascinating field of AI."

#Tokenize the text
tokens = word_tokenize(text)

#Remove stopwords
stop_words = set(stopwords.words('english'))
filtered_tokens = [word for word in tokens if word.lower() not in stop_words]

print("Original Tokens:", tokens)
print("Filtered Tokens:", filtered_tokens)

