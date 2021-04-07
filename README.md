# Video Conferencing

Simple API which helps students book an appointment with their mentors.

### Versions:
  * Rails: 6.1.1
  * Ruby: 3.0

### Steps to run the project:
  * Install rubyonRails
  * Install PostgreSQL
  * make sure postgreSQL is running.
  * Create/Update database credentials → `config/database.yml`
  * update cors.rb → `config/initializers/cors.rb`

#### Commands:
  * `bundle` → install gems
  * `rake db:setup` → to create the databases
  * `rake db:migrate` → to create the tables
  * `rake db:seed` → to populate the mentor table

  * `rails s` → start rails server
 
## Test cases:

__command:__

  * `rspec`

## Refer to API [documentation](https://videoconferencing.docs.apiary.io/) for details about Endpoints. 
 
### Assumptions:
      
  * Call will be one on one instead of conference calls. However, I have kept in mind the possibility of scaling while designing the database.
