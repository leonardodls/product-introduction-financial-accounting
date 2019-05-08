const fs = require('fs');
const path = require('path');
const basePath = './';
const writeStream = fs.createWriteStream('convertToMD.bat', { flags: 'w' });
const docPattern = /^[0-9]+/;
// Add chapter names to be converted
const chaptersToConvert = [
	'Introduction',
	'Chapter_1_MotionProfiles',
	'Chapter_2_RotaryLoads',
	'Chapter_3_MotorSelection',
	'Chapter_4_RatioOptimisation'
];

// Reads a given directory, returns fileName/ subdirectories name as array
function readDirectory(path) {
	return new Promise((resolve, reject) => {
		fs.readdir(path, (err, files) => {
			if (err) {
				reject(err);
			}
			resolve(files);
		});
	});
}

// Gets the file type of the file
function getFileType(fileFullPath) {
	let stats = fs.lstatSync(fileFullPath);
	try {
		if (stats.isDirectory()) {
			return 'directory';
		}
		if (fileFullPath.indexOf('.') !== -1) {
			let fileNameArr = fileFullPath.split('.');
			return fileNameArr[fileNameArr.length - 1];
		}
		return 'unknown';
	} catch (err) {
		console.log('Error', err);
	}
}

// Generates Conversion Command for each file
function generateCommand(chapterName, fileName) {
	let fileameArr = fileName.split('.');
	let fileNameWithoutExtension = fileameArr[0];
	return 'pandoc -S "' + './' + path.join(basePath, chapterName, 'documents', fileName).replace(/\\/g, "/") + '" -M docPath="' + './' + path.join(basePath, chapterName, 'documents', fileName).replace(/\\/g, "/") + '" -t json | node pandoc_filter.js  | pandoc -f json -t commonmark --atx-headers --wrap=preserve -o "' + './' + path.join(basePath, chapterName, fileNameWithoutExtension + '.md').replace(/\\/g, "/") + '" & node update_md.js "' + './' + path.join(basePath, chapterName, fileNameWithoutExtension + '.md').replace(/\\/g, "/") + '"';
}

// Main Function
function main() {
	for (let chapterName of chaptersToConvert) {
		let joinedPath = path.join(basePath, chapterName, 'documents');
		// Reading Each chapterName from chaptersToConvert
		readDirectory(joinedPath).then((files) => {
			// Write chapterName Name to Batch file
			writeStream.write('\n\n');
			writeStream.write('::' + chapterName);
			for (let fileName of files) {
				if (getFileType(path.join(joinedPath, fileName)) == 'docx' && docPattern.test(fileName)) {
					// Write Command for Doc to Md conversion
					writeStream.write('\n');
					writeStream.write(generateCommand(chapterName, fileName));
				}
			}
		}).catch(err => console.log('Error', err))
	}
}

main();