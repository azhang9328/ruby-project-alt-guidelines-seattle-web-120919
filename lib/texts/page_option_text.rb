#main page options
def email_options
    puts "--------------------"
    puts "1. View Emails"
    puts "2. Add New Emails"
    puts "3. Main Menu"
end

def rsaccount_options
    puts "--------------------"
    puts "1. View RS Accounts"
    puts "2. Add New RS Accounts"
    puts "3. Update Ban Status"
    puts "4. Unban Request Denied"
    puts "5. Delete Accounts"
    puts "6. Main Menu"
end

def proxies_options
    puts "--------------------"
    puts "1. View Proxies"
    puts "2. Add New Proxies"
    puts "3. Main Menu"
end

def assign_options
    puts "1. View Assignments"
    puts "2. Assign Proxies To New RS Accounts"
    puts "3. Assign Accounts To Emails"
    puts "0. Back To Main Menu"
end

#individual page options

#Proxy
def get_path_text
    puts ""
    puts "Please give path to proxy file."
    puts ""
    puts "Test File Path: /Users/azhang/Downloads/5_socks5_proxies.txt"
end

def create_proxies_text
    puts "Add to proxies?"
    puts "y / n"
end 

#Account
def new_account_text(stage)
    if stage == "header"
        puts "Add New Account"
        puts ""
    elsif stage == "login"
        puts "Enter login"
    elsif stage == "pass"
        puts ""
        puts "Enter pass"
    elsif stage == "user"
        puts ""
        puts "Enter user"
        puts ""
    end 
end

def delete_account_text(stage)
    system "clear"
    if stage == "header"
        puts "---------------------"
        puts "Enter All Accounts to Delete"
        puts ""
    elsif stage == "both true"
        puts ""
        puts "Both are true, deleting account"
    elsif stage == "ban false"
        puts "Ban Status is false. Please update to true before deleting"
    elsif stage == "unban false"
        puts "Unban Request is false. Please update to true before deleting"
    elsif stage == "0"
        puts "No accounts to delete."
    end 
end

def request_flip_text
    puts "---------------------"
    puts "Enter All Accounts Request Denied"
    puts ""
end

def ban_flip_text
    puts "---------------------"
    puts "Enter All Accounts to update Ban Status"
    puts ""
end

def does_not_exist
    system "clear"
    puts "Does not exist, spell it right this time."
end
