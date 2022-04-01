function init(args)
    math.randomseed(os.time())
    requests = {}
    local p = io.popen('find requests -type f')
    local i = 0
    for filename in p:lines() do
        local f = io.open(filename, "r")
        requests[i] = f:read("*all")
        f:close()
        i = i + 1
    end
    p:close()
end

function request()
    index = math.random(#requests + 1) - 1
    data = requests[index]
    return wrk.format("POST", wrk.path, wrk.headers, data)
end
