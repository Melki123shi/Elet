const express = require("express");
const router = express.Router();
const Joi = require("joi");
const bcrypt = require('bcrypt');
const { User } = require("../models/user");

router.post("/", async (req, res) => {
  const { error } = validate(req.body);
  if (error) return res.status(400).send(error.details[0].message);

  const user = await User.findOne({ email: req.body.email });
  if(!user) return res.status(400).send('Invalid email or password');

  const validPassword = await bcrypt.compare(req.body.password, user.password);
  if (!validPassword) return res.status(400).send('Invalid email or password');

  const token = user.generateAuthToken();
  res.send(token);

});

const validate = (user) => {
  const userSchema = Joi.object({
    email: Joi.string().required().email().min(5).max(255),
    password: Joi.string().required().min(7).max(255),
  });

  return userSchema.validate(user);
};

module.exports = router;
