# Gunakan Node.js versi 14 sebagai base image
FROM node:14

# Tentukan /app sebagai working directory di dalam container
WORKDIR /app

# Salin seluruh source code dari host ke working directory di container
COPY . .

# Jalankan aplikasi dalam production mode dan gunakan container item-db sebagai database host
ENV NODE_ENV=production DB_HOST=item-db

# Instal dependencies khusus production, lalu build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Ekspos port 8080 yang digunakan oleh aplikasi
EXPOSE 8080

# Jalankan server dengan perintah npm start saat container diluncurkan
CMD ["npm", "start"]
