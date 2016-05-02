## README

* Ruby version: `ruby 2.2.3p173`

* System dependencies: Postgres, PostGIS, UUID, citext and unaccent postgres extensions

* Database creation: `rake:db create && rake db:migrate && rake db:seed`

* Database initialization: check the `CONSTRAINT` name in the `user_roles` table,
and paste it in the `USER_ROLE_CONSTRAINT` constant located in the `company`
model, so apartment gem drops it after creating new company.

* How to run the test suite: `rspec`
