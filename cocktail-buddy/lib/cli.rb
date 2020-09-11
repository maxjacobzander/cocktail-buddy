class CLI
    def run
        puts "Welcome to Cocktail Buddy!"
        sleep 2
        age_check
    end

    def age_check
        puts "Are you 21 or older?"
        puts "Please enter Yes or No"
        age_id = gets.strip.downcase
        if age_id == "no"
            puts "Thanks for trying! See you on your 21st birthday!"
            exit
        elsif age_id == "yes"
            puts "Let's make a drink!" "\n" "\n"
            sleep 1
            menu
        else
            puts "We can't serve you without ID. Please input a valid answer"
            age_check
        end
    end

    def menu
        puts "What'll it be? (Please enter the number of the cocktail you would like to make)" "\n" "\n"
        sleep 1
        Scraper.scrape_cocktails
        puts "\n"
        input = gets.strip.to_i
        if input > 10 || input == 0
            sleep 1
            puts "\n Sorry, no ordering off-menu! Please enter a valid option."
            sleep 1
            menu
        else
            puts "\n Sounds good! Lemme show you how it's done!"
            sleep 1
            cocktail = Cocktail.all[input.to_i-1]
            Scraper.scrape_recipe(input, cocktail)
            puts "\n \n #{cocktail.name}: \n \n"
            puts "Ingredients: #{cocktail.ingredients} \n \n"
            puts "Directions: #{cocktail.method} \n \n"
            continue
        end
    end

    def display_cocktail_recipe(cocktail)
        Scraper.scrape_recipe(cocktail)


    end

    def continue
        puts "Another Round?"
        puts "Please enter Yes or No"
        another_round = gets.strip.downcase
        if another_round == "no"
            puts "Thanks for using Cocktail Buddy!"
            sleep 1
            puts "Please drink responsibly."
            sleep 1
            puts "Cheers!"
            exit
        elsif another_round == "yes"
            menu
        else
            puts "Sorry, but I need a clear yes or no answer before we can make another one!"
            continue
        end
    end
end