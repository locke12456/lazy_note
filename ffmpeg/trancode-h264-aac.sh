myArray=("$@")
mkdir output
mkdir input
for arg in "${myArray[@]}"; do
   echo "$arg"

   export IN=$arg

   export OUT=${IN/.mp4/_h264.mp4}
   echo $IN
   echo $OUT
   ffmpeg -c:v h264_cuvid -i "$IN" -c:v h264_nvenc -b:v 1M -minrate 1M -maxrate 1M -bufsize 2M -c:a copy -threads 8 -f mp4 "$OUT"
   #ffmpeg -i "$IN" -c:v h264_nvenc -b:v 1M -minrate 1M -maxrate 1M -bufsize 2M -c:a aac -threads 8 -f mp4 "$OUT"
   mv "$IN" input
   mv "$OUT" output

   #rm -rf $IN
done

