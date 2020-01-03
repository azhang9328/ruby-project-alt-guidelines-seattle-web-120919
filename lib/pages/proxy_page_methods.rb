def get_proxy_path
    get_path_text
    proxies = parse_proxy_file(get_proxy_file)
    create_or_reject_proxies(proxies)
end

def create_or_reject_proxies(proxies)
    create_proxies_text
    input = gets.chomp
    if input == "y" 
        addedcount = 0
        rejectedcount = 0 
        proxies.each do |proxy|
            if Proxies.where("ip_address = ?", proxy[0]).empty?
                Proxies.create(ip_address: proxy[0], port: proxy[1])
                addedcount += 1
            else 
                rejectedcount += 1
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