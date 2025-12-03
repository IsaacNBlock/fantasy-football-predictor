# Quick Start Guide - Prediction Interface

## Start the Server

The server is currently running! Just open your browser and go to:

**http://localhost:8000/prediction_interface.html**

## If the Server Isn't Running

### Option 1: Use the provided script
```bash
cd "/Users/isaacblock/Desktop/YU/Fall 2025/Capstone"
./start_server.sh
```

### Option 2: Start manually with Python
```bash
cd "/Users/isaacblock/Desktop/YU/Fall 2025/Capstone"
python3 -m http.server 8000
```

### Option 3: Use a different port (if 8000 is busy)
```bash
python3 -m http.server 8080
```
Then visit: http://localhost:8080/prediction_interface.html

## Stop the Server

If you need to stop the server, press `Ctrl+C` in the terminal where it's running, or:

```bash
# Find and kill the server process
lsof -ti:8000 | xargs kill
```

## Troubleshooting

**"Connection refused" error:**
- Make sure the server is running (check terminal for server output)
- Try a different port if 8000 is already in use
- Make sure you're using `http://` not `file://`

**"Cannot GET /prediction_interface.html":**
- Make sure you're in the correct directory
- Check that the file exists: `ls prediction_interface.html`

**CORS errors:**
- Always use a local server (http://localhost) instead of opening the HTML file directly
- The JSON file needs to be loaded via HTTP, not file:// protocol

## Current Status

✅ Server is running on port 8000
✅ All files are in place
✅ Ready to use!

