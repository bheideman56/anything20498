#!/bin/bash
#
# The pr-predestroy script runs when review apps are destroyed by merging or
# closing the associated pull request.

unset PYTHONHOME
unset PYTHONPATH

# Destroy the Facebook test user account.
ansible-playbook --extra-vars "{'user': {'id': '$FACEBOOK_USER_ID'}}" \
  --inventory "${HOME}/inventory" --tags destroy "${HOME}/site.yml"
