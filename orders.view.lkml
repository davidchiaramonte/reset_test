view: orders {
  sql_table_name: demo_db.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  parameter: is_order_new {
    group_label: "This Errors in LookML"
    type: yesno
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: created_repro {
    datatype: date
    view_label: "Adding view label for testing"
    label: "Adding label for testing"
    type: time
    timeframes: [
      raw,
      date,
      day_of_month,
      day_of_week,
      day_of_week_index,
      day_of_year,
      fiscal_month_num,
      fiscal_quarter,
      fiscal_quarter_of_year,
      fiscal_year,
      month,
      month_name,
      month_num,
      quarter,
      quarter_of_year,
      week,
      week_of_year,
      year,
      hour_of_day,
      time,
      time_of_day
    ]
    convert_tz: no
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }


  dimension: test_dim {
    sql: case when ${user_id} < 10 then "this is one long column name" when ${user_id} > 10 then "this is another long column name" end  ;;

  }


  dimension: status_2 {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: test_for_regression {
    type: number
    sql: CASE WHEN ${status} = 'pending' THEN 1000 ELSE 10000 END ;;
    value_format_name: "usd_0"
  }

  measure: count {
    type: count
    drill_fields: [id, users.first_name, users.last_name, users.id, order_items.count]
  }
}
