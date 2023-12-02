from flask import Flask, jsonify, request
from flask_cors import CORS

app = Flask(__name__)
CORS(app) 
# Credenciais válidas (substitua com suas próprias credenciais)
#valid_credentials = {'user': '123'}
valid_username = 'user'
valid_password = '123'

@app.route('/api/authenticate', methods=['POST'])
def authenticate():
    data = request.get_json()

    # Obtenha o nome de usuário e a senha do corpo da solicitação
    username = data.get('username')
    password = data.get('password')

    # Verifique se o nome de usuário e a senha estão presentes
    if not username or not password:
        return jsonify({'authenticated': False, 'error': 'Credenciais ausentes'}), 400

    # Verifique se as credenciais correspondem às credenciais válidas
    if username == valid_username and password == valid_password:
        return jsonify({'authenticated': True}), 200
    else:
        return jsonify({'authenticated': False, 'error': 'Credenciais inválidas'}), 401

if __name__ == '__main__':
    app.run(debug=True)
