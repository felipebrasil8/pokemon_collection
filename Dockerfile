# Usar uma imagem base do Ruby
FROM ruby:3.3

# Instalar dependências necessárias
RUN apt-get update -qq && apt-get install -y build-essential ruby-dev git curl libjemalloc2 libvips sqlite3 vim postgresql-client

# Set the app directory and create an user
ENV APP_PATH /app
ENV BUNDLE_PATH $APP_PATH/.gems
ENV BUNDLE_JOBS=3

# Criar um diretório de trabalho para a aplicação
WORKDIR /app

# Criar um usuário e grupo para não rodar como root
ARG USER=felipebrasil
ARG UID=1002
ARG GID=1002

RUN groupadd -g $GID $USER && \
    useradd -u $UID -g $USER -m $USER && \
    chown -R $USER:$USER /app

# Configurar o contêiner para rodar comandos como o usuário criado
USER $USER

# Instalar as gems necessárias
COPY Gemfile* /app/
RUN bundle install

# Copiar o restante do código da aplicação
COPY . /app/

RUN rm -f /app/tmp/pids/server.pid

# Expor a porta da aplicação Rails (padrão 3000)
EXPOSE 3000

# Comando padrão para iniciar o servidor
CMD ["rails", "server", "-b", "0.0.0.0"]
