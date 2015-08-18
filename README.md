# VictorOps Notification Resource

A resource for sending VictorOps alerts.

## Source Configuration

* `url`: *Required.* VictorOps REST Endpoint.

## Behavior

### `check`: Not implemented.

### `in`: Not implemented.

### `out`: Send a VictorOps alert.

Send an alert to VictorOps, with the configured parameters.

#### Parameters

* `type`: *Required.* Alert type (INFO, WARNING, ACKNOWLEDGEMENT, CRITICAL, RECOVERY).

    CRITICAL messages raise incidents in VictorOps.

* `entity`: *Required.* The name of alerting entity.

    If not provided, a random name will be assigned. By using the same entity_id in multiple notifications, the incidents created can go through the normal incident lifecycle, from Triggered, through Acknowledged, to Resolved.

* `message`: *Required.* Any additional information from the alert item.

## Deploy with BOSH

See [github_url] for a BOSH release and instructions for integrating this resource into your Concourse via BOSH.
