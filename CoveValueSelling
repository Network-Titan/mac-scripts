#!/bin/bash

# -- Cove Info --
BACKUP_UID="201541e2-b4c1-4776-87ec-f19a23f629d8"
PROFILE_ID="266659"
INSTALL="bm#$BACKUP_UID#$PROFILE_ID#.pkg"

# -- Install Path --
cd /tmp

# -- Download Installer --
curl -f -L -o "$INSTALL" https://cdn.cloudbackup.management/maxdownloads/mxb-macosx-x86_64.pkg

# -- Install Cove Backup --
installer -pkg "$INSTALL" -target /

# -- Cleanup --
rm -f "$INSTALL"
