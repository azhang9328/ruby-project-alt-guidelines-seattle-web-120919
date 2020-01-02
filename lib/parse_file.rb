def parse_proxy_file(file)
    file.map do |proxy|
       proxyarr = proxy.split(/\D/)
        [proxyarr[0..3].join("."), proxyarr.last]
    end
end