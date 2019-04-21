myArray=("$@") 
for arg in "${myArray[@]}"; do
   echo "$arg"

   export IN=$arg

   export OUT=${IN/.mp4/_h246.mp4}
   echo $OUT
   ffmpeg -i $IN -c:v nvenc_h264 -c:a ac3 -threads 8 -f mp4 $OUT

done

