{
  measures: {
    unique_users: {
      aggregation: 'countUnique',
      sql: '{{dimension._user}}',
    },
    total_events: {
      aggregation: 'count',
    },
  },
  properties: {
    __ip: {
      category: 'User Location',
      type: 'string',
    },
    _city: {
      category: 'User Location',
      type: 'string',
    },
    _region: {
      category: 'User Location',
      type: 'string',
    },
    _country_code: {
      category: 'User Location',
      type: 'string',
    },
    _latitude: {
      category: 'User Location',
      type: 'string',
    },
    _device_brand: {
      category: 'User Location',
      type: 'string',
    },
    _device_carrier: {
      category: 'User Location',
      type: 'string',
    },
    _device_family: {
      category: 'User Location',
      type: 'string',
    },
    _device_id: {
      category: 'User Location',
      type: 'string',
    },
    _device_manufacturer: {
      category: 'User Location',
      type: 'string',
    },
    _device_model: {
      category: 'User Location',
      type: 'string',
    },
    _server_time: {
      hidden: true,
    },
  },
  mappings: {
    eventTimestamp: '_time',
    userId: '_user',
  },
}
