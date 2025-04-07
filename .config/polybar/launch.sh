killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -r -l warning left &
    MONITOR=$m polybar -r -l warning root &
    MONITOR=$m polybar -r -l warning right &
  done
else
  polybar -r -l warning root &
fi

echo "Polybar started..."
