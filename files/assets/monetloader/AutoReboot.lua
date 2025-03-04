script_name('ML-AutoReboot')
script_version_number(9)
script_version('1.2')
script_author('FYP & The MonetLoader Team')
script_description('reloads edited scripts automatically, modified for MonetLoader and Android')
script_moonloader(021)
script_properties('work-in-pause', 'forced-reloading-only')

local ffi = require 'ffi'
ffi.cdef[[
  struct timespec
  {
    long tv_sec;
    long tv_nsec;
  };

  struct stat
  {
    unsigned long long st_dev;
    unsigned char __pad0[4];
    unsigned long __st_ino;
    unsigned int st_mode;
    unsigned int st_nlink;
    int st_uid;
    int st_gid;
    unsigned long long st_rdev;
    unsigned char __pad3[4];
    long long st_size;
    unsigned long st_blksize;
    unsigned long long st_blocks;
    struct timespec st_atim;
    struct timespec st_mtim;
    struct timespec st_ctim;
    unsigned long long st_ino;
  };

  int stat(const char* path, struct stat* buf);
]]

--- Config
autoreloadDelay    = 500 -- ms
---

function main()
  -- for the reload case
  onSystemInitialized()
  while true do
    wait(autoreloadDelay)
    if files ~= nil then
      for fpath, saved_time in pairs(files) do
        local file_time = get_file_modify_time(fpath)
        if file_time ~= nil and (file_time[1] ~= saved_time[1] or file_time[2] ~= saved_time[2]) then
          local scr = find_script_by_path(fpath)
          if scr ~= nil then
            print('Reloading "' .. scr.name .. '"...')
            scr:reload()
          else
            print('Loading "' .. fpath .. '"...')
            script.load(fpath)
          end
          files[fpath] = file_time -- update time
        end
      end
    end
  end
end

function onSystemInitialized()
  if not initialized then
    init()
  end
end

function init()
  initialized = true
  files = {}
  -- store all loaded scripts
  for _, s in ipairs(script.list()) do
    local time = get_file_modify_time(s.path)
    if time ~= nil then
      files[s.path] = time
    end
  end
end

function find_script_by_path(path)
  for _, s in ipairs(script.list()) do
    if s.path == path then
      return s
    end
  end
  return nil
end

function get_file_modify_time(path)
  local stat = ffi.new('struct stat[1]')
  local status = ffi.C.stat(path, stat)
  if status ~= 0 then return nil end
  return {tonumber(stat[0].st_mtim.tv_sec), tonumber(stat[0].st_mtim.tv_nsec)}
end
