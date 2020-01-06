- dashboard: bug_dash_dh
  title: Bug_Dash_DH_ml
  layout: newspaper
  elements:
  - title: Bug_Test_DH_
    name: Bug_Test_DH_
    model: david_ecom
    explore: users
    type: table
    fields:
    - users.age
    - users.city
    - users.count
    sorts:
    - users.count desc
    limit: 500
    query_timezone: America/Los_Angeles
    row: 0
    col: 0
    width: 8
    height: 6
