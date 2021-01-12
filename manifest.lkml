project_name: "david_ecom"


constant: my_url_test {
  value: "?Date+Rollup={{ third_times_the_charm._value | url_encode }}&Created+Date={{ _filters['orders.created_date'] | url_encode }}"
}

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }
