const express = require("express");
const router = express.Router();
const bcrypt = require("bcrypt");
const { User, validate } = require("../models/user");
const _ = require("lodash");
const auth = require("../middleware/auth");
const admin = require("../middleware/admin");

router.get("/", [auth, admin], async (req, res) => {
  const users = await User.find()
    .populate("experiences")
    .populate("posts")
    .populate("location");
  res.send(users);
});

router.get("/me", auth, async (req, res) => {
  console.log(req.user);
  const user = await User.findById(req.user._id).select("-password");
  res.send(user);
});

router.post("/", async (req, res) => {
  const { error } = validate(req.body);
  if (error) return res.status(400).send(error.details[0].message);

  const userExist = await User.findOne({ email: req.body.email });
  if (userExist) return res.status(400).send("User with this email exists");

  const user = new User(
    _.pick(req.body, [
      "name",
      "email",
      "password",
      "workTitle",
      "bio",
      "profilePicture",
      "skills",
      "location",
      "experiences",
    ])
  );

  const salt = await bcrypt.genSalt(10);
  user.password = await bcrypt.hash(user.password, salt);

  await user.save();
  const token = user.generateAuthToken();
  res
    .header("x-auth-token", token)
    .send(_.pick(user, ["_id", "name", "email"]));
});

module.exports = router;
