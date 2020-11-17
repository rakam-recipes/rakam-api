local schema = std.extVar('event_schema');

[schema[event_model] for event_model in std.objectFields(std.extVar('event_schema'))]
