Rest Api for Dissertation.

Tools/Technologies/DB:
* Node.js
* Express 4
* MySQL

### To install:

```sh
sudo npm install
```

### Database:
Create database using database.sql.

### To execute:

```sh
sudo node server.js
```

### API Endpoints:

* //http://localhost:3000/api

**Users**:

* GET http://localhost:3000/api/users
* GET http://localhost:3000/api/users/:user_id
* POST http://localhost:3000/api/users
* PUT http://localhost:3000/api/users
* DELETE http://localhost:3000/api/users/:email

**Electricity**:

* GET http://localhost:3000/api/electricity_values
* GET http://localhost:3000/api/electricity_values/:electricity_values_id

**Daily Readings**:

* GET http://localhost:3000/api/daily_readings
* GET http://localhost:3000/api/daily_readings/:daily_readings_id


**Weekly Readings**:

* GET http://localhost:3000/api/weekly_readings
* GET http://localhost:3000/api/weekly_readings/:weekly_readings_id

**Monitoring Configs**:

* GET http://localhost:3000/api/monitoring_configs
* GET http://localhost:3000/api/monitoring_configs/:monitoring_configs_id

**Alarming Configs**:

* GET http://localhost:3000/api/alarming_configs
* GET http://localhost:3000/api/alarming_configs/:alarming_configs_id

**Reporting Configs**:

* GET http://localhost:3000/api/reporting_configs
* GET http://localhost:3000/api/reporting_configs/:reporting_configs_id
