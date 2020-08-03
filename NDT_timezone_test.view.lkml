# If necessary, uncomment the line below to include explore_source.
# include: "david_ecom.model.lkml"

view: NDT_timezone_test {
  derived_table: {
    explore_source: order_items {
      column: created_month { field: orders.created_month }
      column: count { field: orders.count }
      filters: {
        field: orders.created_month
        value: "10 months"
      }
      #bind_all_filters: yes
    }
  }
  dimension: created_month {
    type: date_month
  }
  dimension: count {
    type: number
  }
}
