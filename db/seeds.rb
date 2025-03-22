# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.create!(email_address: 'admin@example.com', password: 'password123', password_confirmation: 'password123')
Message.create(title: "hello world", content: '<p>this is the body</p>', encrypted_user_id: user.id)

json_companies = [
  {"name": "AT&T Inc."},
  {"name": "Verizon Communications Inc."},
  {"name": "T-Mobile US, Inc."},
  {"name": "Comcast Corporation"},
  {"name": "Charter Communications Inc."},
  {"name": "Cox Communications Inc."},
  {"name": "Altice USA, Inc."},
  {"name": "Frontier Communications Parent, Inc."},
  {"name": "Windstream Holdings, Inc."},
  {"name": "Lumen Technologies, Inc."},
  {"name": "Mediacom Communications Corporation"},
  {"name": "DISH Network Corporation"},
  {"name": "Spectrum Mobile (Charter Communications)"},
  {"name": "Xfinity Mobile (Comcast Corporation)"},
  {"name": "UScellular"},
  {"name": "Boost Mobile (DISH Network Corporation)"},
  {"name": "Cricket Wireless (AT&T Inc.)"},
  {"name": "Metro by T-Mobile"},
  {"name": "Google Fi"},
  {"name": "Visible (Verizon Communications Inc.)"},
  {"name": "Consumer Cellular"},
  {"name": "Straight Talk Wireless (TracFone Wireless, Inc.)"},
  {"name": "TracFone Wireless, Inc."},
  {"name": "Mint Mobile"},
  {"name": "Republic Wireless"},
  {"name": "Spectrum Voice (Charter Communications)"},
  {"name": "Optimum (Altice USA, Inc.)"},
  {"name": "Suddenlink Communications (Altice USA, Inc.)"},
  {"name": "Cincinnati Bell Inc."},
  {"name": "Hawaiian Telcom (Cincinnati Bell Inc.)"},
  {"name": "GCI Communication Corp."},
  {"name": "Alaska Communications Systems Group, Inc."},
  {"name": "Bluegrass Cellular"},
  {"name": "Cellcom"},
  {"name": "C Spire Wireless"},
  {"name": "Ting Mobile"},
  {"name": "Net10 Wireless (TracFone Wireless, Inc.)"},
  {"name": "Total Wireless (TracFone Wireless, Inc.)"},
]

json_companies.each do |item_data|
  Company.create(name: item_data[:name], status: "published")
end

MessageTemplate.create([
  { title: "Reminder", content: "Just a friendly reminder about our meeting." },
  { title: "Thank You", content: "Thank you for your support!" }
])