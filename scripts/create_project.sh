#!/bin/bash

if [ -z "$1" ]; then
  echo "Please provide: $0 <project_name>"
  exit 1
fi

NAME="$1"

NAME_WITHOUT_SERVICE_POSTFIX="$NAME"

if [[ "$NAME" == *-service ]]; then
  NAME_WITHOUT_SERVICE_POSTFIX="${NAME%-service}"
elif [[ "$NAME" == *_service ]]; then
  NAME_WITHOUT_SERVICE_POSTFIX="${NAME%_service}"
elif [[ "$NAME" == *service ]]; then
  NAME_WITHOUT_SERVICE_POSTFIX="${NAME%service}"
fi

mkdir -p "cmd/${NAME}"
mkdir -p "internal/${NAME_WITHOUT_SERVICE_POSTFIX}"

cat << EOF > "cmd/${NAME}/main.go"
package main

import "fmt"

func main() {
    fmt.Println("Hello, ${NAME}!")
}
EOF

echo "Created new project '${NAME}'"
echo " - cmd/${NAME}/main.go"
echo " - internal/${NAME}/"