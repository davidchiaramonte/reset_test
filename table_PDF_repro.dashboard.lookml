- dashboard: alert_test
  title: Alert Test
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - title: Alert Me
    name: Alert Me
    model: david_ecom
    explore: orders
    type: looker_column
    fields: [orders.created_date, orders.count]
    sorts: [orders.created_date desc]
    limit: 500
    dynamic_fields: [{table_calculation: today_minus_yesterday, label: Today Minus
          Yesterday, expression: "${orders.count}-offset(${orders.count},1)", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    query_timezone: UTC
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 6
  - title: Alert Me (Legacy)
    name: Alert Me (Legacy)
    model: david_ecom
    explore: orders
    type: table
    fields: [orders.created_date, orders.count]
    sorts: [orders.created_date desc]
    limit: 500
    total: true
    dynamic_fields: [{table_calculation: today_minus_yesterday, label: Today Minus
          Yesterday, expression: "${orders.count}-offset(${orders.count},1)", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true}]
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      orders.count:
        is_active: false
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    series_types: {}
    listen: {}
    row: 0
    col: 16
    width: 8
    height: 6
  - title: Alert Me (Copy)
    name: Alert Me (Copy)
    model: david_ecom
    explore: orders
    type: looker_grid
    fields: [orders.created_date, orders.count]
    sorts: [orders.created_date desc]
    limit: 500
    total: true
    dynamic_fields: [{table_calculation: today_minus_yesterday, label: Today Minus
          Yesterday, expression: "${orders.count}-offset(${orders.count},1)", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true}]
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      orders.count:
        is_active: false
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 0
    col: 8
    width: 8
    height: 6
  - title: Table with limited rows to create gaps
    name: Table with limited rows to create gaps
    model: david_ecom
    explore: orders
    type: looker_grid
    fields: [orders.created_date, orders.count]
    sorts: [orders.created_date desc]
    limit: 500
    total: true
    dynamic_fields: [{table_calculation: today_minus_yesterday, label: Today Minus
          Yesterday, expression: "${orders.count}-offset(${orders.count},1)", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true}]
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: editable
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      orders.count:
        is_active: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '6'
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    row: 6
    col: 0
    width: 8
    height: 6
  - title: Table (Legacy) with limited rows to create gaps
    name: Table (Legacy) with limited rows to create gaps
    model: david_ecom
    explore: orders
    type: table
    fields: [orders.created_date, orders.count]
    sorts: [orders.created_date desc]
    limit: 500
    total: true
    dynamic_fields: [{table_calculation: today_minus_yesterday, label: Today Minus
          Yesterday, expression: "${orders.count}-offset(${orders.count},1)", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, is_disabled: true}]
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '5'
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      orders.count:
        is_active: false
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    series_types: {}
    row: 6
    col: 8
    width: 8
    height: 6
