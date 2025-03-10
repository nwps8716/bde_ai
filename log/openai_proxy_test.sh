#!/bin/bash

# itm_log
# content=$(head -n 100 /Users/Dafnee/ai_demo/log/ltm_test_log.log | awk '{printf "%s\\n", $0}' | sed 's/\"/\\"/g')
# waf_log
content=$(head -n 100 /Users/Dafnee/ai_demo/log/waf_test_log.log | awk '{printf "%s\\n", $0}' | sed 's/\"/\\"/g')

curl -X POST https://api.chatanywhere.org/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer sk-655xtOAh1QEGMgxsv4qS9kGvLjG7GoA6UHoqUQ4B5HfFE8ei" \
  -d '{
    "model": "gpt-4o-mini",
    "messages": [
      {"role": "system", "content": "你是一個日誌分析助手，請幫我分析log，並用中文回答我。"},
      {"role": "user", "content": "'"${content}"'"}
    ]
  }'