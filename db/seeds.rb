# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'seeds ran'
# # access api key
# key = Rails.application.credentials.api_key

# # get array of orders
# orders = HTTParty.get('https://app.realhublive.com/api/v2/orders?include_order_items=true',
#     headers: {'x-api-token': key}
# )

# # construct arrays of all required agencies and campaigns
# agency_ids = []
# campaign_ids = []
# for order in orders
#     agency_ids.push(order['agency_id'])
#     campaign_ids.push(order['campaign_id'])
# end
# agency_ids = agency_ids.uniq
# campaign_ids = campaign_ids.uniq

# # seed Agencies table
# i = 1
# for id in agency_ids
#     agency = HTTParty.get("https://app.realhublive.com/api/v2/agencies/search?string=#{id}",
#         headers: {'x-api-token': key}
#     )
#     Agency.create(
#         id: agency[0]['id'],
#         title: agency[0]['title']
#     )
#     puts "agency created #{i}/#{agency_ids.length}"
#     i += 1
# end

# # seed Campaigns table
# i = 1
# for id in campaign_ids
#     if id
#         campaign = HTTParty.get("https://app.realhublive.com/api/v2/campaigns/#{id}",
#             headers: {'x-api-token': key}
#         )
#         Campaign.create(
#             id: campaign['id'],
#             unit_number: campaign['unit_number'],
#             street_number: campaign['street_number'],
#             street_name: campaign['street_name'],
#             suburb_name: campaign['suburb_name']
#         )
#         puts "campaign created #{i}/#{campaign_ids.length}"
#         i += 1
#     end
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
#     puts "status created #{i}/#{statuses.length}"
#     i += 1
# end

# # seed Orders table
# i = 1
# for order in orders
#     Order.create(
#         id: order['id'],
#         agency_id: order['agency_id'],
#         campaign_id: order['campaign_id']
#     )

#     for item in order['items']
#         itemResponse = HTTParty.get("https://app.realhublive.com/api/v2/order_items/#{item['id']}?include_order_item_artwork=true",
#             headers: {'x-api-token': key}
#         )
        
#         artwork_id = itemResponse['artwork'] && itemResponse['artwork']['id']

#         if itemResponse['artwork']
#             Artwork.create(
#                 id: artwork_id,
#                 url: itemResponse['artwork']['links']['download_url']
#             )
#         end

#         OrderItem.create(
#             id: itemResponse['id'],
#             title: itemResponse['title'],
#             quantity: itemResponse['quantity'],
#             status_id: itemResponse['status_id'],
#             order_id: order['id'],
#             artwork_id: artwork_id
#         )
#     end

#     puts "order created #{i}/#{orders.length}"
#     i += 1
# end