def create_new_account
    puts "Add New Account"
    puts ""
    puts "Enter login"
    input_login = gets.chomp
    puts ""
    puts "Enter pass"
    input_password = gets.chomp
    puts ""
    puts "Enter user"
    input_username = gets.chomp
    puts ""
    newaccount = Rsaccount.create(login: input_login, password: input_password, username: input_username, banned: false, unban_request: false)
    system "clear"
    puts "Created #{newaccount.login}"
    puts "----------------------------"
    rsaccounts_page
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
            Proxies_Account.where(rsaccount_id: account[0].id).find_each do |join|
                join.delete
            end
            account[0].delete
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