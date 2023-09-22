// Get date and time in a specific format 
// Used in python script which calls with subprocess
const fs = require('fs');
const moment = require('moment');

function getLastModifiedDate(filePath, dateFormat = 'Do MMMM YYYY') {
  fs.stat(filePath, (err, stats) => {
    if (err) {
      return;
    }

    const lastModifiedDate = moment(stats.mtime);
    console.log(`${lastModifiedDate.format(dateFormat)}`);
  });
}

const filePath = process.argv[2];

if (filePath) {
  getLastModifiedDate(filePath);
} else {
  process.exit(1);
}

