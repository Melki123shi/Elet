const { Post } = require('../models/post');

module.exports = async function (req, res, next) {
  try {
    const post = await Post.findById(req.params.id);
    if (!post) return res.status(404).send('Post not found');

    console.log(post);
    if (post.user.toString() === req.user._id || req.user.isAdmin) {
      return next();
    }
    res.status(403).send('Access denied. You are not authorized to delete this post.');
  } catch (err) {
    console.error('Error in ownerOrAdmin check:', err);
    res.status(500).send('Server error');
  }
};
