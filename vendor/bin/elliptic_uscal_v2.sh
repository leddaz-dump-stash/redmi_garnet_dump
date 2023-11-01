outpath="/data/vendor/audio/elliptic_calib_v2"
dbgpath="/data/vendor/audio/elliptic_debug_dump"
cpypath="/mnt/vendor/persist/audio/us_cal_v2"
if [ !-d"$outpath" ]; then
touch "$outpath"
fi

if [ !-d"$dbgpath" ]; then
touch "$dbgpath"
fi

target=`getprop ro.build.product`
if [ "$target" = "garnet" ]; then

if [ "$1" = "start" ]; then
EL_calib
fi

if [ "$1" = "far2near" ]; then
killall -s SIGUSR1 EL_calib
fi

if [ "$1" = "near2far" ]; then
killall -s SIGUSR2 EL_calib
fi

if [ "$1" = "stop" ]; then
killall -s SIGINT EL_calib
cp "$outpath" "$cpypath"
fi

fi
