const express = require("express");
const router = express.Router();
const Joi = require("joi");
const { User } = require("../models/user");
const auth = require("../middleware/auth");

router.get("/connections", auth, async (req, res) => {
  const currentUserId = req.user._id;

  const currentUser = await User.findById(currentUserId).select(
    "connectedUsers"
  );
  const connectedUsers = currentUser.connectedUsers.map((id) => id.toString());

  const users = await User.find({
    _id: { $ne: currentUserId, $nin: connectedUsers },
  })
  .select("name profilePicture numberOfConnections workTitle");

  res.json(users);
});

router.put("/connect", auth, async (req, res) => {
  const { error } = validate(req.body);
  if (error) return res.status(400).send(error.details[0].message);

  const user = await User.findById(req.user._id);

  if (!user) return res.status(404).send("user not found");

  user.set({
    numberOfConnections: user.numberOfConnections + 1,
    connectedUsers: [...user.connectedUsers, req.body.userId],
  });
  res.send(user);
});

const validate = (user) => {
  const userSchema = Joi.object({
    userId: Joi.objectId().required(),
  });

  return userSchema.validate(user);
};

module.exports = router;
