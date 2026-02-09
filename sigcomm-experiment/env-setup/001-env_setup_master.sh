#/bin/bash
# This script can be run with non-root user

sudo apt update && sudo apt install -y flex bison build-essential dwarves libssl-dev libelf-dev \
                    libnuma-dev pkg-config python3-pip python3-pyelftools \
                    libconfig-dev golang clang uuid-dev sysstat clang-format libglib2.0-dev apache2-utils cmake libjson-c-dev gdb libstdc++-12-dev nlohmann-json3-dev

sudo pip3 install meson ninja

# Install just command runner to ~/.local/bin
mkdir -p ~/.local/bin
curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to ~/.local/bin

# Add ~/.local/bin to PATH in .bashrc and .zshrc if not already present
if ! grep -q 'export PATH="\$HOME/.local/bin:\$PATH"' ~/.bashrc 2>/dev/null; then
    echo '' >> ~/.bashrc
    echo '# Add ~/.local/bin to PATH' >> ~/.bashrc
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi

if ! grep -q 'export PATH="\$HOME/.local/bin:\$PATH"' ~/.zshrc 2>/dev/null; then
    echo '' >> ~/.zshrc
    echo '# Add ~/.local/bin to PATH' >> ~/.zshrc
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
fi

# Make ~/.local/bin available in the current session
export PATH="$HOME/.local/bin:$PATH"

# cd /mydata # Use the extended disk with enough space
#
# wget --no-hsts https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.16.tar.xz
# tar -xf linux-5.16.tar.xz
# cd linux-5.16
# make olddefconfig
# scripts/config --set-str SYSTEM_TRUSTED_KEYS ""
# scripts/config --set-str SYSTEM_REVOCATION_KEYS ""
# make -j $(nproc)
# find -name *.ko -exec strip --strip-unneeded {} +
# sudo make modules_install -j $(nproc)
# sudo make install
# cd ..
#
# sudo reboot
