#!/bin/bash

if [[ $(find /root/scripts -type f -name "$HTB_CHALLENGE".sh) ]]; then
  /bin/bash /root/scripts/$HTB_CHALLENGE.sh
else
    echo "No script found for challenge $HTB_CHALLENGE"
fi

