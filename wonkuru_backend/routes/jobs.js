const express = require("express");
const router = express.Router();
const _ = require("lodash");
const adminOrOwner = require("../middleware/adminOrOwner");
const auth = require("../middleware/auth");
const { Job, validateJob } = require("../models/job");

router.get("/", auth, async (req, res) => {
  const jobs = await Job.find().select(
    "companyName jobTitle jobDescription location remote paid jobType companyLogo"
  );
  res.send(jobs);
});

router.get("/:id", auth, async (req, res) => {
  const job = await Job.findById(req.params.id);
  if (!job) return res.status(404).send("Job not found");

  res.send(job);
});

router.post("/", auth, async (req, res) => {
  const { error } = validateJob(req.body);
  if (error) return res.status(400).send(error.details[0].message);

  const job = new Job(
    _.pick(req.body, [
      "companyName",
      "jobTitle",
      "jobDescription",
      'user',
      "role",
      "benefits",
      "location",
      "sillsNeeded",
      "remote",
      "paid",
      "employmentType",
      "salaryMin",
      "jobLevel",
      "requiredExperiences",
      "educationRequirements",
      "companyLogo",
      "applicationDeadline",
      "tags",
      "companyDescription",
      "jobType",
      "applicationLink",
    ])

  );
  await job.save();
  res.send(job);
});

router.get('/my_jobs', auth, async(req, res) => {
    const my_jobs = await Job.find({ user: req.user._id });
    res.send(my_jobs);
})

router.put("/:id", [auth, adminOrOwner], async (req, res) => {
  const { error } = validateJob(req.body);
  if (error) return res.status(400).send(error.details[0].message);

  const job = await Job.findByIdAndUpdate(
    req.params.id,
    _.pick(req.body, [
      "companyName",
      "jobTitle",
      "jobDescription",
      "role",
      "benefits",
      "location",
      "sillsNeeded",
      "remote",
      "paid",
      "employmentType",
      "salaryMin",
      "jobLevel",
      "requiredExperiences",
      "educationRequirements",
      "companyLogo",
      "applicationDeadline",
      "tags",
      "companyDescription",
      "jobType",
      "applicationLink",
    ]),
    { new: true }
  );

  if (!job) return res.status(404).send("Job not found");

  res.send(job);
});

router.delete('/:id', [auth, adminOrOwner], async (req, res) => {
    const job = await Job.findByIdAndDelete(req.params.id);
    if (!job) return res.status(404).send('Job not found');
    res.send(job);
})

module.exports = router;
