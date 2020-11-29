# Hometime Test

### Approach

For this test scenario, I created an endpoint for each given payload format. The two varying payloads are assumed to be coming from 2 different services that this test app integrates. 

For brevity, I named the source of 1st payload as `Service A` and the 2nd payload source as `Service B`.

## Setup

##### Prerequisites

The setups steps expect following tools installed on the system.

- Git
- Ruby [2.5.1] or higher.
- Yarn [1.10.1] or higher.

##### 1. Check out the repository

```bash
git clone https://github.com/dkdelosreyes/ht_test.git
```

##### 2. Install dependencies

```bash
yarn install     # This app uses adminlte for the UI
bundle install
```

##### 3. Run database migrations

Run the following commands to create and setup the database.

```bash
rails db:migrate
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```bash
rails s
```

To have a quick preview of the reservations data, access this link [http://localhost:3000](http://localhost:3000).

## Accessing the endpoints

### Service A: Payload Format 1

To send the 1st payload format, send a `POST` request to the endpoint below.

`POST http://localhost:3000/integrations/service_a/`

Successful request will return a status of `201 Created`.

### Service B: Payload Format 2

To send the 2nd payload format, send a `POST` request to the endpoint below:

`POST http://localhost:3000/integrations/service_b/`

Successful request will return a status of `201 Created`.

## Tests

This example uses [RSpec](http://rspec.info) for tests.

To execute all of the test specs, run the following command at the root folder.

```bash
rspec
```