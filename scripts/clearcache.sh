#!/bin/bash

bash ./cache.sh
echo y | exec $(rm -rf ~/Library/Application\ Support/Slack/Cache/*)
echo y | exec $(rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/*)
echo y | exec $(rm -rf ~/Library/Application\ Support/discord/Cache/*)
echo y | exec $(rm -rf ~/Library/Application\ Support/Code/Cache/*)
echo y | exec $(rm -rf ~/Library/Caches/*)
