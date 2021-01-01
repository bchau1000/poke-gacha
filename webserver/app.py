# app.py

from flask import Flask
from flask import jsonify
from flask import request
from werkzeug.serving import WSGIRequestHandler
from flask_pymongo import PyMongo
app = Flask(__name__)

app.config['MONGO_DBNAME'] = 'PokemonTable'
app.config['MONGO_URI'] = 'mongodb+srv://m001-student:OiHx3bVFmlOyMo5T@cluster0.xbjek.mongodb.net/PokemonTable?retryWrites=true&w=majority'


mongo = PyMongo(app)

@app.route('/')
def default():
  return 'default page'

@app.route('/api/pokedex', methods=['GET'])
def get_all_pokemon():
  query = request.args.get('search')
  limit =  request.args.get('limit') if request.args.get('limit') != None else 0
  offset = request.args.get('offset') if request.args.get('offset') != None else 0
  pokeData = mongo.db.pokemonData
  output = []
  if query:
    for document in pokeData.aggregate([
      {
      "$search": {
            "autocomplete": {
                    "query": query,
                    "path": "pokeName"
                    }
            }
      },
      {
        "$project":{#each field in the collection that has 1 will be returned in the iterable
          "_id":1,
          "pokeName":1,
          "types": 1,
          "stats": 1,
          'height':1,
          'weight':1,
          'rarity':1,
          'desc':1
          }
      }
      ]):
        output.append({'name':document['pokeName'],
                        'id': str(document['_id']),
                        'types': document['types'],
                        'stats': document['stats'],
                        'height':str(document['height']),
                        'weight':str(document['weight']),
                        'rarity':str(document['rarity']),
                        'desc':str(document['desc']),
                        
        })
  elif limit or offset:
   output = [{'name':document['pokeName'],
                        'id':str(document['_id']),
                        'types': document['types'],
                        'stats': document['stats'],
                        'height':str(document['height']),
                        'weight':str(document['weight']),
                        'rarity':str(document['rarity']),
                        'desc':str(document['desc'])}
                         for document in pokeData.find().limit(int(limit)).skip(int(offset))]
  else: #return all pokemon
    output = [{'name':document['pokeName'], 
               'id':str(document['_id']),
               'types': document['types'],
               'stats': document['stats'],
               'height':str(document['height']),
               'weight':str(document['weight']),
               'rarity':str(document['rarity']),
               'desc':str(document['desc'])}
                         for document in pokeData.find()]

  if output:
    return jsonify(output)
  else:
    return "\"{}\" not Found".format(query)


@app.route('/api/evolution/<int:evo_id>', methods=['GET'])
def get_evo_chain_by_id (evo_id):
  evoData = mongo.db.evolutionData
  output = []
  evoDoc = evoData.find_one({"_id":evo_id})
  
  for idx,group in enumerate(evoDoc["evoTree"]):
    output.append([])
    for element in group:
      output[idx].append(
        {"id":element,
        "pokeName":group[element]})
  
  if output:
    return jsonify({'result' : output})
  else:
    return "{} Could Not Be Found".format(evo_id)


@app.route('/api/evolution/<string:pokeNameInput>', methods=['GET'])
def get_evo_chain_by_name(pokeNameInput):
  output = []
  pokeData = mongo.db.pokemonData
  evoData = mongo.db.evolutionData
  pokeDoc = pokeData.find_one({"pokeName":pokeNameInput})
  evoDoc = evoData.find_one({"_id":pokeDoc["evoChainId"]})
  
  for idx,group in enumerate(evoDoc["evoTree"]):
    output.append([])
    for element in group:
      output[idx].append(
        {
          "id":element,
          "pokeName":group[element]})
  
  if output:
    return jsonify({'result' : output})
  else:
    return "{} Not Found".format(pokeNameInput)

@app.route('/api/stat-type/<int:poke_id>', methods=['GET'])
def get_stats(poke_id):
  pokeData = mongo.db.pokemonData
  pokeDoc = pokeData.find_one({"_id":poke_id})
  stat = pokeDoc["stats"]
  output = {
      "hp":stat["hp"],
      "attack" :stat["attack"],
      "defense" :stat["defense"],
      "special-attack" :stat["attack"],
      "special-defense" :stat["defense"],
      "speed" :stat["speed"],
      "types": [type_ for type_ in pokeDoc["types"]]
    }
  if output:
    return jsonify(output)
  else:
    return "Pokemon ID: {} Not Found".format(poke_id)

@app.route('/api/stat-type/<string:type_name>', methods=['GET'])
def get_type(type_name):
  limit =  request.args.get('limit') if request.args.get('limit') != None else 0
  offset = request.args.get('offset') if request.args.get('offset') != None else 0
  pokeData = mongo.db.pokemonData

  output = [{'pokeName':document['pokeName'],
              'id':document['_id']} 
              for document in 
              pokeData.find({"types":type_name}).limit(int(limit)).skip(int(offset))]
    
  if output:
    return jsonify(output)
  else:
    return "Type: \"{}\" Not Found".format(type_name)

WSGIRequestHandler.protocol_version = "HTTP/1.1"

if __name__ == '__main__':
    app.run(debug=True)
