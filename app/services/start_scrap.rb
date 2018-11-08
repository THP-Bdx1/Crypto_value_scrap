require 'rubygems'
require 'nokogiri'   
require 'open-uri'

class StartScrap

    def initialize
        @url="https://coinmarketcap.com/all/views/all/"
    end

    def perform
       save(@url)
    end

    def save(url)
        puts
        puts "je commmmmmmeeeeeennnnnce"
        puts
        page = Nokogiri::HTML(open(url))
        curre_name=[]
        curre_value=[]
        page.css('a.currency-name-container').each do |curr|
            curre_name << curr.text
        end
        page.css('a.price').each do |curr| 
            curre_value << curr.text
        end
        c=0
        curre_name.length.times do 
            Currency.create!(name: curre_name[c], value: curre_value[c])
            c+=1
        end
        puts "Chargement des nouvelles valeurs"
    end


end