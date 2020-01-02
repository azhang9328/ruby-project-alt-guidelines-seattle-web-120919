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
                puts "I'll get to this later"
                emails_page
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
        end 
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
                p Proxies.all #Make it print info cleanly
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
        puts "1. View Assignments"
        puts "2. Assign Proxies To New RS Accounts"
        puts "3. Assign Accounts To Emails"
        puts "0. Back To Main Menu"
        input = gets.chomp
        if ["1", "2", "3"].include?(input)
            if input == "1" 
                p Proxies_Account.all
                assign_page
            elsif input == "2"
                assign_proxies_to_new_rs
            elsif input == "3"
                assign_accounts_to_emails
            end
        elsif input == "0"
            main_menu
        else 
            not_an_option("assign page")
        end
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