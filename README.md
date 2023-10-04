<div align="center">
  <img src="https://github.com/ThibautGrx/frigo_hero/assets/35230028/21556af2-9b41-4cbb-aaf2-d614eee39cec">
</div>

## 

Open-source solution for sharing by giving away and getting in your community for free, aiming to reduce food waste.

## Demo

[frigohero.eu](http://frigohero.eu)

## Installation

To launch the application, follow these steps:

Run `bundle install`

Run `rails db:create`

Run `rails db:migrate`

Run `rails db:seed`

Run `rails s`

Then, open your browser and navigate to http://localhost:3000 to access the application.

## Running with Docker
If you prefer to run the project using Docker, follow these steps:

Make sure you have Docker and docker-compose installed on your system. You can download and install Docker from the official website: https://www.docker.com/get-started

Set environment variables with .env file

``` 
POSTGRES_HOST=db
POSTGRES_USER=frigo_hero
POSTGRES_PASSWORD=<your_password>
POSTGRES_DB=frigo_hero
```

Build the Docker container by running the following command in the project's root directory:
`docker-compose build`
Once the build is complete, start the Docker container using the following command:
`docker-compose up`
Docker will start building and running the container based on the configuration provided in the docker-compose.yml file.
After the container is up and running, you need to set up the application's database. In a separate terminal, run the following commands:

`docker-compose run app rails db:create`

`docker-compose run app rails db:migrate`

`docker-compose run app rails db:seed`


Finally, the Rails server should be running inside the Docker container. 

You can access the application by opening your browser and navigating to http://localhost:3000.


## License

Frigo Hero is released under the [GNU/AGPLv3](http://opensource.org/licenses/AGPL-3.0)
license.
