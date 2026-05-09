#!/usr/bin/env bash
# Re-chiffre index.src.html avec staticrypt et écrit le résultat dans index.html
# Usage : ./build.sh "mot-de-passe"
# Le mot de passe n'est jamais commité.

set -e

if [ -z "$1" ]; then
  echo "Usage: ./build.sh \"mot-de-passe\""
  exit 1
fi

PASSWORD="$1"

npx -y staticrypt index.src.html -p "$PASSWORD" \
  --short \
  --remember 30 \
  --template-title "Notre Nid Bordelais" \
  --template-instructions "Page protégée — entre le mot de passe pour accéder au pilotage du foyer." \
  --template-button "Entrer" \
  --template-error "Mot de passe incorrect — réessaye" \
  --template-placeholder "Mot de passe" \
  --template-remember "Se souvenir de moi" \
  --template-color-primary "#E84C3D" \
  -d dist

cp dist/index.src.html index.html
echo "✓ index.html re-chiffré et prêt à push"
