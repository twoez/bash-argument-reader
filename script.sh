function parseArguments() {
  PREVIOUS_ITEM=''
  COUNT=0
  for CURRENT_ITEM in "${@}"; do
    if [[ ${CURRENT_ITEM} == "--"* ]]; then
      printf -v "ARG_$(formatArgument "${CURRENT_ITEM}")" "%s" "1"
    else
      if [[ $PREVIOUS_ITEM == "--"* ]]; then
        printf -v "ARG_$(formatArgument "${PREVIOUS_ITEM}")" "%s" "${CURRENT_ITEM}"
      else
        printf -v "ARG_${COUNT}" "%s" "${CURRENT_ITEM}"
      fi
    fi

    PREVIOUS_ITEM="${CURRENT_ITEM}"
    (( COUNT++ ))
  done
}

function formatArgument() {
  ARGUMENT="${1^^}" # Capitalize.
  ARGUMENT="${ARGUMENT/--/}" # Remove "--".
  ARGUMENT="${ARGUMENT//-/_}" # Replace "-" with "_".
  echo "${ARGUMENT}"
}

parseArguments "${@}"
set --
