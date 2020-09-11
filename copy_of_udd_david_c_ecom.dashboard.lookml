- dashboard: schedule_test_dashboard_1
  title: Schedule Test Dashboard 1
  layout: newspaper
  elements:
  - title: Tile1
    name: Tile1
    model: david_ecom
    explore: users
    type: looker_map
    fields: [users.count, users.zip]
    sorts: [users.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_latitude: 38.53429085143028
    map_longitude: -99.0439233183861
    map_zoom: 5
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    hidden_fields: []
    y_axes: []
    row: 0
    col: 0
    width: 8
    height: 6
  - title: New Tile
    name: New Tile
    model: david_ecom
    explore: order_items
    type: looker_single_record
    fields: [users.first_name, users.last_name, orders.id]
    sorts: [users.first_name]
    limit: 1
    column_limit: 50
    hidden_fields: []
    y_axes: []
    row: 0
    col: 8
    width: 8
    height: 6
  - title: New Tile
    name: New Tile (2)
    model: david_ecom
    explore: order_items
    type: looker_area
    fields: [orders.count, orders.created_month]
    sorts: [orders.created_month desc]
    limit: 500
    column_limit: 50
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 0
    col: 16
    width: 8
    height: 6
