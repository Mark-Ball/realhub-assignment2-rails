# Realhub Rails Test

- the app has a rails backend which populates a Postgres database via the realhub API
- the front end is built with React, which sends requests to the rails app (not the realhub API directly)

## Entity Relationships

![entity_relationship_diagram](./docs/erd.png)

Orders and agencies
- an order has 1 agency
- an agency can have many orders

Orders and campaigns
- an order has 1 campaign
- a campaign can have many orders

Orders and order items
- an order can have many order items
- an order can have many orders

Order items and statuses
- an order item can have 1 status
- a status can have many order items

Order items and artworks
- an order item can have 1 artwork
- an artwork can have many order items