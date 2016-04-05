/**
  * RestApi.
  */

var mysql   = require("mysql");

function RestApi_Router(router,connection,md5) {
    var self = this;
    self.handleRoutes(router,connection,md5);
}

/**
  * Baseurl: http://localhost:3000/api
  */
RestApi_Router.prototype.handleRoutes = function(router,connection,md5) {
    var self = this;
    router.get("/",function(req,res){
        res.json({"Message" : "Rest Api"});
    });

    /**
      * GET request for retrieving users.
      * Endpoint: http://localhost:3000/api/users
      */
    router.get("/users",function(req,res){
        var query = "SELECT * FROM ??";
        var table = ["user_login"];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error retrieving users"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "Users" : rows});
            }
        });
    });

    /**
      * GET request for retrieving user by id.
      * Endpoint: http://localhost:3000/api/users/:user_id
      */
    router.get("/users/:user_id",function(req,res){
        var query = "SELECT * FROM ?? WHERE ??=?";
        var table = ["user_login","user_id",req.params.user_id];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error retrieving user"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "Users" : rows});
            }
        });
    });

    /**
      * POST request for creating new users.
      * Endpoint: http://localhost:3000/api/users
      */
    router.post("/users",function(req,res){
        var query = "INSERT INTO ??(??,??) VALUES (?,?)";
        var table = ["user_login","user_email","user_password",req.body.email,md5(req.body.password)];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error creating a new user"});
            } else {
                res.json({"Error" : false, "Message" : "User Created!"});
            }
        });
    });

    /**
      * PUT request for updating a user.
      * Endpoint: http://localhost:3000/api/users
      */
    router.put("/users",function(req,res){
        var query = "UPDATE ?? SET ?? = ? WHERE ?? = ?";
        var table = ["user_login","user_password",md5(req.body.password),"user_email",req.body.email];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error updating the user"});
            } else {
                res.json({"Error" : false, "Message" : "Updated the password for email "+req.body.email});
            }
        });
    });

    /**
      * DELETE request for deleting user by email.
      * Endpoint: http://localhost:3000/api/users/:email
      */
    router.delete("/users/:email",function(req,res){
        var query = "DELETE from ?? WHERE ??=?";
        var table = ["user_login","user_email",req.params.email];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error deleting the user"});
            } else {
                res.json({"Error" : false, "Message" : "Deleted the user with email "+req.params.email});
            }
        });
    });

    /**
      * GET request for retrieving electricity values.
      * Endpoint: http://localhost:3000/api/electricity_values
      */
    router.get("/electricity_values",function(req,res){
        var query = "SELECT * FROM ??";
        var table = ["electricity_values"];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error retrieving electricity values"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "ElectricityValues" : rows});
            }
        });
    });

    /**
      * GET request for retrieving electricity values by id.
      * Endpoint: http://localhost:3000/api/electricity_values/:electricity_values_id
      */
    router.get("/electricity_values/:electricity_values_id",function(req,res){
        var query = "SELECT * FROM ?? WHERE ??=?";
        var table = ["electricity_values","electricity_values_id",req.params.electricity_values_id];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error retrieving electricity values by id"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "ElectricityValues" : rows});
            }
        });
    });

    /**
      * GET request for retrieving electricity daily readings.
      * Endpoint: http://localhost:3000/api/daily_readings
      */
    router.get("/daily_readings",function(req,res){
        var query = "SELECT * FROM ??";
        var table = ["daily_readings"];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error retrieving electricity daily readings"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "DailyReadings" : rows});
            }
        });
    });

    /**
      * GET request for retrieving electricity daily readings by id.
      * Endpoint: http://localhost:3000/api/daily_readings/:daily_readings_id
      */
    router.get("/daily_readings/:daily_readings_id",function(req,res){
        var query = "SELECT * FROM ?? WHERE ??=?";
        var table = ["daily_readings","daily_readings_id",req.params.daily_readings_id];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error retrieving electricity daily readings by id"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "DailyReadings" : rows});
            }
        });
    });

    /**
      * GET request for retrieving electricity weekly readings.
      * Endpoint: http://localhost:3000/api/weekly_readings
      */
    router.get("/weekly_readings",function(req,res){
        var query = "SELECT * FROM ??";
        var table = ["weekly_readings"];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error retrieving electricity weekly readings"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "WeeklyReadings" : rows});
            }
        });
    });

    /**
      * GET request for retrieving electricity weekly readings.
      * Endpoint: http://localhost:3000/api/weekly_readings/:weekly_readings_id
      */
    router.get("/weekly_readings/:weekly_readings_id",function(req,res){
        var query = "SELECT * FROM ?? WHERE ??=?";
        var table = ["weekly_readings","weekly_readings_id",req.params.weekly_readings_id];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error retrieving electricity weekly readings by id"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "WeeklyReadings" : rows});
            }
        });
    });

    /**
      * GET request for retrieving monitoring configurations.
      * Endpoint: http://localhost:3000/api/monitoring_configs
      */
    router.get("/monitoring_configs",function(req,res){
        var query = "SELECT * FROM ??";
        var table = ["monitoring_configs"];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error retrieving monitoring configurations"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "MonitoringConfigs" : rows});
            }
        });
    });

    /**
      * GET request for retrieving monitoring configurations by id.
      * Endpoint: http://localhost:3000/api/monitoring_configs/:monitoring_configs_id
      */
    router.get("/monitoring_configs/:monitoring_configs_id",function(req,res){
        var query = "SELECT * FROM ?? WHERE ??=?";
        var table = ["monitoring_configs","monitoring_configs_id",req.params.monitoring_configs_id];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error retrieving monitoring configurations by id"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "MonitoringConfigs" : rows});
            }
        });
    });

    /**
      * GET request for retrieving alarming configurations.
      * Endpoint: http://localhost:3000/api/alarming_configs
      */
    router.get("/alarming_configs",function(req,res){
        var query = "SELECT * FROM ??";
        var table = ["alarming_configs"];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error retrieving alarming configurations"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "AlarmingConfigs" : rows});
            }
        });
    });

    /**
      * GET request for retrieving alarming configurations by id.
      * Endpoint: http://localhost:3000/api/alarming_configs/:alarming_configs_id
      */
    router.get("/alarming_configs/:alarming_configs_id",function(req,res){
        var query = "SELECT * FROM ?? WHERE ??=?";
        var table = ["alarming_configs","alarming_configs_id",req.params.alarming_configs_id];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error retrieving alarming configurations by id"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "AlarmingConfigs" : rows});
            }
        });
    });

    /**
      * GET request for retrieving reporting configurations.
      * Endpoint: http://localhost:3000/api/reporting_configs
      */
    router.get("/reporting_configs",function(req,res){
        var query = "SELECT * FROM ??";
        var table = ["reporting_configs"];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error retrieving reporting configurations"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "ReportingConfigs" : rows});
            }
        });
    });

    /**
      * GET request for retrieving reporting configurations by id.
      * Endpoint: http://localhost:3000/api/reporting_configs/:reporting_configs_id
      */
    router.get("/reporting_configs/:reporting_configs_id",function(req,res){
        var query = "SELECT * FROM ?? WHERE ??=?";
        var table = ["reporting_configs","reporting_configs_id",req.params.reporting_configs_id];
        query = mysql.format(query,table);
        connection.query(query,function(err,rows){
            if(err) {
                res.json({"Error" : true, "Message" : "Error retrieving reporting configurations by id"});
            } else {
                res.json({"Error" : false, "Message" : "Success", "ReportingConfigs" : rows});
            }
        });
    });

}

module.exports = RestApi_Router;
