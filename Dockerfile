FROM ruby:3.0.6
RUN apt update -y && \
apt install -y git-core curl zlib1g-dev build-essential \
libssl-dev libreadline-dev libyaml-dev libsqlite3-dev webpack sqlite3 \
libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common \
libffi-dev libgdbm-dev libncurses5-dev automake libtool bison libffi-dev && \
apt-get install libpq-dev -y && \
apt install -y nodejs npm && \
npm install -g yarn
RUN apt-get install libpq-dev -y
RUN apt install git -y && apt install vim -y
RUN gem install rails -v 7.1.2
RUN gem install bundler:2.3.15
WORKDIR /var/www
COPY ./rails_7_with_docker .
WORKDIR  /var/www/rails_7_with_docker
RUN bundle install
RUN chmod +x ./entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]
CMD [ "bundle", "exec", "rails", "s" ]