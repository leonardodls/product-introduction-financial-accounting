const fs = require('fs');
const lineReader = require('line-reader');

const mdFilePath = process.argv[2];
const tempFilePath = '.' + mdFilePath.split('.')[1] + '_temp.md';
// const fileName = mdFilePath.split('/')[mdFilePath.split('/').length - 1];
var skip = 0;
var ignoreText = false;

lineReader.eachLine(mdFilePath, (line, last) => {
  if (last) {
    appendDataToFile(line);
    fs.unlinkSync(mdFilePath);
    fs.rename(tempFilePath, mdFilePath);
  } else if (line.trim() == "\\<ignore\\>") { // Start Text Ignore on <ignore>
    ignoreText = true;
  } else if (line.trim() == "\\</ignore\\>") { // End Text Ignore on </ignore>
    ignoreText = false;
  } else if (ignoreText) { // Keep ignoring text between <ignore></ignore>
    appendDataToFile('');
  } else if (line.trim() == "\\`\\`\\`" && skip == 0) {
    skip = 3;
    appendDataToFile('```\n');
  } else if (line.trim() == "\\[cosmatt-widget\\]") {
    skip--;
    appendDataToFile('[cosmatt-widget]\n');
  } else if (line.trim() == "\\`\\`\\`" && skip == 1) {
    appendDataToFile('```\n');
    skip--;
  } else if (skip == 2) {
    skip--;
    line = line.split('\\[').join('[');
    line = line.split('\\]').join(']');
    line = line.split('\\\\').join('*****');
    line = line.split('\\').join('');
    line = line.split('*****').join('\\');
    appendDataToFile(line + '\n');
  } else if (line.indexOf('](') != -1 && line.indexOf('http') == -1) {

    // RegExp for string starting at `](` followed by any number of characters and ending at `)`
    var urlRegex = /\]\((.*?)\)/;
    var refUrl = urlRegex.exec(line)[1];
    while (refUrl) {
      if (refUrl.indexOf('..') == -1 && refUrl.indexOf('ITEM_CODE:') == -1){
        appendDataToFile(line + '\n');
        return;
      }

      // RegExp for string starting at `[` followed by any number of characters and ending at `)`
      var textRegex = /\[(.*?)\]/;
      var refText = textRegex.exec(line)[1];
      while (refText.indexOf("**") != -1) {
        refText = refText.replace("**", "");
      }

      var textRegex = /ITEM_CODE:.*?/;
      var refUrlRegex = textRegex.exec(refUrl);
      if (refUrlRegex) {
        while (refUrl.indexOf("ITEM_CODE:") != -1) {
          refUrl = refUrl.replace("ITEM_CODE:", "");
        }
      }
      
      var replaceRegex = /\[(.*?)\)/;
      var replaceString = replaceRegex.exec(line)[0];
      line = line.replace(replaceString, "<a routerlink='" + refUrl + "' class='ngx-router-link'>" + refText + "</a>");
      refUrl = urlRegex.exec(line) ? urlRegex.exec(line)[1] : undefined;
    }
    appendDataToFile(line + '\n');

  } else {
    appendDataToFile(line + '\n');
  }
});

function appendDataToFile(data) {
  fs.appendFileSync(tempFilePath, data);
}