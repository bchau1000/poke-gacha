from flask import Flask, request, jsonify
from pymongo import MongoClient
app = Flask(__name__)

client = MongoClient(port=27017)
db = client.business

@app.route('/')
def home():
    return jsonify(test='Working!')

@app.route('/api/pokedex')
def get_pokemon():
    return jsonify(id='1', name='Bulbasaur')

app.run(debug=True)