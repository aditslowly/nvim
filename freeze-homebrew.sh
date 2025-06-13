#/bin/zsh

set -e 

echo "🔒 Membekukan homebrew dan homebrew-core agar support untuk macOS Monterey"

cd $(brew --repository)
echo "📦 Checkout homebrew ke commit terakhir yang masih support macOS Monterey"
git checkout -b macOS-monterey-freeze 9042eb9


cd $(brew --repository)/Library/Taps/homebrew/homebrew-core
echo "📦 Checkout homebrew-core ke commit terakhir yang masih support macOS Monterey"
git checkout -b macOS-monterey-freeze da66cc3

echo "🔧 Menambahkan ke environment dan variable shell profile seperti .zshrc dan .bashrc"

SHELL_PROFILE =""
if [ -n "$ZSH_VERSION"]; then
  SHELL_PROFILE="$HOME/.zshrc"
elif [ -n "$BASH_VERSION"]; then
  SHELL_PROFILE="$HOME/.bash_profile"
else
  SHELL_PROFILE="$HOME/.profile"
fi

{
  echo ''
  echo '# Homebrew freeze untuk macOS Monterey'
  echo 'export HOMEBREW_NO_AUTO_UPDATE=1'
  echo 'export HOMEBREW_NO_INSTALL_FROM_API=1'
} >> "$SHELL_PROFILE"

# Reinstall semua package yang dibuild form source
echo "♻️ Menyusun ulang formula yang dibangun dari source...."
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_INSTALL_FROM_API=1

brew list --formula --build-from-source | xargs brew install

echo "😊 Selesai, homebrew nya sekarang sudah dibekukan di versi yang mendukung macOS Monterey..."
