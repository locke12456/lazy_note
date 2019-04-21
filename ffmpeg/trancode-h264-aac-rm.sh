myArray=("$@")
mkdir output 
mkdir input
for arg in "${myArray[@]}"; do
   echo "$arg"

   export IN=$arg

   export OUT=${IN/.rmvb/_h264.mp4}
   echo $OUT
   ffmpeg -i "$IN"  -c:v h264_nvenc -b:v 512k  -c:a copy -threads 8 -f mp4 "$OUT"
   mv "$IN" input
   mv "$OUT" output
done

