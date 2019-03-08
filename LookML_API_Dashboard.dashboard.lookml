- dashboard: lookml_api_dashboard
  title: LookML API Dashboard
  layout: newspaper
  elements:
  - title: New Tile
    name: New Tile
    model: david_ecom
    explore: order_items
    type: table
    fields:
    - users.id
    - products.count
    - orders.count
    - order_items.count
    - inventory_items.count
    sorts:
    - order_items.count desc
    limit: 10
    query_timezone: America/Los_Angeles
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Da Customers
    name: Da Customers
    model: david_ecom
    explore: order_items
    type: table
    fields:
    - users.id
    - order_items.sale_price
    - order_items.count
    sorts:
    - order_items.sale_price desc
    limit: 5
    column_limit: 50
    listen: {}
    row: 0
    col: 8
    width: 8
    height: 6
