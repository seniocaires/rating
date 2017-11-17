#!bin/bash

## Configurações do git
git config --global user.name ${GIT_USER_NAME}
git config --global user.email ${GIT_USER_EMAIL}

# Clonar o repositório
cd /tmp
git clone ${GIT_RATING_REPOSITORIO} rating

# Alterar o arquivo string-random
STRING_RANDOM=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
echo STRING_RANDOM >> /tmp/rating/shell/string-random

# Commit e push
git commit -am "Alteração do arquivo string-random"
git push

