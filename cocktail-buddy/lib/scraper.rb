require 'open-uri'
require 'nokogiri'
require 'rest-client'
require 'json'
require 'pry'
require_relative 'cocktail'
require_relative 'cli'

class Scraper
    COCKTAIL_URL = "https://www.themanual.com/food-and-drink/easy-cocktail-recipes/"

    def self.scrape_cocktails
        html = open(COCKTAIL_URL)
        doc = Nokogiri::HTML(html)
        doc.css("h2").each.with_index(1) do | cocktail, index |
            name = cocktail.text
            Cocktail.new(name)
            puts "#{index}. #{name}"
        end

    end

    def self.scrape_recipe(input, cocktail)
        html = open(COCKTAIL_URL)
        doc = Nokogiri::HTML(html)
        case input
        when 1
            cocktail.ingredients = doc.css("ul").css("li")[33..37].map(&:text).join(', ')
            cocktail.method = doc.css("p").css("em").text.split("Method: ")[1]
        when 2
            cocktail.ingredients = doc.css("ul").css("li")[38..41].map(&:text).join(', ')
            cocktail.method = doc.css("p").css("em").text.split("Method: ")[2]
        when 3
            cocktail.ingredients = doc.css("ul").css("li")[42..44].map(&:text).join(', ')
            cocktail.method = doc.css("p").css("em").text.split("Method: ")[3]
        when 4
            cocktail.ingredients = doc.css("ul").css("li")[45..49].map(&:text).join(', ')
            cocktail.method = doc.css("p").css("em").text.split("Method: ")[4]
        when 5
            cocktail.ingredients = doc.css("ul").css("li")[50..55].map(&:text).join(', ')
            cocktail.method = doc.css("p").css("em").text.split("Method:")[5]
        when 6
            cocktail.ingredients = doc.css("ul").css("li")[56..58].map(&:text).join(', ')
            cocktail.method = doc.css("p").css("em").text.split("Method:")[6]
        when 7
            cocktail.ingredients = doc.css("ul").css("li")[59..61].map(&:text).join(', ')
            cocktail.method = doc.css("p").css("em").text.split("Method:")[7]
        when 8
            cocktail.ingredients = doc.css("ul").css("li")[62..65].map(&:text).join(', ')
            cocktail.method = doc.css("p").css("em").text.split("Method:")[8]
        when 9
            cocktail.ingredients = doc.css("ul").css("li")[66..69].map(&:text).join(', ')
            cocktail.method = doc.css("p").css("em").text.split("Method:")[9]
        when 10
            cocktail.ingredients = doc.css("ul").css("li")[70..73].map(&:text).join(', ')
            cocktail.method = doc.css("p").css("em").text.split("Method:")[10]
        end
    end
end