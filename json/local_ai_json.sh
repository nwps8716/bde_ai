#!/bin/bash

# attack_log
content=$(head -n 100 /Users/Dafnee/ai_demo/json/attack.json | awk '{printf "%s\\n", $0}' | sed 's/\r//g; s/\"/\\"/g')
# marketing_log
# content=$(head -n 100 /Users/Dafnee/ai_demo/json/marketing.json | awk '{printf "%s\\n", $0}' | sed 's/\r//g; s/\"/\\"/g')

curl http://localhost:11434/api/chat -d '{
  "model": "llama3.2:1b",
  "messages": [
    {"role": "system", "content": "你是一個網頁行為分析助手，請幫我分析這些Log，並用中文回答我。"},
    {"role": "user", "content": "'"${content}"'"}
  ],
  "stream": false
}'