## README

* Ruby version: `ruby 2.2.3p173`

* System dependencies: Postgres, PostGIS, uuid, citext and unaccent postgres extensions

* Database creation: `run rake:db create && rake db:seed`

* Database initialization: check the CONSTRAINT name in the user_roles table,
and paste it in the `USER_ROLE_CONSTRAINT` constant so apartment gem drops it
after creating new company.

* How to run the test suite: `rspec`

* Services (job queues, cache servers, search engines, etc.)

`rake doc:app`.
