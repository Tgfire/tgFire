-- Begin boobs.lua By @toofansheytani_shah :D
-- Thanks to @toofansheytani_shah for sleep function
local clock = os.clock
local function sleep(n)
  local t0 = clock()
  while clock() - t0 <= n do end
  end
  local function saveFile(url, file_name)
    -- print to server
    -- print("url to download: "..url)
    -- uncomment if needed
    local respbody = {}
    local options = {
      url = url,
      sink = ltn12.sink.table(respbody),
      redirect = true
    }

    -- nil, code, headers, status
    local response = nil

    if url:match('^https') then
      options.redirect = false
      response = {https.request(options)}
    else
      response = {http.request(options)}
    end

    local code = response[2]
    local headers = response[3]
    local status = response[4]

    if code ~= 200 then return nil end

    file_name = file_name or get_http_file_name(url, headers)

    local file_path = "./"..file_name
    -- print("Saved to: "..file_path)
    -- uncomment if needed
    file = io.open(file_path, "w+")
    file:write(table.concat(respbody))
    file:close()

    return file_path
  end
  local function getRandomButts(attempt)
    attempt = attempt or 0
    attempt = attempt + 1

    local res,status = http.request("http://api.obutts.ru/noise/1")

    if status ~= 200 then return nil end
    local data = json:decode(res)[1]

    -- The OpenBoobs API sometimes returns an empty array
    if not data and attempt <= 3 then
      print('Cannot get that butts, trying another one...')
      return getRandomButts(attempt)
    end

    return 'http://media.obutts.ru/' .. data.preview
  end
  local function getRandomBoobs(attempt)
    attempt = attempt or 0
    attempt = attempt + 1

    local res,status = http.request("http://api.oboobs.ru/noise/1")

    if status ~= 200 then return nil end
    local data = json:decode(res)[1]

    -- The OpenBoobs API sometimes returns an empty array
    if not data and attempt < 10 then
      print('Cannot get that boobs, trying another one...')
      return getRandomBoobs(attempt)
    end

    return 'http://media.oboobs.ru/' .. data.preview
  end
  function tel_fire(msg, matches)
    if matches[1] == "butts" or matches[1] == "کیون" and is_mod(msg) then
      url = getRandomButts()
      local url = saveFile(url,"data/butts.png")
      tdcli.sendPhoto(msg.chat_id_,0,0,1,nil,url,"بزن روشن شی \n:D 💦")
      sleep(4)
      io.popen("cd data && rm -rf butts.png")
    end
    if matches[1] == "boobs" or matches[1] == "ممه" and is_mod(msg) then
      url = getRandomBoobs()
      local url = saveFile(url,"data/boobs.png")
      tdcli.sendPhoto(msg.chat_id_,0,0,1,nil,url,"بزن روشن شی \n:D 💦")
      sleep(4)
      io.popen("cd data && rm -rf boobs.png")
    end
  end
  return {
    patterns = {
      "^[!/#](butts)$",
      "^[!/#](boobs)$",
      "^(کیون)$",
      "^(ممه)$",
    },
    run = tel_fire
  }
-- #End 
-- @tel_fire
