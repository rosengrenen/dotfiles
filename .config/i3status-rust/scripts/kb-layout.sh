case "$(xset -q|grep LED| awk '{ print $10 }')" in
  "00000000") KBD="us" ;;
  "00001000") KBD="se" ;;
  *) KBD="unknown" ;;
esac

echo $KBD

