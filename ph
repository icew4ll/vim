# install phoenix
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo
dpkg -i erlang-solutions_1.0_all.deb
[stretch]
sudo apt-get update
sudo apt-get install esl-erlang
sudo apt-get install elixi

# install hex
mix local.hex

# install phoenix archive
mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez

# install inettools
sudo apt-get install inotify-tools

# install postgres
wget -q -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg
main" >> /etc/apt/sources.list.d/pgdg.list'
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib

# connect to psql
sudo su - postgres
psql
\conninfo

# quit
\q

# list db
\l
