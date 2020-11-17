local schema = std.extVar('event_schema');

[schema[event_model] for event_model in std.objectValues(std.extVar('event_schema'))]
