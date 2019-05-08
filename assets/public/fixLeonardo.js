const argv = require('yargs').argv;
const path = require('path');
const assert = require('assert');
const fs = require('fs');

/**
  * USAGE
  * 1. If you want to superScript the numbers inside (...)
  *     $ node fixLeonardo.js --addscript true --input "path/to/input" --output "path/to/output"
  * 2. Otherwise, just do
  *     $ node fixLeonardo.js --input "path/to/input" --output "path/to/output"
  *	
  * Optional args-
  *	1. --unminify
  * 2. --addscript true
  *
  * Note - Input and output folders are assumed to be present in current directory if --input or --output argument are skipped.
  *		 - By default, JSONs are minified in output.
**/

const config = {
    input: argv.input || path.resolve(__dirname, 'input'),
    output: argv.output || path.resolve(__dirname, 'output'),
    minify: true && !argv.unminify,
    addscript: argv.addscript || false
};

fs.readdir(config.input, 'utf8', (err, files) => {
    assert.equal(err, null, 'Error reading input.');
    files.map(fileName => {
        return {
            name: fileName,
            path: path.resolve(config.input, fileName)
        }
    })
        .forEach(file => {
            fs.readFile(file.path, 'utf8', (err, data) => {
                const json = JSON.parse(data);
                let leoJson = json;
                let question;

                // If it is presentation, go deep to find the leoJson
                if (question = !isQuestion(leoJson))
                    leoJson = leoJson.options.data;

                // Modify leo json data
                addProperties(leoJson, { color: true, script: true, locked: question });

                // Write the file
                const newFilePath = path.resolve(config.output, file.name);
                fs.writeFile(newFilePath, JSON.stringify(json, null, config.minify ? 0 : 4), err => {
                    console.log('File written: ' + newFilePath);
                });
            });
        })
});

function isQuestion(json) {
    // question does not have type
    if (json.type)
        return false;
    return true;
}


function addProperties(json, options) {
    const { color, script, locked } = options;

    for (let hashKey in json.resources) {
        if (json.resources[hashKey].type === 'spreadsheet') {
            const sheet = json.resources[hashKey].spreadsheet.data.sheets["0"];
            addOffsetToColumns(sheet.columns, 10);
            for (let rowNumKey in sheet.rows) {
                const row = sheet.rows[rowNumKey];

                for (let cellNumKey in row.cells) {
                    const cell = row.cells[cellNumKey];
                    //subScript(cell);
                    //addLocked_greenCells(cell);
                    addColor(cell);
                    addLocked(cell);
                    if (config.addscript)
                        addScript(cell);
                }
            }
        }
    }
}
function addLocked_greenCells(cell) {

    let counter = 0;
    if (cell.style && cell.style.border) {
        for (var key in cell.style.border) {
            counter++;
        }
    }
    if (cell.style && ((cell.style.border == undefined) || (cell.style.border && counter < 4))) {


        console.log(cell.ref);
        cell.style.locked = true;
    }

    return cell;

}
function addColor(cell) {
    if (isUnitText(cell.value))
        cell.fontAttrs.def.color = "#cb3434";
    return cell;
}

function addLocked(cell) {
    if (cell.style && cell.style.background && cell.style.background.toLowerCase() === "#f2f2f2")
        cell.style.locked = true;
    return cell;
}

function addScript(cell, superScript) {
    const val = '' + cell.value;
    //&& (val != ": 1")
    if (isUnitText(val) || is_heading(cell)) {
        cell.fontAttrs.runs = [];
        val.split('').forEach((subVal, i) => {
            if (+subVal) {
                const run = {
                    "start": i,
                    "txt": subVal,
                    "superScript": true
                };

                // if ( cell.fontAttrs.runs )
                cell.fontAttrs.runs.push(run);
                // else 
                //     cell.fontAttrs.runs = [run];
            }
        });
        if (cell.fontAttrs.runs.length === 0) delete cell.fontAttrs.runs;
    }
}
function subScript(cell) {
    const val = '' + cell.value;
    counter = 0;
    flag = false;
    if (is_heading(cell) && (val != ": 1")) {
        cell.fontAttrs.runs = [];
        val.split('').forEach((subVal, i) => {
            if (subVal === "#") {
                flag = true;
                counter++;
                const run = {
                    "start": i + 1 - counter,
                    "txt": val.substr(i + 1, 1),
                    "subScript": true
                };

                // if ( cell.fontAttrs.runs )
                cell.fontAttrs.runs.push(run);
                // else 
                //     cell.fontAttrs.runs = [run];
            }
        });
        if (cell.fontAttrs.runs.length === 0) delete cell.fontAttrs.runs;
    }
    if (flag == true) remove_hash(cell);

}
function remove_hash(cell) {
    const val = '' + cell.value;
    updatedval = '';
    val.split('').forEach((subVal, i) => {

        if (subval != "#") {
            updatedval += subVal;
        }
    }
    );
    cell.value = updatedval;

}
function addOffsetToColumns(columns, offset) {
    for (columnNumKey in columns) {
        columns[columnNumKey].width += offset;
    }
}

function isUnitText(cellValue) {

    return cellValue && typeof cellValue === 'string' && cellValue.substring(0, 1) === "(" && cellValue.substr(cellValue.length - 1, 1) === ")";

}

function is_heading(cell) {

    return cell.style && cell.style.background && cell.style.background.toLowerCase() === "#f2f2f2";

}
