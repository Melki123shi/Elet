const express = require("express");
const error = require('../middleware/error');
const users = require("../routes/users");
const auth = require("../routes/auth");
const posts = require("../routes/posts");
const community = require("../routes/community");
const jobs = require('../routes/jobs');

module.exports = function (app) {
    app.use(express.json());
    app.use("/api/users", users);
    app.use("/api/auth", auth);
    app.use("/api/posts", posts);
    app.use("/api/community", community);
    app.use("/api/jobs", jobs);
    app.use(error);
}