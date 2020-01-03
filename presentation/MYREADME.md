# Project Name To Be Determined
---

## About
---
Basic program for creating and keeping track of account data.

## Install
---
1. Clone or download from repo.
2. If database/schema does not exist yet run `rake db:migrate`.
3. If no test objects exist, run `rake db:seed` or run using `ruby bin/run.rb` to add your own.

## Program Navigation/Example Useage
---
### Main Menu
![main menu](/presentation/screenshots/main_menu.png)
### Proxies Page
![proxy page](/presentation/screenshots/proxy_page.png)
- View Proxies
    ![view proxies](/presentation/screenshots/view_proxies.png)
- Add New Proxies
    1. ![add new proxies 01](/presentation/screenshots/add_new_proxies_01.png)
    ---
    2. ![add new proxies 02](/presentation/screenshots/add_new_proxies_02.png)
### Accounts Page
![account page](/presentation/screenshots/account_page.png)
- Add New Accounts
    1. ![add new account 01](/presentation/screenshots/add_new_account_01.png)
    ---
    2. ![add new account 02](/presentation/screenshots/add_new_account_02.png)
- Update Ban Status
    1. ![update acc ban status 01](/presentation/screenshots/update_acc_ban_01.png)
    ---
    2. ![update acc ban status 02](/presentation/screenshots/update_acc_ban_02.png)
- Delete Accounts 
(ban status & unban request both must be true)
    1. ![delete account 01](/presentation/screenshots/delete_account_01.png)
    ---
    2. ![delete account 02](/presentation/screenshots/delete_account_02.png)
### Proxy Check
Runs through all current proxies to test connections
![proxy check](/presentation/screenshots/proxy_check.png)
### Assignment Page
![assignment page](/presentation/screenshots/assignment_page.png)
- Assign Proxies to New Accounts(that don't have one already)
    ![assign proxies accs](/presentation/screenshots/assign_proxies_accs.png)
        