#!bin/bash

if [ $((RANDOM % 2)) = 0 ] ; then

  echo "Clonando o repositorio "${GITHUB_RATING_REPOSITORY_NAME}"..."
  rm -rf /tmp/rating
  url_repositorio="https://"${GITHUB_USER_NAME}:${GITHUB_PASSWORD}@github.com/${GITHUB_USER_NAME}/${GITHUB_RATING_REPOSITORY_NAME}".git"
  cd /tmp
  git clone ${url_repositorio} rating
  echo "Repositorio clonado em /tmp/rating!"

  echo "Alterando o arquivo /tmp/rating/shell/string-random ... "
  string_random=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
  echo ${string_random} > /tmp/rating/shell/string-random
  echo "Arquivo alterado!"

  cd /tmp/rating
  echo "Configurando git (autor) ..."
  git config user.name ${GIT_CONFIG_USER_NAME}
  git config user.email ${GIT_CONFIG_USER_EMAIL}
  echo "Adicionando para Stage Area ..."
  git add .
  echo "Commit ..."
  git commit -m "Alteracao do arquivo string-random"
  echo "Push ..."
  git push ${url_repositorio} --all

else

  echo "Random nao atendido."

fi

