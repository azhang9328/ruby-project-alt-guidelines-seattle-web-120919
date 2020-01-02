class CommandLineInterface
    def run
        main_menu
    end

    def main_menu
        puts "Test Name"
        puts ""
        proxy_file_path = gets.chomp
        puts ""
        until proxy_file_path.include?("Users")
            puts "Enter valid file path"
            puts ""
            proxy_file_path = gets.chomp
        end
        proxy_file = File.readlines(proxy_file_path)
        p proxy_file
    end
end