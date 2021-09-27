#!/bin/bash
ffmpeg -i $(youtube-dl -f 301 -g  $1) -c:v copy -c:a aac  -f hls -hls_time 10 -hls_flags delete_segments -hls_list_size 15  $2
