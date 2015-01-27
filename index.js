var sqlidx = require('./sqlidx.js');

for(var key in sqlidx) {
  exports[key] = sqlidx[key]
}

