#!/bin/bash
#
# The postdeploy script runs once after the app is created and not on subsequent
# deploys to the app.

unset PYTHONHOME
unset PYTHONPATH

# Create the Facebook test user account.
ansible-playbook --extra-vars "@${HOME}/messenger.json" \
  --inventory "${HOME}/inventory" "${HOME}/site.yml"
