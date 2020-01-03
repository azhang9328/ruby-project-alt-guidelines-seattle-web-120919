#goal - max of 3-5 accounts assigned to 1 proxy, assign different proxy
#       if all have 3-5 increase limit +1 and keep assignment
#goal - back up proxy(s?) assignment in case connection to main proxy fails

def assign_accounts_to_emails
    noemailassigned = Rsaccount.all.find_all do |account|
        Rsaccount.where("email_id = ?", account.email_id).empty?
    end
    noemailassigned.each do |account|
        randemail = Email.all.sample
        account.email = randemail
        puts "Assigned #{randemail.login} to #{account.login}"
    end
    assign_page
end

def assign_proxies_to_new_rs
    noassignedproxy = Rsaccount.all.find_all do |account|
        Proxies_Account.where("rsaccount_id = ?", account.id).empty?
    end
    noassignedproxy.each do |account|
        randproxy = Proxies.all.sample
        Proxies_Account.create(rsaccount_id: account.id, proxy_id: randproxy.id)
        puts "Assigned #{randproxy.ip_address} to #{account.login}"
    end
    assign_page
end