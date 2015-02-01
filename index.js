var WebSQLShim = require('./websqlshim.js');

for(var key in WebSQLShim) {
  exports[key] = WebSQLShim[key]
}

