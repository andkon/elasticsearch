# The official Elasticsearch Docker image
FROM docker.elastic.co/elasticsearch/elasticsearch:7.17.21@sha256:689a8cc0c63295ad473fb6996c9d69cbdfc80298a5733c652c9f306388cbb78a

# Copy our config file over
COPY --chown=1000:0 config/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

# Allow Elasticsearch to create `elasticsearch.keystore`
# to circumvent https://github.com/elastic/ansible-elasticsearch/issues/430
RUN chmod g+ws /usr/share/elasticsearch/config

USER 1000:0
