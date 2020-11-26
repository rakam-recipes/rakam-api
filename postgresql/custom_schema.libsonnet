{
  click: {
    measures: {
      count_unique_devices: {

        column: '_device_id',
        aggregation: 'countUnique',
      },
      count_unique_sessions: {
        column: '_session_id',
        aggregation: 'countUnique',
      },
    },
  },
  view: {
    measures: {
      count_of_visit: {
        column: 'visit',
        aggregation: 'count',
      },
      count_unique_sessions: {
        column: '_session_id',
        aggregation: 'countUnique',
      },
      count_unique_users: {
        column: '_user',
        aggregation: 'countUnique',
      },
      total_duration_on_view: {
        column: 'duration',
        aggregation: 'sum',
      },
      count_unique_devices: {
        column: '_device_id',
        aggregation: 'countUnique',
      },
    },
  },
  add_to_cart: {
    measures: {
      total_quantity: {
        sql: '{{dimension.quantity}}',
        aggregation: 'sum',
      },
    },
    properties: {
      quantity: {
        category: 'Basket',
        description: 'How many products the user added to the basket?',
      },
      brand_name: {
        type: 'string',
        category: 'Product',
      },
      unwanted_property: {
        hidden: true,
      },
    },
    dimensions: {
      example_computed_property: {
        category: 'Example Category',
        type: 'string',
        sql: 'concat({{dimension.product_name}}, {{dimension.product_id}})',
      },
    },
  },
}
