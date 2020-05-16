{
  add_to_cart: {
    measures: {
      total_quantity: {
        sql: '{{dimension.quantity}}',
        aggregation: 'sum',
      },
    },
    dimensions: {
      quantity: {
        category: 'Basket',
        type: 'integer',
        description: 'How many products the user added to the basket?',
      },
      brand_name: {
        type: 'string',
        category: 'Product',
      },
    },
    computed_dimensions: {
      example_computed_property: {
        category: 'Example Category',
        type: 'string',
        sql: 'concat({{dimension.product_name}}, {{dimension.product_id}})',
      },
    },
    relations: {},
  },
}
