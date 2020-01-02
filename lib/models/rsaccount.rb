class Rsaccount < ActiveRecord::Base
    has_one :proxies
    belongs_to :rsaccounts
end

    # Email many -> accs one -> Proxy
    # Email many <-> proxies through accs