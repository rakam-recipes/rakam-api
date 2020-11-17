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
      description: 'The exact timestamp when this event is occurred in UTC.',
      type: 'timestamp',
    },
    server_time: {
      column: 'SERVER_TIME',
      description: 'The exact timestamp when this event is stored on Snowflake. The timezone depends on the server location',
      type: 'timestamp',
    },
    user: {
      column: '_USER',
      type: 'string',
      description: 'The user id set by the SDK',
    },
  },
  mappings: {
    eventTimestamp: 'time',
    userId: 'user',
    deviceId: 'device_id',
  },
}
