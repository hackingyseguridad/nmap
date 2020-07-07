description = [[
Path traversal script para Nmap
]]

local http = require "http"
local shortport = require "shortport"
local vulns = require "vulns"
local stdnse = require "stdnse"
local string = require "string"

---
-- @hackyseguridad
-- nmap -p <port> --script traversal <target>
--

author = "hackingyseguridad.com"
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"
categories = { "vuln" }

portrule = shortport.http

  action = function(host, port)
  local vuln = {
    title = "Detecta F5",
    state = vulns.STATE.NOT_VULN,
    description = [[
    ]],
    IDS = {
        CVE = "CVE-2019-XXXX"
    },
    references = {
        'http://www.hackingyseguridad.com',
    },
    dates = {
        disclosure = { year = '2019', month = '04', day = '24' }
    }
  }


   -- Send a simple GET request to the server, if it returns appropiate string, then you have a vuln host
 options = {header={}}    options['header']['User-Agent'] = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1)"
 --local req = http.get(host, port, uri, options)
 local vuln_report = vulns.Report:new(SCRIPT_NAME, host, port)
 local url = stdnse.get_script_args(SCRIPT_NAME..".url") or "/tmui/login.jsp?"
 local response = http.generic_request(host, port, "GET", "/tmui/login.jsp?", options)

 if response.status == 200 then
 -- if response.status == 200 then
 vuln.state = vulns.STATE.VULN
 end

 return vuln_report:make_output(vuln)
end
