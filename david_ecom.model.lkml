connection: "the_look"

# include all the views
include: "*.view"
include: "*.dashboard"

datagroup: david_ecom_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

datagroup: bug_repro_refresh_rate {
  sql_trigger: SELECT FLOOR(UNIX_TIMESTAMP() / (2*60*60)) ;;
  max_cache_age: "2 hours"
}

persist_with: david_ecom_default_datagroup

explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: inventory_items {
  conditionally_filter: {
    filters: [products.id: "13"]
    unless: [products.brand]
  }
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
 # exclude a single field to break a field reference for the content validator in a single explore!
 # fields: [ALL_FIELDS*,-orders.status]
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: NDT_timezone_test {
    type: left_outer
    sql_on: ${orders.created_month} = ${NDT_timezone_test.created_month} ;;
    relationship: many_to_many
  }
}

explore: orders {
  persist_for: "0 seconds"
#   always_filter: {
#     filters: {
#       field: is_order_new
#       value: "yes"
#     }
#   }
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: products {}

explore: schema_migrations {}

explore: user_data {
  join: users {
    type: left_outer
    sql_on: ${user_data.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: users {}

explore: users_nn {}

explore: always_join_test {
  from: order_items

  always_join: [orders,users]

  join: inventory_items {
    type: left_outer
    sql_on: ${always_join_test.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${always_join_test.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: bar {
  extends: [foo]
  label: "Project Analysis"
}
explore: foo {
  from: users
  label: "explore_general"
}

explore: NDT_timezone_test {}
