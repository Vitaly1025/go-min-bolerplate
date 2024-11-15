#!/bin/bash

if [ -z "$1" ]; then
  echo "Please provide: $0 <project_name>"
  exit 1
fi

NAME="$1"
NAME_WITHOUT_SERVICE_POSTFIX="$NAME"

# remove postfixes -service, _service or service
if [[ "$NAME" == *-service ]]; then
  NAME_WITHOUT_SERVICE_POSTFIX="${NAME%-service}"
elif [[ "$NAME" == *_service ]]; then
  NAME_WITHOUT_SERVICE_POSTFIX="${NAME%_service}"
elif [[ "$NAME" == *service ]]; then
  NAME_WITHOUT_SERVICE_POSTFIX="${NAME%service}"
fi

confirm_deletion() {
  read -p "Are you sure you want to delete the project '${NAME}'? [y/N]: " confirmation
  case "$confirmation" in
    [yY][eE][sS]|[yY])
      return 0
      ;;
    *)
      echo "Cancelling..."
      exit 0
      ;;
  esac
}

confirm_deletion

DELETED_FOLDERS_COUNT=0

if [ -d "cmd/${NAME}" ]; then
  rm -rf "cmd/${NAME}"
  echo "The folder 'cmd/${NAME}' was DELETED."
  DELETED_FOLDERS_COUNT=$((DELETED_FOLDERS_COUNT+1))
else
  echo "The folder 'cmd/${NAME}' doesn't exist."
fi

if [ -d "internal/${NAME_WITHOUT_SERVICE_POSTFIX}" ]; then
  rm -rf "internal/${NAME_WITHOUT_SERVICE_POSTFIX}"
  echo "The folder 'internal/${NAME_WITHOUT_SERVICE_POSTFIX}' was DELETED."
  DELETED_FOLDERS_COUNT=$((DELETED_FOLDERS_COUNT+1))
else
  echo "The folder 'cmd/${NAME_WITHOUT_SERVICE_POSTFIX}' doesn't exist."
fi

if [ "$DELETED_FOLDERS_COUNT" -eq 2 ]; then
    echo "Project '${NAME}' was successfully DELETED."
else
    echo "Project '${NAME}' wasn't exist."
fi