#!/bin/bash

# Abfrage in der Command Line
read -p "Enter new PROJECT_NAME: " NEW_PROJEKT_NAME
read -p "Enter new PROJECT_NUMBER: " NEW_PROJEKT_NUMMER

# Pfad zum existierenden Doxyfile
DOXYFILE_PATH="./Doxyfile"

# Check ob Doxyfile bereits existiert
if [ -f "$DOXYFILE_PATH" ]; then
  # Lösche PROJECT_NAME und PROJECT_NUMBER 
  sed -i '/^PROJECT_NAME *=.*/d' "$DOXYFILE_PATH"
  sed -i '/^PROJECT_NUMBER *=.*/d' "$DOXYFILE_PATH"
else
  # Doxyfile existiert nicht, erstelle eine neue Datei mit `doxygen -g`
  doxygen -g "$DOXYFILE_PATH"
fi

COMMENT_LINE=$(grep -n '^#' "$DOXYFILE_PATH" | head -n 1 | cut -d ':' -f 1)

# Füge die neuen PROJECT_NAME und PROJECT_NUMBER ein
sed -i "${COMMENT_LINE}i PROJECT_NAME = \"$NEW_PROJEKT_NAME\"" "$DOXYFILE_PATH"
sed -i "${COMMENT_LINE}i PROJECT_NUMBER = $NEW_PROJEKT_NUMMER" "$DOXYFILE_PATH"

# Führe Doxygen mit dem aktualisierten Doxyfile aus
doxygen "$DOXYFILE_PATH"

echo "Updated PROJECT_NAME to \"$NEW_PROJEKT_NAME\" , PROJECT_NUMBER to $NEW_PROJEKT_NUMMER and PROJECT_BRIEF to $NEW_PROJEKT_BRIEF in $DOXYFILE_PATH."