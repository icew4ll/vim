# install nix package manager
curl https://nixos.org/nix/install | sh

# update
nix-channel --update

# query package
nix-env -qa chromium

# install pkg
nix-env --install gcc
