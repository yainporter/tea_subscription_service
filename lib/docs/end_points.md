# Project Details

  Tea Subscription Service that allows users to pick a tea package and choose the frequency
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
- Type [ White, Green, Black, Oolong ]

### Customer
#### Relationships
has_many :tea_subscriptions

- First Name
- Last Name
- Email
- Address

### Subscription
has_many :tea_subscriptions

- Title
- Price [Random Price]
- Status [Active, Cancelled]
- Frequency [2 weeks, 4 weeks, 6 weeks, 8 weeks]
- Limit [3, 5]

## Requests
### Endpoint 1 - POST CREATE a new TeaSubscription
As a Customer, I want to create a new TeaSubscription, so I pick the type of Subscription that I want and I choose frequency

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


POST "v0/api/customers/:customer_id/subscription"
Params:

- subscription_id
- customer_id
- frequency


When either params are missing/nil, render 400
When IDs can't be found, render 404
Status: 204 NO CONTENT

### Endpoint 2 - PATCH UPDATE a Subscription
PATCH "v0/api/customers/:customer_id/subscription/:id"
Params:
- subscription_id
- customer_id
- frequency
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
