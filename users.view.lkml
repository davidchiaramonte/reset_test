view: users {
  sql_table_name: demo_db.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age_age_age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  parameter: age_buckets {
    type: string
  }

  dimension: age_compare_groups {

    sql:
    {% assign my_array = age_buckets._parameter_value | remove: "'" | split: "," %}
        {% assign sort = '-1' %}
    {% assign last_group_max_label = ' 0' %}
    case
    {%for element in my_array%}
    {% assign sort = sort | plus: 1 %}
      when ${age}<{{element}} then '{{sort}}. {{last_group_max_label}} < N < {{element}}'
      {% assign last_group_max_label = element %}
    {%endfor%}
    {% assign sort = sort | plus: 1 %}
      when ${age}>={{last_group_max_label}} then '{{sort}}. >= {{last_group_max_label}}'
    else 'unknown'
    end
          ;;

    }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: genderzzz {
    type: string
    sql: CASE WHEN ${TABLE}.gender = 'm' THEN null ELSE ${TABLE}.gender END ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: countzz {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      events.count,
      orders.count,
      user_data.count
    ]
  }
}
