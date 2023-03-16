PLACEHOLDER=".placeholder"

if [ $# -eq 0 ]; then
    DIR="."
else
    DIR="$1"
fi

if [ ! -d "$DIR" ]; then
    echo "Error: $DIR is not a directory."
    exit 1
fi

find "$DIR" -type f -name "$PLACEHOLDER" -delete
find "$DIR" -type d -empty -exec touch {}/$PLACEHOLDER \;