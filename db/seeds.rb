p1 = Proxy.create(ip_address: "107.172.1.142", port: 1080)
p2 = Proxy.create(ip_address: "198.23.177.5", port: 1080)

rsa1 = Rsaccount.create(login: "guarantee141@gmail.com", password: 112880, username: "guarantee141", banned: false)
rsa2 = Rsaccount.create(login: "influence141@gmail.com", password: 112880, username: "influence141", banned: false)
rsa3 = Rsaccount.create(login: "pspoole@gmail.com", password: 112880, username: "58icyrage", banned: false)
rsa4 = Rsaccount.create(login: "executive141@gmail.com", password: 112880, username: "executive141", banned: false)

e1 = Email.create(login: "guarantee141@gmail.com", password: "building89")
e2 = Email.create(login: "milkteatastesgood6@outlook.com", password: "goboom09")

pa1 = Proxies_Accounts.create(proxy_id: p1.id, rsaccount_id: rsa1.id)
pa2 = Proxies_Accounts.create(proxy_id: p2.id, rsaccount_id: rsa3.id)