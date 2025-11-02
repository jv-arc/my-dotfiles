#! /bin/bash

SENHA="a1234"
/usr/bin/xfreerdp /u:"$USER" /p:"$SENHA" /v:127.0.0.1:3389 /app:"C:\Users\jvctr\AppData\Local\Perplexity\Comet\Application\comet.exe" /cert:ignore
