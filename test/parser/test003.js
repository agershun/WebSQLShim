if(typeof exports == "object") {
	var WebSQLShim = require("../../websqlshim.js");
	var assert = require("assert");
	var fs = require("fs");
}

describe("Parser 003. SQL Syntax", function() {
  it("Should parse GROUP BY with multiple exprs", function(done) {
    var res = WebSQLShim.parse("SELECT a, b FROM T GROUP BY a, b");

    // Check just the one thing we're trying to check:
    assert.deepEqual(res[0]["selects"][0]["group_by"], [
        { "column" : "a" }, { "column" : "b" }
    ]);

    // And... check everything else, while we're at it:
    assert.deepEqual(res, [
      { 
        "statement" : "SELECT",
        "selects" : [
          { 
            "from" : [ { "table" : "T" } ],
            "columns" : [
              { "expr" : { "column" : "a" } },
              { "expr" : { "column" : "b" } }
            ],
            "group_by" : [
              { "column" : "a" },
              { "column" : "b" }
            ],
          }
        ]
      }
    ]);

    done();
  });
});
