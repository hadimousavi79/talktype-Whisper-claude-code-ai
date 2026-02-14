#!/bin/bash
# TalkType installer for Linux

set -e

echo "Installing TalkType..."

# Check if running on Linux
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo "This installer is for Linux. See README.md for other platforms."
    exit 1
fi

# Install system dependencies
echo "Installing system dependencies..."
sudo apt-get update -qq
sudo apt-get install -y -qq xdotool xclip portaudio19-dev python3-venv

# Create venv and install
echo "Setting up Python environment..."
python3 -m venv venv
source venv/bin/activate
pip install -q -r requirements.txt

echo ""
echo "Installation complete!"
echo ""
echo "To run TalkType:"
echo "  source venv/bin/activate"
echo "  python talktype.py"
echo ""
echo "Or for faster startup, run the Whisper server first:"
echo "  python whisper_server.py &"
echo "  python talktype.py --api http://localhost:8002/transcribe"
