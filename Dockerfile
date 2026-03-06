# imagem leve com Node.js
FROM node:18-alpine   

WORKDIR /app

# Copia os arquivos de dependências primeiro (aproveita cache)
COPY package*.json ./

# Instala as dependências dentro da imagem
RUN npm ci --only=production   # ou npm install

# Copia o restante do código
COPY . .

# Expõe a porta que a aplicação usa (ex: 3000)
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["npm", "start"]