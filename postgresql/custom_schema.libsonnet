{
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
