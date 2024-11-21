const mongoose = require("mongoose");
const Joi = require("joi");
const config = require("config");
const jwt = require("jsonwebtoken");
const { locationSchema, validate } = require("./location");
const { validateExperiance, experianceSchema } = require('./experiance');

const userSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
    minlength: 7,
    maxlength: 255,
  },
  email: {
    type: String,
    required: true,
    unique: true,
  },
  password: {
    type: String,
    required: true,
    minlength: 8,
    maxlength: 1024,
  },
  profilePicture: {
    type: String,
    default: "../e.jpg",
  },
  bio: {
    type: String,
    trim: true,
    maxlength: 500,
    minlength: 0,
  },
  posts: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Post",
    },
  ],
  numberOfConnections: {
    type: Number,
    default: 0,
  },
  title: {
    type: String,
    minlength: 5,
    maxlength: 255,
  },
  skills: [
    {
      type: String,
    },
  ],
  experiences: [
    {
      type: experianceSchema,
      required: true
    },
  ],
  location: locationSchema,
  connectedUsers: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
  ],
  isAdmin: Boolean,
});

userSchema.methods.generateAuthToken = function () {
  const token = jwt.sign({ _id: this._id, isAdmin: this.isAdmin}, config.get("jwtPrivateKey"));
  return token;
};

const User = mongoose.model("User", userSchema);

const validateUser = (user) => {
  const userSchema = Joi.object({
    name: Joi.string().required().min(7).max(255),
    email: Joi.string().required().email(),
    password: Joi.string().required().min(8).max(50),
    profilePicture: Joi.string(),
    bio: Joi.string().min(0).max(500).trim(),
    title: Joi.string().min(5).max(255).trim(),
    skills: Joi.array().items(Joi.string().min(0).max(5000)),
    experiences: Joi.array().items(validateExperiance()),
    location: validate(),
    connectedUsers: Joi.array().items(Joi.objectId()),
  });

  return userSchema.validate(user);
};

exports.User = User;
exports.validate = validateUser;