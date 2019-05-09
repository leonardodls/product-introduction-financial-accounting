// Include gulp
var gulp = require('gulp');
gutil = require('gulp-util');
exec = require('child_process').exec;
var git = require('gulp-git');
var homeDir = require('home-dir');
const sourceFolder = homeDir('/Dropbox/COSMATT/Cosmatt Training Content');
const destFolder = __dirname;
var fileSystem        = require('fs');
var argv = require('yargs').argv;
var targetBranch = argv.target || 'develop'
const prompt = require('gulp-prompt');



// Copies folders and files from Dropbox folder to Git folder
gulp.task('copy', ['update-branch'], function() {
  return gulp.src([sourceFolder+'/**/*'])
    .pipe(gulp.dest(destFolder));
});


// Run MD converter
gulp.task('docxtomd', ['copy'],() => {
  return new Promise(function(resolve, reject){
    exec('convertToMD.bat', (error, stdout, stderr) => {
        if (error) {
           gutil.log('MD Error: ' + error);
           return reject(error); 
        }           
        else{
          gutil.log('MD Conversion done...');
          return resolve();
        } 
    });
  })   
});

// Add files 
gulp.task('add', ['docxtomd'],() => {
  return gulp.src(destFolder)
    .pipe(git.add());
});

// Commit files 
gulp.task('commit', ['add'],() => {
  return gulp.src(destFolder)
    .pipe(git.commit(undefined, {
      args: '-m "content updated"',
      disableMessageRequirement: true
    }));
});

// Push committed files into develop branch
gulp.task('push', ['commit'],() => {
  return new Promise(function(resolve, reject){    
    git.push('origin', targetBranch ,{args: "--tags"}, function (error) {
      if (error){
        gutil.log('git push error: ' + error);
        return reject(error); 
      }else{
        gutil.log('git push done...');
         return resolve();
      }       
    }); 
  })   
}); 




// Merge develop branch into staging  
gulp.task('merge', function(){
  return new Promise(function(resolve, reject){    
    git.merge(argv.source, function (error) {
      if (error){
        gutil.log('git merge error: ' + error);
        return reject(error); 
      }else{
        gutil.log('git merge done...');
         return resolve();
      } 
    });
  }) 
});
/*gulp.task('tag',['push'],() => {
  return gulp.src(['./package.json']).pipe(tag_version());
});*/

gulp.task('tag',['push'], function(){
  return new Promise((resolve, reject) => {
    gulp.src('')
    .pipe(prompt.prompt({
      type: 'input',
      name: 'tagVersion',
      message: 'Enter commit tag or press enter to skip: '
    }, function(res) {
      git.tag(res.tagVersion, '', function(err) {
        if ( err ) {
          reject(err);
        } else {
          git.push('origin', targetBranch , {args: "--tags"}, function (error) {
            if (error){
              gutil.log('"git push --tags" error: ' + error);
              reject(error); 
            }else{
              gutil.log('"git push --tags" done...');
               resolve();
            }       
          });
        }
      })
    }));
  })
});

gulp.task('changelog', function(){
  git.exec({args : 'log -1 --name-status'}, function (error, stdout) {
    if (error) {throw error;}
    else{  
     fileSystem.appendFile('./CHANGELOG.md', stdout,function(error){
    if(error) throw error;
     gutil.log('git diff write...');
    });
    }
  });
});

function updateBranch(branch){

  return new Promise(function(resolve, reject){
     git.checkout(branch, function (error) {
          if (error) {
            gutil.log('git checkout error: ' + error);
            return reject(error); 
          }else{
            gutil.log('git checkout done...');
            git.fetch('origin','' ,{}, function (error) {
               if (error) {
                gutil.log('git fetch error: ' + error);
                return reject(error); 
               }else{
                gutil.log('git fetch done...');
                git.reset(branch, {args:'--hard'}, function (error) {
                if (error) {
                    gutil.log('git reset error: ' + error);
                    return reject(error); 
                   }else{
                    gutil.log('git reset done...');
                    return resolve();
                   }   
                });
               }               
            });  
           }               
        });
  });
}
 

gulp.task('update-branch',function(){
  return updateBranch(targetBranch); 
});
gulp.task('deploy-content', ["update-branch","copy" ,"docxtomd","add","commit","push","tag"],function(){
  gutil.log('successfully deploy content in develop branch');
});

gulp.task('promote-content', ["update-branch","merge","changelog","push","tag"],function(){
  gutil.log('successfully deploy content in develop branch');
});

