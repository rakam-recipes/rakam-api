{
  measures: {
    unique_users: {
      aggregation: 'countUnique',
      sql: '{{dimension.user}}',
    },
    unique_devices: {
      aggregation: 'countUnique',
      sql: '{{dimension.device_id}}',
    },
    unique_sessions: {
      aggregation: 'countUnique',
      sql: '{{dimension.session_id}}',
    },
    total_events: {
      aggregation: 'count',
    },
  },
  dimensions: {
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
  },
  columns: {
    time: {
      column: '_TIME',
      description: '',
      type: 'timestamp',
    },
    server_time: {
      column: '_SERVER_TIME',
      description: '',
      type: 'timestamp',
    },
    user: {
      column: '_USER',
      type: 'string',
      description: '',
    },
  },
  mappings: {
    eventTimestamp: 'time',
    userId: 'user',
    deviceId: 'device_id',
  },
}
