FROM ruby:3.1.1

ARG USERNAME=ruby
ARG GROUPNAME=ruby
ARG WORKDIR=${WORKDIR}
ARG UID=${UID}
ARG GID=${GID}
ARG APPDIR=${APPDIR}

# container setup
COPY docker/ruby/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Install
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update -qq \
 && apt-get install -y \
    build-essential \
    libpq-dev \
    sqlite3 libsqlite3-dev \
    nodejs yarn

# create user / group
RUN mkdir ${WORKDIR} \
 && groupadd -g ${GID} ${GROUPNAME} \
 && useradd -m -s /bin/bash -u $UID -g ${GID} ${USERNAME}

WORKDIR ${WORKDIR}
USER $USERNAME

# ruby project setup
COPY --chown=${USERNAME}:${GROUPNAME} ${APPDIR}/Gemfile ${WORKDIR}/Gemfile
COPY --chown=${USERNAME}:${GROUPNAME} ${APPDIR}/Gemfile.lock ${WORKDIR}/Gemfile.lock
RUN bundle install

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
