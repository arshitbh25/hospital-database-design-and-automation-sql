#  Hospital Management Database Design and Automation (SQL Project)

Designed and implemented a normalized hospital database in SQL Server with data migration, trigger-based validation, credential-based access control, and automated revenue reporting using stored procedures.


___
## 📌 Table of Contents
- <a href="#overview">Overview</a>
- <a href="#problem-statement">Problem Statement</a>
- <a href="#tools--technologies">Tools and Technologies</a>
- <a href="#project-structure">Project Structure</a>
- <a href="#methods">Methods</a>
- <a href="#key-insights">Key Insights</a>
- <a href="#how-to-run-this-project">How to Run This Project</a>
- <a href="#future-work">Future Work</a>
- <a href="#author--contact">Author and Contact</a>


___
<h2><a class="anchor" id="overview"></a>Overview</h2>

Hospitals often rely on Excel files for managing patient records, appointments, billing, and doctor information during early stages. However, Excel lacks relational integrity, scalability, and automation capabilities, leading to operational inefficiencies and data inconsistency.

This project demonstrates the complete transition from an Excel-based system to a structured relational database using SQL Server. It includes schema design, data migration, integrity enforcement using triggers and constraints, secure access control using stored procedures with credential validation, and automated financial reporting.

The project simulates a real-world database implementation scenario and demonstrates production-level SQL development skills required for Data Analyst and Database roles.


___
<h2><a class="anchor" id="problem-statement"></a>Problem Statement</h2>

The hospital faced the following key operational challenges:

- Lack of structured relational database
- No unique identifiers for core entities
- No referential integrity between related data
- Doctors being double-booked for appointments
- Appointments being scheduled with invalid dates
- No secure access control for sensitive patient data
- No automated reporting system for revenue analysis
- Inefficient manual reporting process

The objective was to design and implement a robust relational database system to ensure data integrity, improve operational efficiency, secure sensitive information, and automate reporting.


___
<h2><a class="anchor" id="tools--technologies"></a>Tools and Technologies</h2>

🐍 Python

🧪 Pandas

📊 Plotly

🧠 SpaCy

⚡ Streamlit

🔤 NLTK

🤗 Hugging Face


___
<h2><a class="anchor" id="project-structure"></a>Project Structure</h2>

```
Text-Analysis-Platform-using-Python-GenAI/
│
├── Scripts/
│      ├── app.py
│      ├── nlp_functions.py
│      └── text_cleaner.py
│
├── .gitattributes
│
├── .gitignore
│
├── README.md
│
└── Text Analysis Platform Report.pdf
```

___
<h2><a class="anchor" id="methods"></a>Methods</h2>

**Data Input & Preprocessing**
- Users can upload raw text directly or upload a CSV file.
- When a CSV file is uploaded, the platform provides an option to select a specific column/row for analysis.
- The selected text is cleaned using techniques such as lowercasing, punctuation removal, and tokenization.
- Preprocessing is implemented using SpaCy and regular expressions (re) to ensure clean and consistent text.

**Linguistic Processing**
- After preprocessing, the text undergoes deeper linguistic analysis through SpaCy’s NLP pipeline, which performs: _Part-of-Speech (POS) tagging, Named Entity Recognition (NER), Lemmatization, Dependency parsing_
- This step structures the text into meaningful components to support further analysis and insight extraction.

**Sentiment & Emotion Analysis**
- The platform uses pre-trained transformer models from Hugging Face to identify: _Overall sentiment (positive, negative, neutral), Specific emotions such as joy, anger, fear, or sadness_
- These models help uncover deeper emotional patterns beyond basic text statistics.

**Statistical & Exploratory Text Analysis**
- Using Pandas and Python-based logic, the platform extracts insights such as: _Word and sentence frequency, Common phrases (n-grams), Keyword density, Readability metrics_
- This reveals key themes, repeating patterns, and dominant language structure.

**Interactive Visualization**
- Insights are displayed through dynamic visualizations built with Plotly, including: _Word frequency charts, Sentiment distribution plots, Entity highlights, Emotion breakdown graphs_
- These interactive charts help users instantly interpret findings.

**User Interface & Interaction**
- The full pipeline is integrated into an intuitive Streamlit interface that enables: _Real-time processing, Smooth navigation between features, Instant updates to visual insights, A simple, no-code experience suitable for all users_

___
<h2><a class="anchor" id="key-insights"></a>Key Insights</h2>

- **Word Cloud**: Highlights the most frequently used words in the text, giving a quick visual impression of dominant themes.

- **Bigrams Analysis**: Extracts common two-word combinations to reveal meaningful phrase patterns and topic relationships.

- **Emotion Detection**: Detects emotions like joy, anger, fear, sadness, and surprise, revealing deeper emotional layers.

- **Sentiment Analysis**: Identifies whether the overall text is positive, negative, or neutral, helping understand its general attitude.

- **Tone of Speech**: Determines the textual tone—such as formal, informal, informative, or persuasive—based on linguistic patterns.

- **Text Summarization**: Generates a concise summary that captures the core message and key points of the text.


___
<h2><a class="anchor" id="how-to-run-this-project"></a>How to Run This Project</h2>

1. Clone the Repository:
   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   cd your-repo-name
   ```
2. Create a Virtual Environment:
   ```bash
   python -m venv venv
   ```
3. Activate the Virtual Environment
   ```bash
   venv\Scripts\activate
   ```
4. Download necessary libraries or packages:
   ```bash
   pip install streamlit pandas plotly nltk transformers torch wordcloud scikit-learn regex
   python -m spacy download en_core_web_sm
   ```
5. Run the Stremlit App:
   ```bash
   streamlit run app.py
   ```
6. Access the Application   
After running the above command, open the local URL generated by Streamlit:
   ```bash
   http://localhost:8501
   ```


___
<h2><a class="anchor" id="future_work"></a>Future Work</h2>

- **Integrate Advanced ML Models**: Add more sophisticated transformer-based models for deeper sentiment, topic, and semantic analysis.

- **Enhanced Dashboard UI**: Improve the Streamlit interface with multi-page navigation, dark mode, and customizable layouts.

- **Real-Time Text Streaming Support**: Allow users to analyze live text (e.g., chat messages, comments, transcripts) in real time.

- **Multilingual Text Analysis**: Expand support for additional languages to make the platform more globally accessible.

- **Custom Stopword & Token Rules**: Enable users to define their own stopwords, filters, and preprocessing rules.


___
<h2><a class="anchor" id="author--contact"></a>Author and Contact</h2>

**Arshit Bhardwaj**  
Emerging Data Analyst

📧 Email: arshitbh25@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/arshit-bhardwaj/)  
🔗 [Portfolio](https://sites.google.com/view/arshit-bhardwaj/)
