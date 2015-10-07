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

  # if name = row.css('td')[0].css('strong').text()
  # else name = row.css('td')[0].css('a').text()
  # end
 # name = row.css('td')[0].css('a').text()
 if row.css('td')[0].css('strong')
   name = row.css('td')[0].css('strong').text()
 elsif row.css('td')[0].css('a')
   name = row.css('td')[0].css('a').text()
 end
  science = row.css('td')[0].css('em').text()
  name = name.gsub(science, '')
  description = row.css('td').last.text().gsub('See Web Page', "")
  # img = row.css('td')[1]

  { name: name,
    science: science,
    description: description
  }
end




data[29..138].each do |plant|

Plant.create({  name: plant[:name],
  science: plant[:science],
  description: plant[:description]
})

end

require 'nokogiri'
require 'open-uri'
require 'json'

url = "http://www.thegardenhelper.com/hpprofiles.html"
doc = Nokogiri::HTML(open(url))

data =  doc.css('tr').map do |row|

img = row.css('td')[1].css('href')

{img: img}
end
