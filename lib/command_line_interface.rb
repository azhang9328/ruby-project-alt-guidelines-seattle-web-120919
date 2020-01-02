class CommandLineInterface

    def run
        greet
    end

    def greet
        puts "Sorry you clicked opened Trash Account Creater"
        puts ""
        puts "No clue what this does? That's fine, enter anything for main menu."
        gets.chomp
        system "clear"
        main_menu
    end

    def main_menu
        puts "Main Menu"
        puts "---------"
        puts ""
        puts "1. View Proxies"
        puts "2. Add New Proxies"
        puts "3. Exit"
        input = gets.chomp
        if ["1", "2"].include?(input)
            if input == "1" 
               p Proxy.all
            elsif input == "2"
                get_proxy_path
            end
        elsif input == "3"
            exit_message
        else 
            not_an_option
        end
    end

    def get_proxy_path
        system "clear"
        puts ""
        puts "Please give path to proxy file."
        proxies = parse_proxy_file(get_proxy_file)
        system "clear"
        puts "Add to proxies?"
        puts "y / n"
        input = gets.chomp
        if input == "y" 
            proxies.each do |proxy|
                 Proxy.create(ip_address: proxy[0], port: proxy[1])
            end
        else 
            system "clear"
            main_menu
        end   
    end

    def get_proxy_file
        test_path = "/Users/azhang/Downloads/socks5_proxies.txt" #change to gets.chomp
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

    def not_an_option
        system "clear"
        puts "Try not fat fingering, that's not an option"
        puts ""
        main_menu
    end

    def exit_message
        system "clear"
        puts "Sucks."
        exit
    end

end