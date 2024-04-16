#!/bin/bash

create_link() {
    if ln -s "$1" "$2"; then
        echo "Successfully created symlink for $2"
    else
        echo "Error creating symlink for $2. It may already exist, or the destination is not accessible."
    fi
}

create_vscode_links() {
    # Ensure paths with spaces are quoted properly
    VSCODE_USER_PATH="$HOME/Library/Application Support/Code/User"
    # Create symlinks for VSCode
    create_link "$(pwd)/vscode/snippets" "$VSCODE_USER_PATH/snippets"
    create_link "$(pwd)/vscode/settings.json" "$VSCODE_USER_PATH/settings.json"
}

create_zed_links() {
    # Ensure the Zed configuration directory exists before attempting to create symlinks
    mkdir -p "$HOME/.config/zed"
    # Create symlinks for Zed
    create_link "$(pwd)/zed/settings.json" "$HOME/.config/zed/settings.json"
    create_link "$(pwd)/zed/keymap.json" "$HOME/.config/zed/keymap.json"
}

create_nvim_links() {
    # Create symlink for Neovim
    create_link "$(pwd)/nvim" "$HOME/.config/nvim"
}

echo "Select the configuration to symlink:"
echo "0 - All"
echo "1 - VSCode"
echo "2 - Zed"
echo "3 - Neovim"
read -p "Enter your choice (0/1/2/3): " choice

case $choice in
    0)
        create_vscode_links
        create_zed_links
        create_nvim_links
        ;;
    1)
        create_vscode_links
        ;;
    2)
        create_zed_links
        ;;
    3)
        create_nvim_links
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo "Symlink creation process complete."





