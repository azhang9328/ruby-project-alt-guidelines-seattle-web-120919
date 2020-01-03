class CommandLineInterface
    def run
        system "clear"
        greet
    end

    def greet
        welcome_text
        gets.chomp
        system "clear"
        main_menu
    end

    def main_menu
        main_menu_header
        main_menu_options
        input = gets.chomp
        if ["1", "2", "3", "4", "5"].include?(input)
            system "clear"
            if input == "1" 
                proxies_page
            elsif input == "2"
                rsaccounts_page
            elsif input == "3"
                emails_page
            elsif input == "4"
                ping_check_all_proxies
            elsif input == "5"
                assign_page
            end
        elsif input == "0"
            main_menu_exit
        else 
            not_an_option("main menu")
        end
    end

    def emails_page
        email_options
        input = gets.chomp
        if ["1", "2", "3"].include?(input)
            system "clear"
            if input == "1" 
                counter = 1
                Email.all.each do |obj|
                    puts "#{counter}. #{obj.login} - #{obj.password}"
                    counter += 1
                end
                emails_page
            elsif input == "2"
                puts "I'll get to this later"
                emails_page
            elsif input == "3"
                main_menu
            end 
        else 
            not_an_option("email page")
        end 
    end

    def rsaccounts_page
        rsaccount_options
        input = gets.chomp
        if ["1", "2", "3", "4", "5", "6"].include?(input)
            if input == "1" 
                system "clear"
                counter = 1
                Rsaccount.all.each do |obj|
                    puts "#{counter}. #{obj.login} - #{obj.password} - Banned? #{obj.banned}"
                    counter += 1
                end
               rsaccounts_page
            elsif input == "2"
                system "clear"
                create_new_account
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
        else 
            not_an_option("rsaccount page")
        end 
    end

    def proxies_page    
        proxies_options
        input = gets.chomp
        if ["1", "2", "3"].include?(input)
            system "clear"
            if input == "1" 
                counter = 1
                Proxies.all.each do |obj|
                    puts "#{counter}. #{obj.ip_address}:#{obj.port}"
                    counter += 1
                end
                proxies_page
            elsif input == "2"
                get_proxy_path
            elsif input == "3"
                main_menu
            end 
        else 
            not_an_option("proxies page")
        end 
    end

    def assign_page
        assign_options
        input = gets.chomp
        if ["1", "2", "3", "0"].include?(input)
            system "clear"
            if input == "1" 
                counter = 1
                Proxies_Account.all.each do |obj|
                    puts "#{counter}. " + Rsaccount.find(obj.rsaccount_id).login + " - " + Proxies.find(obj.proxy_id).ip_address
                    counter += 1
                end
                assign_page
            elsif input == "2"
                assign_proxies_to_new_rs
            elsif input == "3"
                assign_accounts_to_emails
            elsif input == "0"
                main_menu
            end
        else 
            not_an_option("assign page")
        end
    end    

end