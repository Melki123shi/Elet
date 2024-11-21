const mongoose = require("mongoose");
const Joi = require("joi");
const { locationSchema, validate } = require("./location");

const jobSchema = new mongoose.Schema({
  companyName: {
    type: String,
    required: true,
    minlength: 5,
    maxlength: 255,
  },
  jobTitle: {
    type: String,
    required: true,
    minlength: 5,
    maxlength: 255,
  },
  jobDescription: {
    type: String,
    minlength: 5,
    maxlength: 2000,
    required: true,
  },
  role: {
    type: String,
    minlength: 5,
    maxlength: 2000,
    required: true,
  },
  benefits: {
    type: String,
    maxlength: 1000,
  },
  location: {
    type: locationSchema,
    required: true,
  },
  skillsNeeded: {
    type: [String],
    required: true,
  },
  remote: {
    type: Boolean,
    required: true,
  },
  paid: {
    type: Boolean,
  },
  employmentType: {
    type: String,
    enum: ["internship", "job", "contract"],
    required: true,
  },
  user: {  
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User', 
    required: true,
  },
  salaryMin: {
    type: Number,
    min: 0,
  },
  salaryMax: {
    type: Number,
    min: 0,
  },
  jobLevel: {
    type: String,
    enum: ["Entry", "Junior", "Mid-level", "Senior", "Lead", "Executive"],
  },
  requiredExperience: {
    type: String,
    minlength: 3,
    maxlength: 100,
  },
  educationRequirements: {
    type: String,
    minlength: 5,
    maxlength: 255,
  },
  applicationDeadline: {
    type: Date,
  },
  tags: {
    type: [String],
  },
  companyDescription: {
    type: String,
    maxlength: 2000,
  },
  companyLogo: {
    type: String,
  },
  jobType: {
    type: String,
    enum: ["Full-time", "Part-time", "Temporary", "Freelance"],
    required: true,
  },
  applicationLink: {
    type: String,
    match: /^https?:\/\/\S+$/,
  },
});

// Define the Job model
const Job = mongoose.model(
  "Job",
  jobSchema
);

function validateJob(job) {
  const validateSchame =  Joi.object({
    companyName: Joi.string().min(5).max(255).required(),
    jobTitle: Joi.string().min(5).max(255).required(),
    jobDescription: Joi.string().min(5).max(2000).required(),
    role: Joi.string().min(5).max(2000).required(),
    benefits: Joi.string().max(1000),
    user: Joi.objectId().required(),
    location: validate().required(),
    skillsNeeded: Joi.array().items(Joi.string().min(3)).required(),
    remote: Joi.boolean().required(),
    paid: Joi.boolean(),
    employmentType: Joi.string()
      .valid("internship", "job", "contract")
      .required(),
    salaryMin: Joi.number().min(0),
    salaryMax: Joi.number().min(0),
    closingDate: Joi.date(),
    jobLevel: Joi.string().valid(
      "Entry",
      "Junior",
      "Mid-level",
      "Senior",
      "Lead",
      "Executive"
    ),
    requiredExperience: Joi.string().min(3).max(100),
    educationRequirements: Joi.string().min(5).max(255),
    applicationDeadline: Joi.date(),
    tags: Joi.array().items(Joi.string()),
    companyDescription: Joi.string().max(2000),
    companyLogo: Joi.string().uri(),
    jobType: Joi.string()
      .valid("Full-time", "Part-time", "Temporary", "Freelance")
      .required(),
    applicationLink: Joi.string().uri(),
  });

  return validateSchame.validate(job);
}

module.exports.Job = Job;
module.exports.validateJob = validateJob;
