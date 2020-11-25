{
  measures: {
    unique_users: {
      aggregation: 'countUnique',
      sql: '{{dimension._user}}',
    },
    unique_devices: {
      aggregation: 'countUnique',
      sql: '{{dimension._device_id}}',
    },
    unique_sessions: {
      aggregation: 'countUnique',
      sql: '{{dimension._session_id}}',
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
  },
  mappings: {
    eventTimestamp: '_time',
    userId: '_user',
    deviceId: '_device_id',
  },
  relations: {

  },
}
