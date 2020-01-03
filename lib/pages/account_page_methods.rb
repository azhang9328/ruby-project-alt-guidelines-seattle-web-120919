def create_new_account
    new_account_text("header")
    newaccount = infonom
    createdaccount = Rsaccount.create(login: newaccount[0], password: newaccount[1], username: newaccount[2], banned: false, unban_request: false)
    system "clear"
    puts "Created new account #{createdaccount.login}"
    rsaccounts_page
end

def infonom
    infonom = ["temp", "temp", "temp"]
    new_account_text("login")
    until infonom[0] =~ /\w+@\w+\.\w+/
        infonom[0] = gets.chomp
        system "clear"
        new_account_text("login")
    end
    new_account_text("pass")
    infonom[1] = gets.chomp
    new_account_text("user")
    infonom[2] = gets.chomp
    infonom
end

def input_logins
    input = gets.chomp
    loginarr = input.split(", ") 
end

def delete_accounts
    delete_account_text("header")
    input_logins.find_all do |login|
        account = Rsaccount.where("login = ?", login)
        if !account.empty? && account[0].banned && account[0].unban_request
            puts "#{account[0].login} Ban Status: #{account[0].banned} Unban Request: #{account[0].unban_request}"
            delete_account_text("both true")
            Proxies_Account.where(rsaccount_id: account[0].id).find_each do |join|
                join.delete
            end
            account[0].delete
        elsif !account.empty? && (!account[0].banned || !account[0].unban_request)
            puts "#{account[0].login} Ban Status: #{account[0].banned} Unban Request: #{account[0].unban_request}"
            puts "Skipping #{account[0].login} "
        elsif account.empty?
            delete_account_text("0")
            rsaccounts_page
        end
    end 
    rsaccounts_page
end

def request_flipper
    request_flip_text
    input_logins.find_all do |login|
        account = Rsaccount.where("login = ?", login)
        if account[0]
            account[0].toggle!(:unban_request)
            if account[0].banned
                puts "#{account[0].login} unban request has been denied."
            else
                puts "#{account[0].login} unban request has been approved."
            end
        else 
            does_not_exist
            rsaccounts_page
        end
    end 
    rsaccounts_page
end

def ban_flipper
    ban_flip_text
    input_logins.find_all do |login|
        account = Rsaccount.where("login = ?", login)
        if account[0]
            account[0].toggle!(:banned)
            if account[0].banned
                puts "#{account[0].login} has been banned"
            else
                puts "#{account[0].login} has been unbanned"
            end
        else 
            does_not_exist
            rsaccounts_page
        end
    end 
    rsaccounts_page
end