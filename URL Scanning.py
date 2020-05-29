# -*- coding: utf-8 -*-
"""
Created on Sun May 24 20:20:40 2020

@author: bhawn
"""

TEXT ="Hello, world! https://google.com ,Hello world!"
string=" "
def Get_URL(text):
    import spacy
    from spacy.matcher import Matcher
    
    nlp = spacy.load("en_core_web_sm")
    matcher = Matcher(nlp.vocab) 
    pattern = [ {"LIKE_URL": True}]
    matcher.add("URL", None, pattern)
    doc = nlp(text)
    matches = matcher(doc)
    for match_id, start, end in matches:  
        span = doc[start:end] 
        URL= span.text 
    return URL 


def scanning(URL):
    import vt
    import nest_asyncio
    flag=0
    nest_asyncio.apply()
    client = vt.Client("<API KEY>")   
    url_id = vt.url_id(URL)
    url = client.get_object("/urls/{}".format(url_id))
    result = url.last_analysis_stats 
    for i in result:
        if i==1 and result[i]>0:
            flag = 1
        if i==2 and result[i]>0:
            flag=1       
    return flag 

def string(flag_value):
    if flag_value==1:
        string="This link is suspicious and can be malicious. kindly dont open/click this link." + Get_URL(TEXT)
    else :
        string="This link is not  suspicious and can be malicious. You can open/click this link." + Get_URL(TEXT)
    return string
    

def whatsapp(send_data):
    from twilio.rest import Client
    
    
    account_sid =<account_sid>
    auth_token = <account_token>
    client = Client(account_sid, auth_token)
    
    message = client.messages \
        .create(
    
             from_='whatsapp:<twilio_number>',
             body= send_data + str(Get_URL(TEXT)),
             to='whatsapp:<person whastapp number>'
         )
    print(send_data)
    print(message.sid)    

if __name__ == "__main__": 
    whatsapp(string(scanning(Get_URL(TEXT))))
