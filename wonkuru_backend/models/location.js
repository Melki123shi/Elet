const mongoose = require("mongoose");
const Joi = require("joi");

const locationSchema = new mongoose.Schema({
  city: {
    type: String,
    required: true,
  },
  country: {
    type: String,
    enum: [
      "Argentina",
      "Australia",
      "Brazil",
      "Canada",
      "China",
      "Ethiopia",
      "France",
      "Germany",
      "India",
      "Japan",
      "Mexico",
      "Russia",
      "South Africa",
      "United Kingdom",
      "United States",
    ],
    required: true,
  },
});

const Location = mongoose.model("Location", locationSchema);

function validateLocation() {
  return Joi.object({
    city: Joi.string().required(),
    country: Joi.string()
      .valid(
        "Argentina",
        "Australia",
        "Brazil",
        "Canada",
        "China",
        "Ethiopia",
        "France",
        "Germany",
        "India",
        "Japan",
        "Mexico",
        "Russia",
        "South Africa",
        "United Kingdom"
      )
      .required(),
  });
}

module.exports.Location = Location;
module.exports.validate = validateLocation;
module.exports.locationSchema = locationSchema;
