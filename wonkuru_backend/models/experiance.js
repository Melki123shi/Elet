const mongoose = require("mongoose");
const Joi = require("joi");
const { locationSchema, validate } = require("./location");

const experianceSchema = new mongoose.Schema({
  workTitle: {
    type: String,
    required: true,
    minlength: 5,
    maxlength: 255,
  },
  companyName: {
    type: String,
    required: true,
    minlength: 5,
    maxlength: 255,
  },
  location: {
    type: locationSchema,
    required: true
  },
  startDate: {
    type: String,
    required: true,
    minlength: 5,
    maxlength: 55,
  },
  endDate: {
    type: String,
    required: true,
    minlength: 5,
    maxlength: 55,
  },
  description: {
    type: String,
    minlength: 5,
    maxlength: 2000,
  },
});

const Experiance = mongoose.model("Experiance", experianceSchema);

function validateExperiance() {
  return Joi.object({
    workTitle: Joi.string().required().min(5).max(255),
    companyName: Joi.string().required().min(5).max(255),
    startDate: Joi.string().required().min(5).max(55),
    endDate: Joi.string().required().min(5).max(55),
    location: validate().required(),
    description: Joi.string().min(5).max(2000),
  });
}

module.exports.Experiance = Experiance;
module.exports.validateExperiance = validateExperiance;
module.exports.experianceSchema = experianceSchema;
