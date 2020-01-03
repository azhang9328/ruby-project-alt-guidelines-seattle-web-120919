def not_an_option(page)
    system "clear"
    puts "Try not fat fingering, that's not an option"
    puts ""
    if page == "main menu"
    main_menu
    elsif page == "add to proxies"
        add_to_proxies
    elsif page == "assign page"
        assign_page
    elsif page == "email page"
        emails_page
    elsif page == "rsaccount page"
        rsaccounts_page
    elsif page == "proxies page"
        proxies_page
    end 
end