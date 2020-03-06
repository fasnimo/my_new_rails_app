# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

dock_list = [["Shanghai", "Cell Phones"],["Singapore", "Cars"],["Shenzhen", "Medication"]]

dock_list.each do |title, location|
    Dock.create(title: title, location: location)
end 

# shanghai = Dock.create(title: "Shanghai", location: "Yangzte Delta")
# shanghai = Dock.create(title: "Singapore", location: "Singapore Strait")
# shanghai = Dock.create(title: "Shenzhen", location: "Pearl River Delta")

