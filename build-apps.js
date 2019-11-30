// Build all apps for a given target. App build targets follow the format `/app/{appname}/build-{appname}-{target}.hxml`.

const { readdirSync, statSync } = require('fs')
const { join } = require('path')
const { execSync } = require('child_process');

function getDirectories(path) {
    return readdirSync(path)
        .filter(file => statSync(join(path, file)).isDirectory());
}

function build(path, suffix) {
    console.log(`Building in ${path}`)
    process.chdir(path);
    const buildFiles = readdirSync('.')
        .filter(file => file.endsWith(`${suffix}.hxml`));
    
    // Expect exactly one build file with this suffix
    if (buildFiles.length === 0) {
        console.log(`No build file found in ${path}`);
        return;
    } else if (buildFiles.length > 1) {
        console.log('Ambiguous build: multiple files found with specified suffix.');
        return;
    }

    // Build in Haxe
    const buildFile = buildFiles[0];
    console.log(`Building ${buildFile}`)
    execSync(`haxe ${buildFile}`, {stdio: 'inherit'});
    process.chdir(__dirname);
}

// Relative to the script's folder
const appFolder = join(__dirname, 'app');
const dirs = getDirectories(appFolder)
    .map(directory => join(appFolder, directory));

const target = process.argv[2] || 'hl';
console.log(`Building target ${target}`)

for (dir of dirs) {
    build(dir, target);
}