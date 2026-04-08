# VHS Terminal Recording Script
# Install VHS: brew install vhs (Mac) or https://github.com/charmbracelet/vhs
# Run: vhs demo.tape
# Output: demo.gif (embed in README as ![Demo](demo/demo.gif))

Output demo.gif
Set Shell "bash"
Set FontSize 15
Set Width 1100
Set Height 650
Set Theme "Dracula"
Set TypingSpeed 60ms
Set PlaybackSpeed 1

Sleep 500ms

Type "# Claude Code Powerkit — setup in 60 seconds"
Sleep 1s
Enter

Type "git clone https://github.com/Neens6655/claude-code-powerkit.git"
Sleep 500ms
Enter
Sleep 2s

Type "cd claude-code-powerkit && bash setup.sh"
Sleep 500ms
Enter
Sleep 4s

Type "# Done. Test it immediately (no API key needed):"
Sleep 1s
Enter

Type `claude "take a Playwright screenshot of google.com"`
Sleep 500ms
Enter
Sleep 3s

Type "# Now add your API keys to .mcp.json and install skills"
Sleep 1s
Enter
Type "# See SKILLS.md and MCP-SERVERS.md"
Sleep 2s
