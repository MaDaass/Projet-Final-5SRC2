FROM python:3.6-alpine

ENV FLASK_ENV=production \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    ODOO_URL=https://www.odoo.com \
    PGADMIN_URL=https://www.pgadmin.org

RUN addgroup -S webgroup && adduser -S webapp -G webgroup

WORKDIR /opt
COPY . /opt
RUN chown -R webapp:webgroup /opt

RUN pip install --no-cache-dir Flask

EXPOSE 8080

USER webapp

ENTRYPOINT ["python"]
CMD ["app.py"]

