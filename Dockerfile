FROM ruby:2.3-slim

# Instala as dependẽncias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
  build-essential nodejs libpq-dev imagemagick libmagickwand-dev

# Seta o path
ENV INSTALL_PATH /petadmin

# Cria o diretório
RUN mkdir -p ${INSTALL_PATH}

# Seta o path como diretório principal
WORKDIR ${INSTALL_PATH}

#Copia o Gemfile para dentro do container
COPY Gemfile ./

# Seta o path para as GEms
ENV BUNDLE_PATH /box

#Copia o código para dentro do container
COPY . .