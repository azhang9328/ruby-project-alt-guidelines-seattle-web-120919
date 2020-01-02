class Proxy < ActiveRecord::Base 
    belongs_to :rsaccounts
    has_many :emails, through: :rsaccounts
end
    # Email many -> accs one -> Proxy
    # Email many <-> proxies through accs