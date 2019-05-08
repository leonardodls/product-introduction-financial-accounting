var path = require('path');
const spawn = require('child_process').spawnSync;
var fs = require('fs');
var Presentation = require('office-script').Presentation;
var pandoc = require('pandoc-filter');
var Image = pandoc.Image;
var Para = pandoc.Para;
var Str = pandoc.Str;
var presentation, moduleName, subModuleName, imgDesPath, docPath;

function convertImgtoEMF(moduleBasepath, presentationPath, altText, imageName) {
  var result = false;
  var presentationName = altText.split("~")[0];
  var slideNumber = parseInt(altText.split("~")[1]) - 1;



  try {
    if (!presentation) {
      presentation = new Presentation(presentationPath);
    }
    var slides = presentation.slides();
    var shapes = slides[slideNumber] ? slides[slideNumber].shapes() : undefined;
    var mediaPath = path.join(moduleBasepath, "media");
    var desfolderPath = path.join(moduleBasepath, "/media/" + subModuleName);
    imgDesPath = path.join(desfolderPath, imageName + '.emf');

    var isExist = fs.existsSync(mediaPath);
    if (!isExist) {
      fs.mkdirSync(mediaPath);
    }
    var modulePath = path.join(mediaPath, subModuleName);
    isExist = fs.existsSync(modulePath);
    if (!isExist) {
      fs.mkdirSync(modulePath);
    }

    if (shapes[0] && shapes != undefined) {

      shapes[0].exportAs({
        path: imgDesPath,
        type: 'emf'
      });
      result = true;
    } else {
      result = false;
    }
  } catch (e) {}

  return result;
};

function convertEMFtoSVG(imgDesPath) {
  var result = false;
  if (fs.existsSync(imgDesPath)) {
    var svgPath = imgDesPath.substr(0, imgDesPath.lastIndexOf('.'));


    var args = ['-z', '-f', imgDesPath, '-l', svgPath + '.svg'];
    var bat = spawn('inkscape', args);
    if (bat.status != null && fs.existsSync(svgPath + ".svg")) {
      result = true;

    }
    fs.unlink(imgDesPath);

    return result;
  }
};

function Image_filter(value, docPath) {
  var imageName = value[2][1];
  var imageAltDes = value[1];
  var altText = "";
  for (var str = 0; str < imageAltDes.length; str++) {

    if (imageAltDes[str].c == undefined) {
      altText = altText + " ";
    } else {
      altText = altText + imageAltDes[str].c;
    }
  }

  var docPathAry = docPath.split("/");
  if (docPathAry[0] == ".") {
    moduleName = docPathAry[1];
  } else {
    moduleName = docPathAry[0];
  }

  subModuleName = docPathAry[docPathAry.length - 1].split(".")[0];
  if (subModuleName == undefined || subModuleName == "") {
    subModuleName = moduleName;
  }
  var moduleBasepath = path.join(__dirname, moduleName);
  var docxPath = path.join(moduleBasepath, "documents/resources");

  // for image

  if (altText.split(".").pop() == "json") {
    var jsonPath = path.join(docxPath, altText);
    if (imageName != undefined && altText != "" && fs.existsSync(docxPath) && fs.existsSync(jsonPath)) {
      var widgetConfigJson = fs.readFileSync(docxPath + '/' + altText);
      widgetConfigJson = JSON.stringify(JSON.parse(widgetConfigJson));
      var convertedString = "``` \n [cosmatt-widget] \n " + widgetConfigJson + " \n ```";
      return Str(convertedString);
    }
  } else {

    var presentationName = altText.split("~")[0];
    var presentationPath = path.join(docxPath, presentationName + '.pptx');
    var imagePath;
    if (imageName != undefined && altText != "" && fs.existsSync(docxPath) && fs.existsSync(presentationPath)) {

      var resultEMF = convertImgtoEMF(moduleBasepath, presentationPath, altText, imageName);
      if (resultEMF) {
        var resultSVG = convertEMFtoSVG(imgDesPath);

        if (resultSVG) {
          imagePath = "./" + moduleName + "/media/" + subModuleName + "/" + imageName + ".svg";
          value[2][0] = imagePath;
        }
      }
      value[1] = [];
      value[2][1] = "";
      value[1].length = 0;
      return Image(value[0], value[1], value[2]);

    }
    var imagePathName = value[2][0].split("/");
    var imageName = imagePathName[imagePathName.length - 1];
    fs.createReadStream(moduleName + "/media/" + subModuleName + "/media/" + imageName).pipe(fs.createWriteStream(moduleName + "/media/" + subModuleName + "/" + imageName));
    imagePath = "./" + moduleName + "/media/" + subModuleName + "/" + imageName;
    value[2][0] = imagePath;
    value[1] = [];
    value[2][1] = "";
    value[1].length = 0;
    return Image(value[0], value[1], value[2]);
  }
};

