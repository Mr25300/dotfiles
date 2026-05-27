local state = {
    device = "default",
    nvidia_gpu = false
}

local function run_cmd(cmd)
    local handle = io.popen(cmd)

    if handle then
        local result = handle:read("*a")
        handle:close()

        if result then
            return result:gsub("%s+", "")
        end
    end
end

function state.init()
    local gpu_info = run_cmd("lspci | grep -E 'VGA|3D'")

    state.device = run_cmd("hostnamectl --static") or state.device
    state.nvidia_gpu = gpu_info and gpu_info:lower():find("nvidia")
end

return state
