## Overview

This project demonstrates automation of an iOS app using the [iOS Simulator MCP Server](https://github.com/joshuayoes/ios-simulator-mcp) and Model Context Protocol (MCP). The automation is driven by prompts that simulate user interactions with the app UI.

---

## MCP Server Setup

**Configure the MCP server**
The `.vscode/mcp.json` file should include:

   ```jsonc
   {
     "servers": {
       "ios-simulator": {
         "command": "npx",
         "args": [
           "-y",
           "ios-simulator-mcp"
         ]
       }
     }
   }
   ```

---

## Automation Prompts

The following steps are automated using MCP:

1. **Enter email:**
   - Enter `siam.biswas@icloud.com` in the Email field.
2. **Enter password:**
   - Enter `12345` in the Password field.
3. **Login:**
   - Tap on the Login button.
4. **Enter loan amount:**
   - Enter `10000` in the Amount field.
5. **Continue:**
   - Tap on the Continue button.
6. **Select loan offer:**
   - Select the 2nd loan offer from the list.
7. **Continue:**
   - Tap on the Continue button.
8. **Submit:**
   - Tap on the Submit button.

---

## References
- [iOS Simulator MCP Server GitHub](https://github.com/joshuayoes/ios-simulator-mcp)

---
