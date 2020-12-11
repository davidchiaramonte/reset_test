- dashboard: merge_results_download_jankiness
  title: Merge Results Download Jankiness
  layout: newspaper
  elements:
  - name: Whoops Forgot to add a table calc
    title: Whoops Forgot to add a table calc
    merged_queries:
    - model: david_ecom
      explore: order_items
      type: table
      fields: [orders.created_date, orders.id, orders.status, orders.user_id, orders.count]
      sorts: [orders.user_id]
      limit: 500
      total: true
      query_timezone: America/Los_Angeles
      hidden_fields: []
      y_axes: []
    - model: david_ecom
      explore: order_items
      type: table
      fields: [users.age, users.city, users.country, users.created_date, users.email,
        users.first_name, users.last_name, users.state, users.zip, users.count, users.gender, users.id]
      sorts: [users.id]
      limit: 500
      total: true
      query_timezone: America/Los_Angeles
      hidden_fields: []
      y_axes: []
      join_fields:
      - field_name: users.id
        source_field_name: orders.user_id
    hidden_fields: []
    y_axes: []
    type: table
    total: true
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: "${orders.count}/${users.count}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    row: 0
    col: 8
    width: 8
    height: 6
  - name: Download Me
    title: Download Me
    merged_queries:
    - model: david_ecom
      explore: order_items
      type: table
      fields: [orders.created_date, orders.id, orders.status, orders.user_id, orders.count]
      sorts: [orders.user_id]
      limit: 500
      query_timezone: America/Los_Angeles
      hidden_fields: []
      y_axes: []
    - model: david_ecom
      explore: order_items
      type: table
      fields: [users.age, users.city, users.country, users.created_date, users.email,
        users.first_name, users.last_name, users.state, users.zip, users.count, users.gender, users.id]
      sorts: [users.id]
      limit: 500
      query_timezone: America/Los_Angeles
      hidden_fields: []
      y_axes: []
      join_fields:
      - field_name: users.id
        source_field_name: orders.user_id
    hidden_fields: []
    y_axes: []
    type: table
    note_state: collapsed
    note_display: below
    note_text: this is not merged result
    row: 0
    col: 0
    width: 8
    height: 6
