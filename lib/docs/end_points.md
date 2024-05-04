# Project Details
  Tea Subscription Service that allows users to subscribe to a tea package

## Endpoints

- An endpoint to subscribe a customer to a tea subscription
- An endpoint to cancel a customer's tea subscription
- An endpoint to see all of a customer's subscription (active and cancelled)

## Data
### Tea
- Title
- Description
- Temperature
- Brew Time

### Customer
- First Name
- Last Name
- Email
- Address

### Subscription
has_many :tea_subscriptions
has_many :customer_subscriptions

- Title
- Price [Random Price]
- Frequency [once, weekly, bi-weekly]

### TeaSubscription
- Tea_id
- Subscription_id

### CustomerSubscription
- Status
- Customer_id
- Subscription_id

## Requests
### Endpoint 1 - POST CREATE a new CustomerSubscription
As a Customer, I want to subscribe to a new package so I pick the type of Subscription that I want

- "Blend Box"
  - Jasmine Green Tea
  - Blueberry White Tea
  - Morrocan Mint Tea
  - Vanilla Rooibos
  - Tropical Fruit Infusion


- "Taste Test Trio"
  - Jasmine Green Tea
  - Blueberry White Tea
  - Earl Grey Tea


- "Leafy Luxuries"
  - Matcha Pearls
  - Silver Tip White
  - Himalayan Spring
  - Golden Masala Chai
  - Sunset Oolong

- "SereniTEA"
  - Jasmine Green Tea
  - Matcha Pearls
  - Himalayan Spring
  - Vanilla Rooibos


POST "v0/api/customer_subscription"
Body:
- subscription_id
- customer_id


When either params are missing/nil, render 400
When IDs can't be found, render 404
Status: 201, created
```
{
  "data": {
    "type": "customer_subscription",
    "id": 1,
    "attributes": {
      status: "Active",
      start_date: "06/11/2022"
    }
  }
}
```
### Endpoint 2 - PATCH UPDATE a CustomerSubscription
PATCH "v0/api/customer_subscriptions/:id"
Body:
- customer_subscription_id
- status

When params are missing/nil, render 400
When IDs can't be found, render 404
Status: 204 No Content


### Endpoint 3 - GET INDEX all Subscriptions
GET "v0/api/customers/:customer_id/subscriptions"
Params:
- customer_id

Status: 200 OK
- Return data for all Subscriptions that belong to a customer

```
"data": [{
  "type": "subscription",
  "id": "1",
  "attributes": {
    "title": "Blend Box",
    "price": "30",
    "frequency": "2"
  }
}]
```
