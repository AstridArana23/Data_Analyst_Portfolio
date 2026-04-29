## Overview 
In supply chain operations, identifying shipment issues quickly is critical. Customer reviews often contain signals of delivery failures, but analyzing them manually is inefficient. This project builds a Natural Language Processing (NLP) model to detect logistics-related issues (delayed delivery, damaged goods) from customer reviews using an LSTM neural network.

By combining Python and ML, the model should develop learning patterns in a review's text and generalize to unseen reviews. Thus providing a foundation for applications such as flagging systems. 

## Objectives 
- Detect delivery delays
- Identification of damaged shipments
- Help with the flagging of potential operational risks

## Why use a LSTM model? 
- LSTMs (Long Short‑Term Memory networks) are a type of recurrent neural network designed to handle sequential data like text. Their key advantage is the ability to capture long‑range dependencies. For example, when the sentiment of a sentence depends on words that are far apart.
- LSTMs process text word‑by‑word, remembering important context across long sequences. This helps the model understand phrases like: “The package was boring at first, **but** the product was fantastic.”

## Tools & Technologies 
- Python (Pandas) 
- Tensorflow
- Keras
- Sylearn
- matplotlib
- Google Colab

## Workflow 
1. Data Source
- Amazon Fine Food Reviews dataset
2. Label Engineering
- Created binary classification:
  - 1 = logistics issue
  - 0 = no issue
3. Text Processing
- Tokenization
- Sequence padding
- Vocabulary limiting
4. Model Architecture
- Embedding layer (learned vector space)
- SpatialDropout1D (regularization)
- LSTM layer (sequence learning)
- Dense output (binary classification)

## Model Architecture 
Text → Tokenizer → Embedding → SpatialDropout → LSTM → Dense → Prediction

## Results 
Accuracy: XX%
Key insight: X% of reviews contain logistics-related issues
Common issue terms: “late”, “damaged”, “delivery.”

## Project Structure 
- notebooks/ -> Python code + Machine learning model (Colab)
- data/ → raw dataset
- outputs/ → processed datasets

## Author 
Astrid Arana Rivera
