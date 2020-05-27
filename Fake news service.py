# -*- coding: utf-8 -*-
"""
Created on Wed May 27 20:23:27 2020

@author: bhawn
"""
#The news criterion will be loaded from website to this backend machine
#After loading the news will be tested for its credibility 
#Later in this future this machine can be trained with other news dataset 
#here we only only using this for COVID-19 news credeibilty 

#for instance the news can be like the given below one.
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.pipeline import Pipeline
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.svm import LinearSVC
from sklearn import metrics 
from sklearn.ensemble import RandomForestClassifier  
from sklearn.neighbors import KNeighborsClassifier
from sklearn import tree
from sklearn.linear_model import LogisticRegression

stopwords = ['a', 'about', 'an', 'and', 'are', 'as', 'at', 'be', 'been', 'but', 'by', 'can', \
             'even', 'ever', 'for', 'from', 'get', 'had', 'has', 'have', 'he', 'her', 'hers', 'his', \
             'how', 'i', 'if', 'in', 'into', 'is', 'it', 'its', 'just', 'me', 'my', 'of', 'on', 'or', \
             'see', 'seen', 'she', 'so', 'than', 'that', 'the', 'their', 'there', 'they', 'this', \
             'to', 'was', 'we', 'were', 'what', 'when', 'which', 'who', 'will', 'with', 'you'] 
News = "Old Chinese doctor has proven it's efficacy. Many patients has also proven this to be effective. Eight (8) cloves of chopped garlics add seven (7)cups of water and bring to boil., Eat and drink the boiled garlic water, overnight improvement and healing. Glad to share this. "    

df = pd.read_csv('C:/Users/bhawn/Downloads/Data Set - Sheet1.tsv', sep='\t')
df.dropna(inplace=True) 

X = df['NEWS']
y = df['LABEL']  


def LinearSVC_machine(X , y, data):
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.44, random_state=42)
    text_clf_lsvc2 = Pipeline([('tfidf', TfidfVectorizer(stop_words=stopwords)),
                         ('clf', LinearSVC()),
    ])
    text_clf_lsvc2.fit(X_train, y_train) 
    predictions = text_clf_lsvc2.predict(X_test)
    print(metrics.confusion_matrix(y_test,predictions))
    print(metrics.classification_report(y_test,predictions))
    print(metrics.accuracy_score(y_test,predictions))
    result = str(text_clf_lsvc2.predict([data]))
    return str(result) 

def RandomForest_Machine(X, y, data):
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.44, random_state=42)
    text_clf_lsvc2 = Pipeline([('tfidf', TfidfVectorizer(stop_words=stopwords)),
                         ('clf', RandomForestClassifier(max_depth=2, random_state=0)),
    ])
    text_clf_lsvc2.fit(X_train, y_train) 
    predictions = text_clf_lsvc2.predict(X_test)
    print(metrics.confusion_matrix(y_test,predictions))
    print(metrics.classification_report(y_test,predictions))
    print(metrics.accuracy_score(y_test,predictions))
    result = str(text_clf_lsvc2.predict([data]))
    return str(result) 

def KNN_Machine(X, y, data):
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.44, random_state=42)
    text_clf_lsvc2 = Pipeline([('tfidf', TfidfVectorizer(stop_words=stopwords)),
                         ('clf', KNeighborsClassifier(n_neighbors=3)),
    ])
    text_clf_lsvc2.fit(X_train, y_train) 
    predictions = text_clf_lsvc2.predict(X_test)
    print(metrics.confusion_matrix(y_test,predictions))
    print(metrics.classification_report(y_test,predictions))
    print(metrics.accuracy_score(y_test,predictions))
    result = str(text_clf_lsvc2.predict([data]))
    return str(result) 
       

def decisiontree_Machine(X, y, data):
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.44, random_state=42)
    text_clf_lsvc2 = Pipeline([('tfidf', TfidfVectorizer(stop_words=stopwords)),
                         ('clf', tree.DecisionTreeClassifier()),
    ])
    text_clf_lsvc2.fit(X_train, y_train) 
    predictions = text_clf_lsvc2.predict(X_test)
    print(metrics.confusion_matrix(y_test,predictions))
    print(metrics.classification_report(y_test,predictions))
    print(metrics.accuracy_score(y_test,predictions))
    result = str(text_clf_lsvc2.predict([data]))
    return str(result)     

def logisticreg_machine(X,y,data):
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.44, random_state=42)
    text_clf_lsvc2 = Pipeline([('tfidf', TfidfVectorizer(stop_words=stopwords)),
                         ('clf', LogisticRegression(random_state=0)),
    ])
    text_clf_lsvc2.fit(X_train, y_train) 
    predictions = text_clf_lsvc2.predict(X_test)
    print(metrics.confusion_matrix(y_test,predictions))
    print(metrics.classification_report(y_test,predictions))
    print(metrics.accuracy_score(y_test,predictions))
    result = str(text_clf_lsvc2.predict([data]))
    return str(result)   

def credit_function():
    string1 = LinearSVC_machine(X, y, News)
    string2 = RandomForest_Machine(X,y ,News)
    string3 = KNN_Machine(X,y , News)
    string4 = decisiontree_Machine(X,y, News)
    string5 = logisticreg_machine(X,y, News) 
    string6 = " "
    if string1== string2 or string3== string4 or string5==string1 or string2==string3 or string4==string5:
        string6="FAKE NEWS"
    else:
        string6="REAL NEWS"
    return string6 

def whatsapp():
    from twilio.rest import Client
    
    
    account_sid = 'AC0001c84930a299ec3b0eb451e0cea11b'
    auth_token = '6f7d8000c41b081ace376d2479473c7d'
    client = Client(account_sid, auth_token)
    
    message = client.messages \
        .create(
    
             from_='whatsapp:+14155238886',
             body=" This news " + News +" is  " + credit_function(),
             to='whatsapp:+917290928476'
         )
    
    print(message.sid)

if __name__ == "__main__": 
    whatsapp()
    