const mongoose = required('mongoose');
const Joi = require('joi');
const { jobSchema, validateJob } = require('./job');


const applicationSchema = new mongoose({
    job: {
        type: jobSchema,
        required: true
    },
    status: {
        type: String,
        enum: ['pending', 'visited', 'accepted', 'rejected'],
        default: 'pending'
    },
    coverLetter: {
        type: String,
        required: true,
        minlength:200,
        maxlength: 2000
    },

    //! to be fixed
    resume: {
        type: String,
        required: true
    },
    portfolio: {
        type: String, 
        required: true
    },

    date: {
        type: Date,
        default: Date.now
    }
});

const Application = new mongoose.model('Application', applicationSchema);

const validateApplication = (application) => {
    const applicationSchema = Joi.object({
        job: validateJob().required(),
        status: Joi.string().valid('pending', 'visited', 'accepted', 'rejected'),
        date: Joi.date(),
        portfolio: Joi.string().uri().required(),
        coverLetter: Joi.string().required().min(200).max(2000),
        resume: Joi.string().required()
    });

    applicationSchema.validate(application);
}


exports.Application = Application;
exports.validate = validateApplication;

