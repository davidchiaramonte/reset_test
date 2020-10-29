view: orders {
  sql_table_name: demo_db.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: id_embed_repro {
    label: "Risk Rank"
    type: number
    sql: ${TABLE}.id ;;
    html: <p style="font-size: 40px; color: black; text-align: center;">{{rendered_value}}</p>;;
  }

  dimension: status_embed_repro {
    label: "Metropolitan Areas"
    type: string
    sql: ${TABLE}.status ;;
    html: <p style="font-size: 20px; color: black; text-align: left;">{{rendered_value}}</p>;;
  }

  dimension: static_decimal_embed_repro {
    label: "Level of Risk of Price Decline"
    type: number
    sql: cast(9 as decimal(4,2)) ;;
    html: <p style="font-size: 20px; color: black; text-align: left;">{{rendered_value}}</p>;;
  }

  dimension: number_embed_repro {
    label: "Confidence Score"
    type: number
    sql: ${TABLE}.id ;;
    html: <p style="font-size: 40px; color: black; text-align: left;">{{rendered_value}}%+</p>;;
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

#   dimension: broken_link {
#     type: string
#     sql: ${TABLE}.status ;;
#     link: {
#       label: "Hopefully this breaks!"
#       url: "https://www.google.com?q={{_filters[odrers.user_id]}}"
#     }
#   }


  dimension: status_2 {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: status_with_link_to_dash {
    type: string
    sql: ${TABLE}.status ;;
    link: {
      url: "https://lookerv714.dev.looker.com/dashboards-next/414"
      label: "Drill to Dashboard"
    }
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
    link: {
      label: "Doesn't Work for 1st Row"
      url: "https://google.com"
    }
  }
}
