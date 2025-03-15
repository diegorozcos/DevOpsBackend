# Usar una imagen de Node.js
FROM node:20.18.3

# Establecer el directorio de trabajo
WORKDIR /usr/src/app

# Copiar solo archivos esenciales
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar el resto del código
COPY . .

# Compilar TypeScript
RUN npm run build

# Exponer el puerto (de acuerdo al archivo .env)
EXPOSE 3000

# Especificar las variables de entorno (opcional)
ENV NODE_ENV=development

# Ejecutar la aplicación
CMD ["node", "dist/server.js"]
