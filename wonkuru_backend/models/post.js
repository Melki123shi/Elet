const mongoose = require("mongoose");
const Joi = require("joi");

const Post = mongoose.model(
  "Post",
  new mongoose.Schema({
    user: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "User",
    },
    title: {
      type: String,
      minlength: 1,
      maxlength: 100,
      required: true,
    },
    description: {
      type: String,
      minlength: 8,
      maxlength: 500,
    },

    image: {
      type: String,
    },
    video: {
      type: String,
    },
    likes: [
      {
        type: mongoose.Schema.Types.ObjectId,
        ref: "User",
      },
    ],
    createdAt: {
      type: Date,
      required: true,
      default: Date.now,
    },

  })
);

const validatePost = (post) => {
  const postSchema = Joi.object({
    title: Joi.string().min(1).max(100).required(),
    description: Joi.string().min(8).max(500),
    image: Joi.string(),
    video: Joi.string(),
  });

  return postSchema.validate(post);
};

module.exports.Post = Post;
module.exports.validate = validatePost;
