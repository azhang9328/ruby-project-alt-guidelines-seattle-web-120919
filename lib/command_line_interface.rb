class CommandLineInterface

    def run
        system "clear"
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
               puts "-------------------"
               main_menu
            elsif input == "2"
                system "clear"
                get_proxy_path
            end
        elsif input == "3"
            exit_message
        else 
            not_an_option("main menu")
        end
    end

    def get_proxy_path
        puts ""
        puts "Please give path to proxy file."
        proxies = parse_proxy_file(get_proxy_file)
        add_to_proxies(proxies)
    end

    def add_to_proxies(proxies)
        puts "Add to proxies?"
        puts "y / n"
        input = gets.chomp
        if input == "y" 
            addedcount = 0
            rejectedcount = 0 
            proxies.each do |proxy|
                if Proxy.all.where("ip_address == #{proxy[0]}")
                    rejectedcount += 1
                else 
                    Proxy.create(ip_address: proxy[0], port: proxy[1])
                    addedcount += 1
                end
            end
            puts ""
            puts "Added #{addedcount}, rejected #{rejectedcount} for already existing."
            puts ""
            main_menu
        elsif input == "n" 
            system "clear"
            main_menu
        else 
            not_an_option("add to proxies")
        end   
    end

    def get_proxy_file
        # test_path = "/Users/azhang/Downloads/socks5_proxies.txt" #change to gets.chomp
        proxy_file_path = gets.chomp
        # proxy_file_path = test_path
        puts ""
        until proxy_file_path.include?("Users")
            puts "Enter valid file path"
            puts ""
            proxy_file_path = gets.chomp
        end
        proxy_file = File.readlines(proxy_file_path)
        proxy_file
    end

    def not_an_option(page)
        system "clear"
        puts "Try not fat fingering, that's not an option"
        puts ""
        if page == "main menu"
        main_menu
        elsif page == "add to proxies"
            add_to_proxies
        end 
    end

    def exit_message
        system "clear"
        puts "Sucks."
        Proxy.delete_all
        exit
    end

end