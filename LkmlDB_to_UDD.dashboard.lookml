- dashboard: schedule_test_dashboard_2
  title: Schedule Test Dashboard 2
  layout: newspaper
  elements:
  - title: Tile1
    name: Tile1
    model: david_ecom
    explore: order_items
    type: looker_bar
    fields:
    - users.count
    - users.created_date
    fill_fields:
    - users.created_date
    filters:
      users.created_date: 30 days
    sorts:
    - users.created_date desc
    limit: 500
    column_limit: 50
    series_types: {}
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 6
#   - title: Tile2
#     name: Tile2
#     model: david_ecom
#     explore: order_items
#     type: looker_donut_multiples
#     fields:
#     - users.count
#     - users.gender
#     pivots:
#     - users.gender
#     filters:
#       users.count: NOT NULL
#     sorts:
#     - users.age_tier
#     - users.gender
#     limit: 500
#     column_limit: 50
#     stacking: ''
#     show_value_labels: true
#     label_density: 25
#     legend_position: center
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: true
#     point_style: none
#     series_types: {}
#     limit_displayed_rows: false
#     y_axis_combined: true
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     x_axis_scale: auto
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     listen: {}
#     row: 0
#     col: 8
#     width: 8
#     height: 6
  - title: Tile3
    name: Tile3
    model: david_ecom
    explore: order_items
    type: looker_line
    fields:
    - orders.created_month
    - orders.count
    fill_fields:
    - orders.created_month
    sorts:
    - orders.created_month desc
    limit: 500
    column_limit: 50
    series_types: {}
    listen: {}
    row: 0
    col: 16
    width: 8
    height: 6
