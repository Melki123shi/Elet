const config = require('config');
const debug = require("debug")("app:startup");
const helmet = require("helmet");
const morgan = require("morgan");
const express = require('express');

module.exports = function(app) {
    if(!config.get('jwtPrivateKey')) {
        throw new Error('FATAL ERROR: jwtPrivateKey is not defined');
      }

    app.use(express.urlencoded({ extended: true }));
    app.use(express.static("public"));
    app.use(helmet());
    
    
    if (app.get("env") === "development") {
    app.use(morgan("tiny"));
    debug("Morgan Enabled...");
    }
}