function Table_filter(value, docPath) {

  var altText = "";
  var tableAltDesc = ""

  if (value[0][0] && value[0][0]["t"] && value[0][0]["t"] == "Str") {
    altText = value[0][0]["c"];
    var splittedAltText = altText.split(".");
    if (splittedAltText[splittedAltText.length - 1].toLowerCase() != "json") {
      altText = "";
    }
  }


  var docPathAry = docPath.split("/");
  if (docPathAry[0] == ".") {
    moduleName = docPathAry[1];
  } else {
    moduleName = docPathAry[0];
  }

  subModuleName = docPathAry[docPathAry.length - 1].split(".")[0];
  if (subModuleName == undefined || subModuleName == "") {
    subModuleName = moduleName;
  }
  var moduleBasepath = path.join(__dirname, moduleName);
  var docxPath = path.join(moduleBasepath, "documents/resources");


  if (altText.split(".").pop() == "json") {
    var jsonPath = path.join(docxPath, altText);
    if (altText != "" && fs.existsSync(docxPath) && fs.existsSync(jsonPath)) {
      var widgetConfigJson = fs.readFileSync(docxPath + '/' + altText);
      widgetConfigJson = JSON.stringify(JSON.parse(widgetConfigJson));
      var convertedString = "``` \n [cosmatt-widget] \n " + widgetConfigJson + " \n ```";
      var res = {
        t: "Para",
        c: [{
          t: "Str",
          c: convertedString
        }]
      }
      return res;
    }
  }
};

function exportDocxMedia(docPath) {

  var docPathAry = docPath.split("/");
  if (docPathAry[0] == ".") {
    moduleName = docPathAry[1];
  } else {
    moduleName = docPathAry[0];
  }

  subModuleName = docPathAry[docPathAry.length - 1].split(".")[0];
  if (subModuleName == undefined || subModuleName == "") {
    subModuleName = moduleName;
  }
  var exportAsPath = './' + moduleName + '/media/' + subModuleName + '/media';
  //var args = ['-S', docPath, '--extract-media=\"'+exportAsPath+'\"', "-t json"];
  var args = ['-S', docPath, '--extract-media=./' + moduleName + '/media/' + subModuleName, "-t", "json"];
  var bat = spawn('pandoc', args);
};

function para_filter(value) {

  var multiple_quote_block = {
    "t": "RawInline",
    "c": ["", "\n```\n"]
  };

  var single_quote_block = {
    "t": "RawInline",
    "c": ["", "\n`\n"]
  };

  var math_block = {
    "t": "RawInline",
    "c": ["", "[math]\n"]
  };

  var modified_value = [];

  for (var j = 0; j < value.length; j++) {
    if (value[j].t == "Math") {
      // Appending Triple Quotes and Single Quotes based on Block value
      if (value[j].c[0].t == "InlineMath") {
        modified_value.push(single_quote_block)
        modified_value.push(math_block);
        modified_value.push(value[j]);
        modified_value.push(single_quote_block);
      } else {
        modified_value.push(multiple_quote_block)
        modified_value.push(math_block);
        modified_value.push(value[j]);
        modified_value.push(multiple_quote_block);
      }
    } else {
      modified_value.push(value[j]);
    }
  };

  return modified_value;
};

function action(type, value, format, meta) {
  if (meta.docPath && meta.docPath.c && docPath == undefined) {
    docPath = (meta.docPath.c).trim();
    exportDocxMedia(docPath);
  }
  switch (type) {
    case "Image":
      return Image_filter(value, docPath);

    case "Para":
      return Para(para_filter(value));

    case "Table":
      return Table_filter(value, docPath);
    default:

      break;
  }


};
setTimeout(function() {
  pandoc.stdio(action);
}, 0);


function deleteFolderRecursive(mediaPath) {
  if (fs.existsSync(mediaPath)) {
    fs.readdirSync(mediaPath).forEach(function(file, index) {
      var curPath = mediaPath + "/" + file;
      if (fs.lstatSync(curPath).isDirectory()) {
        deleteFolderRecursive(curPath);
      } else {
        fs.unlinkSync(curPath);
      }
    });
    fs.rmdirSync(mediaPath);
  }
};


process.on('exit', function() {
  if (presentation) {
    presentation.quit();
    var mediaPath = path.join(__dirname, moduleName + "/media/" + subModuleName + "/media");
    deleteFolderRecursive(mediaPath);
  }

});