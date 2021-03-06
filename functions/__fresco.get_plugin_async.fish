function __fresco.get_plugin_async
  not set -q fresco_job_count; and set -U fresco_job_count 0
  for plugin in $argv
    if not contains -- $plugin $fresco_plugins
      set fresco_job_count (math $fresco_job_count + 1)
      fish -c "__fresco.get_plugin $plugin" &
    end
  end

  while true
    for c in ⣾ ⣽ ⣻ ⢿ ⡿ ⣟ ⣯ ⣷
      echo -en "  $c\r"
      sleep 0.1
    end

    if test "$fresco_job_count" -le 0
      set -e fresco_job_count
      __fresco.reload_plugins
      break
    end
  end
end
