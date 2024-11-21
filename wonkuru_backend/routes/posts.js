const express = require("express");
const router = express.Router();
const _ = require("lodash");
const auth = require("../middleware/auth");
const adminOrOwner = require('../middleware/adminOrOwner');
const { Post, validate } = require("../models/post");

router.get("/", auth, async (req, res) => {
  const posts = await Post.find().populate({
    path: "user",
    select: "name profilePicture",
  });
  res.send(posts);
});

router.get("/:id", auth, async (req, res) => {
  const post = await Post.findById(req.params.id).populate({
    path: "user",
    select: "name profilePicture",
  });
  if (!post) return res.status(404).send("post not found");
  res.send(post);
});

router.post("/", auth, async (req, res) => {
  const { error } = validate(req.body);
  if (error) return res.status(400).send(error.details[0].message);

  const post = new Post(
    _.pick(req.body, ["title", "description", "image", "video"])
  );
  post.user = req.user;
  
  post.save();
  res.send(post);
});

router.delete('/:id', [auth, adminOrOwner], async (req, res) => {
    const post = await Post.findByIdAndDelete(req.params.id);
    if (!post) return res.status(404).send('Post not found');
    res.send(post);
});

module.exports = router;
