from ruby:2.7.2

env DEBIAN_FRONTEND=noninteractive \
  NODE_VERSION=14.15.4

run sed -i '/deb-src/d' /etc/apt/sources.list && \
  apt-get update && \
  apt-get install -y build-essential apt-transport-https libpq-dev postgresql-client

run curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
run echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
run apt-get update && apt-get install -y --no-install-recommends nodejs yarn

run curl -sSL "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" | tar xfJ - -C /usr/local --strip-components=1 && \
  npm install npm -g

workdir /app