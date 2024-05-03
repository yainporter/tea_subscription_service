# Project Details
  Tea Subscription Service that allows users to subscribe to a tea package

## Endpoints

- An endpoint to subscribe a customer to a tea subscription
- An endpoint to cancel a customer's tea subscription
- An endpoint to see all of a customer's subscription (active and cancelled)

## Data
### Tea
has_many :tea_subscriptions

- Title
- Description
- Temperature
- Brew Time

### Customer
has_many :customer_subscriptions

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
belongs_to :subscription
belongs_to :tea

- Tea_id
- Subscription_id

### CustomerSubscription
belongs_to :customer
belongs_to :subscription

- Status [Active, Cancelled]
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


POST "v0/api/customers/:customer_id/customer_subscription"
Params:

- subscription_id
- customer_id


When either params are missing/nil, render 400
When IDs can't be found, render 404
Status: 204 NO CONTENT

### Endpoint 2 - PATCH UPDATE a CustomerSubscription
PATCH "v0/api/customers/:customer_id/customer_subscriptions/:id"
Params:
- customer_subscription_id
- customer_id
- status

When params are missing/nil, render 400
When IDs can't be found, render 404
Status: 200 OK
- Return data for updated Subscription

```
{
  type: subscriptions,
  id: 1,
  attributes: [
    id: 1,
    title: "SereniTEA",
    price: "$10.00",
    status: "Active",
    frequency: "Every week"
  ]
}
```

### Endpoint 3 - GET INDEX all Subscriptions
GET "v0/api/customers/:customer_id/tea_subscriptions"
Params:
- customer_id

When params are missing/nil, render 400
When IDs can't be found, render 404
Status: 200 OK
- Return data for all Subscriptions

```
{
  type: "customer",
  id: 1,
  attributes: {
    subscriptions: [
      type: "subscription",
      id: 1,
      attributes: {
        title: "Tea Trove",
        price: "$20.00",
        status: "Active",
        frequency: "Every month"
      },
      type: "subscription",
      id: 2,
      attributes: {
        title: "SereniTEA",
        price: "$10.00",
        status: "Active",
        frequency: "Every week"
      }
    ]
  }
}
```
