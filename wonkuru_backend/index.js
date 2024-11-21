const express = require("express");
const app = express();

require('./startup/logging');
require("./startup/db")();
require('./startup/routes')(app);
require('./startup/config')(app);
require('./startup/validation')();
// throw new Error();

const port = process.env.PORT || 5000;
app.listen(port, () => console.log(`listening to port: ${port}`));
