set -eux

mkdir ~/.asdf
cd ~/.asdf
wget --quiet --output-document=- 'https://github.com/asdf-vm/asdf/releases/download/v0.18.1/asdf-v0.18.1-linux-amd64.tar.gz' | tar xz

# completions
mkdir -p "$ASDF_DIR/completions"
asdf completion zsh > "$ASDF_DIR/completions/_asdf"
