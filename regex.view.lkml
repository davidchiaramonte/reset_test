view: customers_orgs {
  derived_table: {
    sql_trigger_value: SELECT CURRENT_DATE ;;
    indexes: ["customer_id"]
    sql: select
          stripe_api_customers.id as customer_id
        , (regexp_matches(stripe_api_customers.description, '^(?:Org: |Team: )?([a-zA-Z0-9\-\_]*)(?: -)?'))[1] as org_name
      FROM source_data.stripe_api_customers
       ;;
  }

  dimension: org_name {
    type: string
    sql: ${TABLE}.org_name ;;
  }
}

view: first_plan_events {
  derived_table: {
    sql_trigger_value: SELECT CURRENT_DATE ;;
    indexes: ["org_name"]
    # Using derived "first event" here because it's probably more reliable than
    # timestamps from plan mongo ids, which may have been clobbered by
    # data migrations pre-freemium. Not positive though...
    sql: select
          org_name
        , min(timestamp) as first_timestamp
      from ${plan_updates.SQL_TABLE_NAME} as plan_updates
      group by org_name
       ;;
  }
}

view: first_paid_plan_events {
  derived_table: {
    sql_trigger_value: SELECT CURRENT_DATE ;;
    indexes: ["org_name"]
    sql: select
          org_name
        , min(timestamp) as first_timestamp
      from ${plan_updates.SQL_TABLE_NAME} as plan_updates
      where amount != 0.0
      group by org_name
       ;;
  }
}
