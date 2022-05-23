# Run sudo chmod a+x monterey_to_iso.sh
# Run the script by typing ./monterey_to_iso.sh in the terminal
echo "⚠️   During the run of this script, please don't close the terminal or press any keys!\n\n"
echo "📀 Cleaning any of the previous fails of this script..."
sudo rm -rf /tmp/Install macOS Monterey.dmg
echo "✅ Cleanup complete"

echo "📀 Creating temporary .dmg file. It might take a minute or two..."
hdiutil create -o /tmp/Install macOS Monterey -size 15000m -layout SPUD -fs HFS+J
echo "✅ Creation complete"

echo "🔮 Mounting and doing magic to the volumes. It might take a while..."
hdiutil attach /tmp/Install macOS Monterey.dmg -noverify -mountpoint /Volumes/install_build
yes Y | sudo /Applications/Install\ macOS\ Monterey.app/Contents/Resources/createinstallmedia --volume /Volumes/install_build
echo "✅ Magic complete"

echo "📀 Detaching volume..."
hdiutil detach /Volumes/Install\ macOS\ Install macOS Monterey
echo "✅ Volume detached"

echo "📀 Image created! Converting the image..."
hdiutil convert /tmp/Install macOS Monterey.dmg -format UDTO -o ~/Downloads/Install macOS Monterey
echo "✅ Conversion complete"

echo "📀 Creating .ISO file..."
mkdir ~/Downloads/ISO
sudo mv ~/Downloads/Install macOS Monterey.cdr ~/Downloads/ISO/Install macOS Monterey.iso
echo "✅ Created"

echo "📀 Cleaning temporary stuff..."
sudo rm -rf /tmp/Install macOS Monterey.dmg
echo "✅ Cleanup complete"

echo "✅ Done !"
open ~/Downloads/ISO