# Hometime Test

### Approach

For this test scenario, I created an endpoint for each given payload format. The two varying payloads are assumed to be coming from 2 different services that this test app integrates. 

For brevity, I named the source of 1st payload as `Service A` and the 2nd payload source as 'Service B'.

The 2 payload

## Setup

### Install

```bash
bundle install
yarn install
rails db:migrate
```

### Run the app

```bash
rails s
```

## Accessing the endpoints

### Service Payload Format 1

To send the 1st payload format, send a POST request to the endpoint below.

`POST http://localhost:3000/integrations/service_a/`

Successful request will return a status of `201 Created`.

### Service Payload Format 2

To send the 2nd payload format, send a POST request to the endpoint below:

`POST http://localhost:3000/integrations/service_b/`

Successful request will return a status of `201 Created`.

## Viewing the Reservations

To have a quick skeletal preview of the reservations data, access this link [http://localhost:3000](http://localhost:3000).

## Tests

This example uses [RSpec](http://rspec.info) for tests.

To execute all of the test specs, run the following command at the root folder.

```bash
rspec
```