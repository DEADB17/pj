/*eslint strict: [2, "global"]*/
/*eslint-env es6, node*/

'use strict';

const codegen = require('shift-codegen').default;
const fs = require('fs');

fs.readFile('sample-output.json', 'utf8', function read(err, file) {
    if (err) throw err;
    const parsedJson = JSON.parse(file);
    const code = codegen(parsedJson);
    console.log(code);
});
