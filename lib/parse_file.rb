def parse_proxy_file(file)
    file.map do |proxy|
       proxyarr = proxy.split(/\D/)
        [proxyarr[0..3].join("."), proxyarr.last]
    end
end

def get_proxy_file
    # test_path = "/Users/azhang/Downloads/5_socks5_proxies.txt" #change to gets.chomp
    proxy_file_path = gets.chomp
    puts ""
    until proxy_file_path.include?("Users")
        puts "Enter valid file path"
        puts ""
        proxy_file_path = gets.chomp
    end
    proxy_file = File.readlines(proxy_file_path)
    proxy_file
end