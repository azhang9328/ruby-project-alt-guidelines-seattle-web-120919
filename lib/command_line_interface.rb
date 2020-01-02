class CommandLineInterface

    def run
        main_menu
    end

    def main_menu
        puts "Test Name"
        puts ""
        puts "Please give path to proxy file."
        proxies = parse_proxy_file(get_proxy_file)
        puts "Add to proxies?"
        puts "y / n"
        proxies.each do |proxy|
            
        end
    end

    def get_proxy_file
        test_path = "/Users/azhang/Downloads/socks5_proxies.txt"
        # proxy_file_path = gets.chomp
        proxy_file_path = test_path
        puts ""
        until proxy_file_path.include?("Users")
            puts "Enter valid file path"
            puts ""
            proxy_file_path = gets.chomp
        end
        proxy_file = File.readlines(proxy_file_path)
        proxy_file
    end

end