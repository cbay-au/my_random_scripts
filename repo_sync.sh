#!/bin/bash

# List of repositories to sync
REPOS=(
 # "https://https://github.com/leighton-0/.dotfiles"
  "https://github.com/leighton-0/My_Random_Scripts"
  "https://github.com/leighton-0/cheat_sheets"
)

# Directory where repositories will be cloned/pulled
TARGET_DIR="$HOME/mycode/repos"

# Emoji for status
CLONE="⬇️"
CLONE_SUCCESS="⬇️✅"
CLONE_FAILURE="⬇️❌"
PULL="🔄"
PULL_SUCCESS="🔄✅"
PULL_FAILURE="🔄❌"

# Ensure target directory exists
mkdir -p "$TARGET_DIR"

# Function to clone or pull a repository
sync_repo() {
  local repo_url=$1
  local repo_name=$(basename "$repo_url" .git)
  local repo_dir="$TARGET_DIR/$repo_name"

  # Check if the directory already exists
  if [ -d "$repo_dir" ]; then
    echo "$PULL Pull latest changes for  '$repo_name'"
    cd "$repo_dir" || { echo "$PULL_FAILURE Failed to enter directory '$repo_dir'"; return; }
    if git pull; then
      echo "$PULL_SUCCESS Successfully pulled latest changes for '$repo_name'"
    else
      echo "$PULL_FAILURE Failed to pull latest changes for '$repo_name'"
    fi
  else
    echo "$CLONE  Cloning '$repo_name' Repository"
    if git clone "$repo_url" "$repo_dir"; then
      echo "$CLONE_SUCCESS Successfully cloned '$repo_name'"
    else
      echo "$CLONE_FAILURE Failed to clone '$repo_name'"
    fi
  fi
}

# Sync each repository
for repo in "${REPOS[@]}"; do
  sync_repo "$repo"
done
