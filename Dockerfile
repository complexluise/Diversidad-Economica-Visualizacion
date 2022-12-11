FROM python:3.9-slim
# Make dir app
RUN mkdir /app
WORKDIR /app

COPY requirements.txt ./requirements.txt
RUN pip install -r requirements.txt
##RUN pipenv install pandas dash plotly gunicorn

COPY . ./
CMD gunicorn -b 0.0.0.0:80 app.app:server