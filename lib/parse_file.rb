#goal - parsing file checks contents to figure out whether its proxies or accounts or emails

def parse_proxy_file(file)
    file.map do |proxy|
       proxyarr = proxy.split(/\D/)
        [proxyarr[0..3].join("."), proxyarr.last]
    end
end

def get_proxy_file
    proxy_file_path = gets.chomp
    puts ""
    until proxy_file_path =~ /\w+\/\w+/
        puts "Enter valid file path"
        puts ""
        proxy_file_path = gets.chomp
    end
    proxy_file = File.readlines(proxy_file_path)
    proxy_file
end