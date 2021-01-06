 #!/bin/bash
 tsp  --verbose --bitrate 30000000 --max-flushed-packets 70 -I null -P regulate --packet-burst 14 -P mpeinject -p 2021 --max-queue 4096 224.200.200.200:9999 -O file test.ts
