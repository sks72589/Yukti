# -*- coding: utf-8 -*-
"""
Created on Sun May 24 02:46:47 2020

@author: bhawn
"""

from flask import Flask, request
from twilio.twiml.voice_response import VoiceResponse, Gather
import spacy
from spacy.matcher import Matcher
import speech_recognition as sr
nlp = spacy.load("en_core_web_sm")
r = sr.Recognizer() 

app = Flask(__name__)


@app.route("/voice", methods=['GET', 'POST'])
def voice():
    """Respond to incoming phone calls with a menu of options"""
    resp = VoiceResponse()

    gather = Gather(num_digits=1, action='/gather')
    gather.say("Hello, For medical facility, press 1. For testing information, press 2. For do's and dont's, press 3. For latest governmental updates, press 4. For services launched by government, press 5."  )
    resp.append(gather)
    resp.redirect('/voice')

    return str(resp)

@app.route("/record", methods=['GET', 'POST'])
def record():
    """Returns TwiML which prompts the caller to record a message"""
    response = VoiceResponse()

    response.say('Hello. Please leave a message after the beep.')

    response.record()

    return str(response) 
def message(text):

    from twilio.rest import Client
    

    account_sid = 'AC0001c84930a299ec3b0eb451e0cea11b'
    auth_token = '6f7d8000c41b081ace376d2479473c7d'
    client = Client(account_sid, auth_token)
    
    message = client.messages \
        .create(
             body=text,
             messaging_service_sid='MG0fbdccdb68e3ff4ec2c28b37551f701e',
             to='+918092040464'
         )
    
    print(message.sid)    
def choice1( ):
    resp = VoiceResponse()
    resp.say('Do you want to know about the nearest medical facilty ') 
    text = r.recognize_google(record())
    pattern = [{"LOWER": "medical services"}]
    Matcher.add("Medical facility", None , pattern)
    doc = nlp(text)
    matches = Matcher(doc)
    if matches: 
        resp.say('Ashlok hospital is near to you')
    message(str(resp))
    return str(resp)

def choice2():
    resp = VoiceResponse()
    resp.say('Do you Experience severe pain in the chest ') 
    text = r.recognize_google(record())
    pattern = [{"LOWER": "yes"}]
    Matcher.add("Testing", None, pattern)
    doc = nlp(text)
    matches = Matcher(doc)
    if matches: 
        resp.say('Do you have dry cough ')
        text1= r.recognize_google(record())
        doc1=nlp(text1)
        matches=Matcher(doc1)
        if matches:
            resp.say('Kindly visit to your nearest hospital for checkup')
        else: 
            resp.say('you should consult a doctor')
    else: 
        resp.say('you are fine. No symptons found')
        
    message(str(resp))
    return str(resp)


def choice3():
    resp = VoiceResponse()
    resp.say('Do you want me to breif you through Dos and Donts durring this time ') 
    text = r.recognize_google(record())
    pattern = [{"LOWER": "yes"}]
    Matcher.add("Do' and Dont", None, pattern)
    doc = nlp(text)
    matches = Matcher(doc)
    if matches: 
        resp.say('Cover your face while coughing. Wash your hand before touching the face.Do not socialize if not necessary. ')
    message(str(resp))
    return str(resp) 

def choice4():
    resp = VoiceResponse()
    resp.say('Do you want to know the latest update by the Government ') 
    text = r.recognize_google(record())
    pattern = [{"LOWER": "yes"}]
    Matcher.add("Update", None, pattern)
    doc = nlp(text)
    matches = Matcher(doc)
    if matches: 
        resp.say('There has been an Extension in lockdown,train services are available for migrant and labours to know more contact IRCTC ')
    message(str(resp))
    return str(resp) 

def choice5 ():
    resp = VoiceResponse()
    resp.say('Do you want to know the services launched by the Government ') 
    text = r.recognize_google(record())
    pattern = [{"LOWER": "ys"}]
    Matcher.add("services", None, pattern)
    doc = nlp(text)
    matches = Matcher(doc)
    if matches: 
        resp.say('For  more information please visit https://services.india.gov.in/ ')
    message(str(resp))
    return str(resp)

@app.route('/gather', methods=['GET', 'POST'])
def gather():
    """Processes results from the <Gather> prompt in /voice"""
    resp = VoiceResponse()

    if 'Digits' in request.values:        
        choice = request.values['Digits']
        if choice == '1':
            
            string = choice1()   
            return string
        elif choice == '2':
            string = choice2()
            return string
        elif choice == '3':
            string = choice3()
            return string            
        elif choice == '4':
            string = choice4()
            return string
        elif choice == '5':
            string = choice5()
            return string
        else:
            resp.say("Sorry, I don't understand that choice.")

    resp.redirect('/voice')

    return str(resp) 


if __name__ == "__main__":
    app.run(debug=True)
