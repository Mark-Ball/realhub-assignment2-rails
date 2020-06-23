# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# access api key
key = Rails.application.credentials.api_key

# get array of orders
orders = HTTParty.get('https://app.realhublive.com/api/v2/orders',
    headers: {'x-api-token': key}
)

# construct arrays of all required agencies and campaigns
agency_ids = []
campaign_ids = []
for order in orders
    agency_ids.push(order['agency_id'])
    campaign_ids.push(order['campaign_id'])
end
agency_ids = agency_ids.uniq
campaign_ids = campaign_ids.uniq

# seed Agencies table
i = 1
for id in agency_ids
    agency = HTTParty.get("https://app.realhublive.com/api/v2/agencies/search?string=#{id}",
        headers: {'x-api-token': key}
    )
    puts agency[id]
    # puts agency['id']
    # puts agency['title']
    # Agency.create(
    #     id: agency['id'],
    #     title: agency['title']
    # )
    puts "agency created #{i}/#{agency_ids.length}"
    i += 1
end

# # seed Campaigns table
# for id in campaign_ids
#     campaign = HTTParty.get("https://app.realhublive.com/api/v2/campaigns/#{id}",
#         headers: {'x-api-token': key}
#     )
#     Campaign.create(
#         id: campaign['id'],
#         unit_number: campaign['unit_number'],
#         street_number: campaign['street_number'],
#         street_name: campaign['street_name'],
#         suburb_name: campaign['suburb_name']
#     )
#     puts "campaign created #{i}/20"
#     i += 1
# end

# # seed Statuses table
# statuses = HTTParty.get('https://app.realhublive.com/api/v2/statuses',
#     headers: {'x-api-token': key}
# )
# i = 1
# for status in statuses
#     Status.create(
#         id: status['id'],
#         title: status['title']
#     )
#     puts "status created #{i}/20"
#     i += 1
# end
# puts 'all statuses seeded'

# # seed Orders table
# i = 1
# for order in orders
#     puts order
#     Order.create(
#         id: order['id'],
#         agency_id: order['agency_id'],
#         status_id: order['status_id'],
#         campaign_id: order['campaign_id'],
#         title: order['title'],
#         quantity: order['total']
#     )
#     puts "order created #{i}/50"
#     i += 1
# end