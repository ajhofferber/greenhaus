# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# User.create(username: 'ashloop', password: 'hello', email: 'ajhofferber@gmail.com')



require 'nokogiri'
require 'open-uri'
require 'json'

url = "http://www.thegardenhelper.com/hpprofiles.html"
doc = Nokogiri::HTML(open(url))



data =  doc.css('tr').map do |row|
  name = row.css('td')[0].children[0].children.text()
  science = row.css('td')[0].css('em').text()
  name = name.gsub(science, '')
  description = row.css('td').last.text().gsub('See Web Page', "")


  { name: name,
    science: science,
    description: description
  }
end


data = data[29..137].map do |plant|
  if plant[:name].length > 0
    Plant.create({  name: plant[:name],
      science: plant[:science],
      description: plant[:description]
    })
  end
end.select{|d| d}


#
#
# data =  doc.css('tr')[80].css('td')[1]
#
#
# Plant.create()
#
#
# require 'nokogiri'
# require 'open-uri'
# require 'json'
#
# url = "http://www.thegardenhelper.com/hpprofiles.html"
# doc = Nokogiri::HTML(open(url))
#
# # doc.css('tr')[53].css('td')[0].children[0].children.text #how to get name value regardless of STRONG or A
#
# doc.css('tr')[40].css('td')[1].children[0].attributes["href"].value #how to get the part of the URL for photo

# data =  doc.css('tr').map do |row|
# img = row.css('td')[1].children[0].attributes["href"]
#
#
# {img: img}
# end
