#!/bin/bash

# Start local HTTP server for Prediction Interface
# Usage: ./start_server.sh [port]
# Default port: 8000

PORT=${1:-8000}
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Starting HTTP server..."
echo "Directory: $DIR"
echo "Port: $PORT"
echo ""
echo "Open your browser and go to:"
echo "http://localhost:$PORT/prediction_interface.html"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

cd "$DIR"
python3 -m http.server "$PORT"

