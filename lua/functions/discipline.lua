local M = {}

function M.cowboy()
  local notify_id = nil
  local counts = {}
  local timers = {}
  local keys = { "h", "j", "k", "l", "+", "-" }
  local arrow_keys = { "<left>", "<right>", "<up>", "<down>" }

  for _, key in ipairs(arrow_keys) do
    table.insert(keys, key)
  end

  local function show_notification(msg, icon, level)
    local ok
    ok, notify_id = pcall(vim.notify, msg, level or vim.log.levels.WARN, {
      icon = icon,
      replace = notify_id,
    })
    if not ok then
      notify_id = nil
    end
    return notify_id
  end

  local function reset_count(key)
    if timers[key] then
      timers[key]:stop()
      timers[key]:close()
      timers[key] = nil
    end
    counts[key] = 0
  end

  for _, key in ipairs(keys) do
    counts[key] = 0

    vim.keymap.set({ "n", "i", "v" }, key, function()
      if vim.v.count > 0 then
        reset_count(key)
      end

      if vim.tbl_contains(arrow_keys, key) then
        show_notification("Use hjkl to move", "✋")
        return ""
      end

      counts[key] = counts[key] + 1

      if counts[key] >= 100 then
        show_notification("Hold it Cowboy!", "🤠", vim.log.levels.WARN)
      else
        if timers[key] then
          timers[key]:again()
        else
          timers[key] = assert(vim.loop.new_timer())
          timers[key]:start(2000, 0, function()
            vim.schedule(function()
              reset_count(key)
            end)
          end)
        end
      end

      return key
    end, {
      expr = true,
      silent = true,
      desc = "Cowboy mode for " .. key,
    })
  end
end

return M
