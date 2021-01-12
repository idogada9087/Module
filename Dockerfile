FROM python:3.6-slim
ENV LOG_LEVEL=INFO

#Install the dependecies
COPY ./requirements.txt /opt/Module
RUN pip3 install -r /opt/transfer/requirements.txt

COPY ./main.py /opt/Module
COPY ./SubModule/*.py  /opt/SubModule

ENTRYPOINT gunicorn --bind "0.0.0.0:80" --log-level=$LOG_LEVEL --access-logfile - 'transfer:app'