# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# access api key
key = Rails.application.credentials.api_key

# seed Agencies table
# agencies = HTTParty.get('https://app.realhublive.com/api/v2/agencies',
#     headers: {'x-api-token': key}
# )
# i = 1
# for agency in agencies
#     Agency.create(title: agency['title'])
#     puts "agency created #{i}/10"
#     i += 1
# end
# puts 'all agencies seeded'

# seed Campaigns table
# campaigns = HTTParty.get('https://app.realhublive.com/api/v2/campaigns',
#     headers: {'x-api-token': key}
# )
# i = 1
# for campaign in campaigns
#     Campaign.create(
#         unit_number: campaign['unit_number'],
#         street_number: campaign['street_number'],
#         street_name: campaign['street_name'],
#         suburb_name: campaign['suburb_name']
#     )
#     puts "campaign created #{i}/20"
#     i += 1
# end
# puts 'all campaigns seeded'

# seed Statuses table
# statuses = HTTParty.get('https://app.realhublive.com/api/v2/statuses',
#     headers: {'x-api-token': key}
# )
# i = 1
# for status in statuses
#     Status.create(title: status['title'])
#     puts "status created #{i}/20"
# end
# puts 'all statuses seeded'

# seed Orders table
orders = HTTParty.get('https://app.realhublive.com/api/v2/orders',
    headers: {'x-api-token': key}
)
i = 1
for order in orders
        createdOrder = Order.create(
            agency_id: order['agency_id'],
            status_id: order['status_id'],
            campaign_id: order['campaign_id'],
            title: order['title'],
            quantity: order['total']
        )
    puts createdOrder
    puts "order created #{i}/50"
    i += 1
end
puts 'all orders seeded'