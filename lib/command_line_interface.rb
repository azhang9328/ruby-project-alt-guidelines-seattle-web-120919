class CommandLineInterface

    # Email many -> accs one -> Proxy
    # Email many <-> proxies through accs

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
        puts "1. Proxies Options"
        puts "2. RS Accounts Options"
        puts "3. Emails Options"
        puts "4. Proxy Check"
        puts "5. Assign Stuff"        
        puts "0. Exit"
        input = gets.chomp
        if ["1", "2", "3", "4", "5"].include?(input)
            if input == "1" 
                system "clear"
                proxies_page
            elsif input == "2"
                system "clear"
                rsaccounts_page
            elsif input == "3"
                system "clear"
                emails_page
            elsif input == "4"
                system "clear"
                ping_check_all_proxies
            elsif input == "5"
                system "clear"
                assign_page
            end
        elsif input == "0"
            exit_message
        else 
            not_an_option("main menu")
        end
    end

    def emails_page
        puts "--------------------"
        puts "1. View Emails"
        puts "2. Add New Emails"
        puts "3. Main Menu"
        input = gets.chomp
        if ["1", "2", "3"].include?(input)
            if input == "1" 
                system "clear"
                p Email.all #Make it print info cleanly
                puts "-------------------"
                emails_page
            elsif input == "2"
                system "clear"

            elsif input == "3"
                system "clear"
                main_menu
            end 
        end 
    end

    def rsaccounts_page
        puts "--------------------"
        puts "1. View RS Accounts"
        puts "2. Add New RS Accounts"
        puts "3. Update Ban Status"
        puts "4. Unban Request Denied"
        puts "5. Delete Accounts"
        puts "6. Main Menu"
        input = gets.chomp
        if ["1", "2", "3", "4", "5", "6"].include?(input)
            if input == "1" 
                system "clear"
               p Rsaccount.all #Make it print info cleanly
               puts "-------------------"
               rsaccounts_page
            elsif input == "2"
                system "clear"

            elsif input == "3"
                system "clear"
                ban_flipper
            elsif input == "4"
                request_flipper
            elsif input == "5"
                delete_accounts
            elsif input == "6"
                system "clear"
                main_menu
            end 
        end 
    end

    def delete_accounts
        puts "---------------------"
        puts "Enter All Accounts to Delete"
        puts ""
        # input = gets.chomp
        input = "guarantee141@gmail.com, pspoole@gmail.com"
        loginarr = input.split(", ") 
        loginarr.find_all do |login|
            account = Rsaccount.where("login = ?", login)
            if account[0].banned && account[0].unban_request
                puts "#{account[0].login} Ban Status: #{account[0].banned} Unban Request: #{account[0].unban_request}"
                puts ""
                puts "Both are true, deleting account"
                account[0].destroy #destroy is not deleting proxies_account, destroy should delete parent & child objects
            else 
                puts "#{account[0].login} Ban Status: #{account[0].banned} Unban Request: #{account[0].unban_request}"
                puts ""
                if !account[0].banned
                    puts "Ban Status is false. Please update to true before deleting"
                    puts "Skipping #{account[0].login}"
                elsif !account[0].unban_request
                    puts "Unban Request is false. Please update to true before deleting"
                    puts "Skipping #{account[0].login}"
                end
            end
        end 
        rsaccounts_page
    end

    def request_flipper
        puts "---------------------"
        puts "Enter All Accounts Request Denied"
        puts ""
        # input = gets.chomp
        input = "guarantee141@gmail.com, pspoole@gmail.com"
        loginarr = input.split(", ") 
        loginarr.find_all do |login|
            account = Rsaccount.where("login = ?", login)
            account[0].toggle!(:unban_request)
            if account[0].banned
                puts "#{account[0].login} unban request has been denied."
            else
                puts "#{account[0].login} unban request has been approved."
            end
        end 
        rsaccounts_page
    end

    def ban_flipper
        puts "---------------------"
        puts "Enter All Accounts to update Ban Status"
        puts ""
        # input = gets.chomp
        input = "guarantee141@gmail.com, pspoole@gmail.com"
        loginarr = input.split(", ") 
        loginarr.find_all do |login|
            account = Rsaccount.where("login = ?", login)
            account[0].toggle!(:banned)
            if account[0].banned
                puts "#{account[0].login} has been banned"
            else
                puts "#{account[0].login} has been unbanned"
            end
        end 
        rsaccounts_page
    end

    def proxies_page
        puts "--------------------"
        puts "1. View Proxies"
        puts "2. Add New Proxies"
        puts "3. Main Menu"
        input = gets.chomp
        if ["1", "2", "3"].include?(input)
            if input == "1" 
                system "clear"
                p Proxy.all #Make it print info cleanly
                proxies_page
            elsif input == "2"
                system "clear"
                get_proxy_path
            elsif input == "3"
                system "clear"
                main_menu
            end 
        end 
    end

    def assign_page
        system "clear"
        puts "1. Assign Proxies To New RS Accounts"
        puts "0. Back To Main Menu"
        input = gets.chomp
        if ["1"].include?(input)
            if input == "1" 
                assign_proxies_to_new_rs
            end
        elsif input == "0"
            main_menu
        else 
            not_an_option("assign page")
        end
    end

    def assign_proxies_to_new_rs
        noassignedproxy = Rsaccount.all.find_all do |account|
            Proxies_Account.where("rsaccount_id = ?", account.id).empty?
        end
        p noassignedproxy
    end

    def ping_check_all_proxies
        Proxy.all.each do |proxy|
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
                if !Proxy.all.where("ip_address = #{proxy[0]}") #reject if already have broke
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

    def not_an_option(page)
        system "clear"
        puts "Try not fat fingering, that's not an option"
        puts ""
        if page == "main menu"
        main_menu
        elsif page == "add to proxies"
            add_to_proxies
        elsif page == "assign page"
        end 
    end

    def exit_message
        system "clear"
        puts "Sucks."
        exit
    end

end