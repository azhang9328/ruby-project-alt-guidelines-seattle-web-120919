# def up?(address, port) 
#     check = Net::Ping::TCP.new(address, port)
#     check.ping?
# end
#net-ping returns true if up

def ping_check_all_proxies
    Proxies.all.each do |proxy|
        ping_check(proxy.ip_address, proxy.port, 'http://whatismyip.akamai.com', nil)
    end
    main_menu
end

def ping_check(socks_server, socks_port, url, headers) #ping_check("107.172.1.142", 1080, 'http://whatismyip.akamai.com', nil)
    uri = URI(url)
    Net::HTTP.SOCKSProxy(socks_server, socks_port).start(uri.host, uri.port, use_ssl: (uri.scheme == 'https')) do |http|
        http.read_timeout = 500
        puts "launching #{uri} on #{socks_server}:#{socks_port}"
        http.get(uri, headers)
    end
end