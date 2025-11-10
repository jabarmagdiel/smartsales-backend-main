# Imagen base de Python
FROM python:3.11-slim

# Evita archivos .pyc y usa salida directa
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Crea y establece el directorio de trabajo
WORKDIR /app

# Copiar dependencias e instalarlas
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copiar todo el código del proyecto
COPY . /app/

# Exponer el puerto
EXPOSE 8080

# Comando para ejecutar el servidor Django
CMD ["gunicorn", "backend_salessmart.wsgi:application", "--bind", "0.0.0.0:8080"]
