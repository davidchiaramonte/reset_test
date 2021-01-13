view: orders {
  sql_table_name: demo_db.orders ;;

  parameter: date_rollup {
    type: string
    default_value: "total"
    allowed_value: {
      label: "Hour of Day"
      value: "hour_of_day"
    }
    allowed_value: {
      label: "Hour"
      value: "hour"
    }
    allowed_value: {
      label: "Date"
      value: "date"
    }
    allowed_value: {
      label: "Week"
      value: "week"
    }
    allowed_value: {
      label: "Month"
      value: "month"
    }
    allowed_value: {
      label: "Fiscal Quarter"
      value: "fiscal_quarter"
    }
    allowed_value: {
      label: "Year"
      value: "year"
    }
    allowed_value: {
      label: "Fiscal Year"
      value: "fiscal_year"
    }
    allowed_value: {
      label: "Total"
      value: "total"
    }
  }

  dimension: dynamic_parameter_date {
    type: string
    sql:
    CASE WHEN {% parameter date_rollup%} = 'hour_of_day' THEN ${created_hour_of_day}
    WHEN {% parameter date_rollup%} = 'hour' THEN ${created_hour}
    WHEN {% parameter date_rollup%} = 'date' THEN ${created_date}
    WHEN {% parameter date_rollup%} = 'week' THEN ${created_week}
    WHEN {% parameter date_rollup%} = 'month' THEN ${created_month}
    WHEN {% parameter date_rollup%} = 'fiscal_quarter' THEN ${created_fiscal_quarter}
    WHEN {% parameter date_rollup%} = 'year' THEN ${created_year}
    WHEN {% parameter date_rollup%} = 'fiscal_year' THEN ${created_fiscal_year}
    ELSE ${created_date} END;;
  }

  dimension: date_passed_into_filter {
    type: string
    sql:
    CASE WHEN {% parameter date_rollup%} = 'hour_of_day' THEN 'Hour of Day'
    WHEN {% parameter date_rollup%} = 'hour' THEN 'Hour'
    WHEN {% parameter date_rollup%} = 'date' THEN 'Date'
    WHEN {% parameter date_rollup%} = 'week' THEN 'Week'
    WHEN {% parameter date_rollup%} = 'month' THEN 'Month'
    WHEN {% parameter date_rollup%} = 'fiscal_quarter' THEN 'Fiscal Quarter'
    WHEN {% parameter date_rollup%} = 'year' THEN 'Year'
    WHEN {% parameter date_rollup%} = 'fiscal_year' THEN 'Fiscal Year'
    ELSE 'Date' END ;;
  }

  dimension: third_times_the_charm {
    type: string
    sql:
    CASE WHEN {% parameter date_rollup%} = 'hour_of_day' THEN 'hour^_of^_day'
    WHEN {% parameter date_rollup%} = 'hour' THEN 'hour'
    WHEN {% parameter date_rollup%} = 'date' THEN 'date'
    WHEN {% parameter date_rollup%} = 'week' THEN 'week'
    WHEN {% parameter date_rollup%} = 'month' THEN 'month'
    WHEN {% parameter date_rollup%} = 'fiscal_quarter' THEN 'fiscal^_quarter'
    WHEN {% parameter date_rollup%} = 'year' THEN 'year'
    WHEN {% parameter date_rollup%} = 'fiscal_year' THEN 'fiscal^_year'
    ELSE 'Date' END ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: form_value {
    label: "Form Value"
    type: number
    sql: ${TABLE}.form_value ;;
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
      year,
      hour_of_day,
      hour,
      fiscal_quarter,
      fiscal_year
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
    # link: {
    #   label: "Pass param to dashboard filter"
    #   url: "https://lookerv720.dev.looker.com/dashboards-next/73?Date+Rollup={{ date_rollup._parameter_value | url_encode }}"
    # }
  }

  measure: count_with_case_sensitve_link {
    type: count
    drill_fields: [id, users.first_name, users.last_name, users.id, order_items.count]
    link: {
      label: "Pass param to dashboard filter"
      url: "/dashboards-next/73@{my_url_test}"
    }
  }
}
