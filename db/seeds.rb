# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seed Agencies table
agencies = HTTParty.get('https://www.realhubapp.com/api/v2/agencies')
agencies = JSON.parse(agencies.body)
for agency in agencies
    Agency.create(name: agency['title'])
end
puts agencies seeded

# seed Campaigns table
campaigns = HTTParty.get('https://www.realhubapp.com/api/v2/campaigns')
campaigns = JSON.parse(campaigns.body)
for campaign in campaigns
    Campaign.create(
        unit_number: campaign['unit_number'],
        street_number: campaign['street_number'],
        street_name: campaign['street_name'],
        suburb_name: campaign['suburb_name']
    )
end
puts campaigns seeded

# seed Statuses table
statuses = HTTParty.get('https://www.realhubapp.com/api/v2/statuses')
statuses = JSON.parse(statuses.body)
for status in statuses
    Status.create(title: status['title'])
end
puts statuses seeded

# seed Orders table
orders = HttParty.get('https://www.realhubapp.com/api/v2/orders')
orders = JSON.parse(orders.body)
for order in orders
        Order.create(
        agency_id: order['agency_id'],
        status_id: order['status_id'],
        campaign_id: order['campaign_id'],
        title: 'A4 Brochures',
        quantity: 100
    )
end
puts orders seeded