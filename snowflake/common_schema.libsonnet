{
  measures: {
    unique_users: {
      aggregation: 'countUnique',
      sql: '{{dimension.user}}',
      description: "Number of unique users that are identified via `rakam.setUserId` call in the SDK"
    },
    unique_devices: {
      aggregation: 'countUnique',
      sql: '{{dimension.device_id}}',
      description: "The number of unique devices that performed an event."
    },
    unique_sessions: {
      aggregation: 'countUnique',
      sql: '{{dimension.session_id}}',
      description: "The number of unique sessions that performed an event."
    },
    total_events: {
      aggregation: 'count',
      description: "The total number of events performed."
    },
  },
  dimensions: {
    __ip: {
      category: 'User Location',
      type: 'string',
      description: "The IP address of the user."
    },
    _city: {
      category: 'User Location',
      type: 'string',
      description: "The city of the user."
    },
    _region: {
      category: 'User Location',
      type: 'string',
      description: "The region of the user."
    },
    _country_code: {
      category: 'User Location',
      type: 'string',
      description: "The country code of the user."
    },
    _latitude: {
      category: 'User Location',
      type: 'string',
      description: "The latitude of the user."
    },
    _device_brand: {
      category: 'User Location',
      type: 'string',
      description: "The device brand of the user."
    },
    _device_carrier: {
      category: 'User Location',
      type: 'string',
      description: "The device carrier of the user."
    },
    _device_family: {
      category: 'User Location',
      type: 'string',
      description: "The device family of the user."
    },
    _device_id: {
      category: 'User Location',
      type: 'string',
      description: "The device ID of the user."
    },
    _device_manufacturer: {
      category: 'User Location',
      type: 'string',
      description: "The device manufacturer of the user."
    },
    _device_model: {
      category: 'User Location',
      type: 'string',
      description: "The device model of the user."
    },
  },
  columns: {
    time: {
      column: '_TIME',
      description: "The timestamp of the event set when the event is performed.",
      type: 'timestamp',
    },
    server_time: {
      column: '_SERVER_TIME',
      description: "The timestamp of the event set by rakam API when the server received the event.",
      type: 'timestamp',
    },
    user: {
      column: '_USER',
      type: 'string',
      description: "The user ID of the user.",
    },
  },
  mappings: {
    eventTimestamp: 'time',
    userId: 'user',
    deviceId: 'device_id',
  },
}
