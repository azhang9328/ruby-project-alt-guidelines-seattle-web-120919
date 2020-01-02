class Email < ActiveRecord::Base 
    has_many :rsaccounts
    has_many :proxies, through: :rsaccounts
end        # Email many -> accs one -> Proxy
# Email many <-> proxies through accs