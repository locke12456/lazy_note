 #!/bin/bash
 tsp  --verbose --bitrate 30000000 --max-flushed-packets 70 -I null -P regulate --packet-burst 14 -P mpeinject -p 2021 --max-queue 4096 224.200.200.200:9999 -O file test.ts
 # for low bitrate
 tsp --verbose --bitrate 10000000 --max-flushed-packets 70 -I null -P regulate --packet-burst 7 -P mpeinject -b 5000000000 -p 2021 --max-queue 4096 224.200.200.200:9999 -O file test2.ts
 # for clean pid ts
 tsp --verbose --bitrate 200000000 --max-flushed-packets 70 -I null -P regulate --packet-burst 7 -P mpeinject -b 5000000000 -p 2021 --max-queue 4096 224.200.200.200:9999  -P filter -p 2021 -O file test2.ts
 # fot test
 tsp -I file test2.ts -P mpe -u  --local-address 127.0.0.1 --local-port 9999 -p 2021  -P regulate -b 50000000 -O drop
