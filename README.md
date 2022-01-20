# README

## Developement

```
$ bundle install
$ bundle exec rake db:setup
$ bundle exec rake products:import
$ bundle exec rspec spec # run tests
```

Sampled promotions are provided in `db/seeds.rb`.

## Design Decisions

1. Currency value is stored as integer ie cents to ease numeric calculations.
2. Promotion or discount is modeled as such that it can be applied either globally at cart level or at product level if needed.
3. Shopping cart is displayed alongside products listing page. Adding products to cart is done via AJAX.
4. There is only one cart instance per user. Cart is tracked via cookies and set in products listing page due to point 3 above.
