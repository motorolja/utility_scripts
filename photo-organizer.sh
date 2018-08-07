#!/bin/bash
SCRIPT_USAGE="./photo-organizer.sh -i \"<input_directory>\" -o \"<output_directory>\""
while getopts "i:o:" opt; do
    case ${opt} in
        i )
            INPUT_DIRECTORY=$OPTARG
            ;;
        o )
            OUTPUT_DIRECTORY=$OPTARG
            ;;
        \? )
            echo "Invalid option: -$OPTARG" 1>&2
            exit 1
            ;;
        : )
            echo "Invalid option: -$OPTARG requires an argument" 1>&2
            exit 1
            ;;
    esac
done

if [ -z ${INPUT_DIRECTORY+x} ]; then
    echo "No input directory is set"
		echo "$SCRIPT_USAGE"
    exit 1
fi

if [ -z ${OUTPUT_DIRECTORY+x} ]; then
    echo "No output directory is set"
		echo "$SCRIPT_USAGE"
    exit 1
fi

# Scan directory and remove duplicate images
fdupes -rdN "$INPUT_DIRECTORY"
# Scan directory and sort images into the given output directory
exiftool '-Directory<CreateDate' -d "$OUTPUT_DIRECTORY/%Y/%m/%d" -r "$INPUT_DIRECTORY"
