import fs from 'fs';
import { execSync } from 'child_process';

console.log('dumping Brewfile');

execSync('rm Brewfile; brew bundle dump');

const installed = fs
	.readFileSync('Brewfile')
	.toString()
	.split('\n')
	.map((l) => l.replace(/^(.*?"[^"]*?").*/g, '$1'));

const listed = fs
	.readFileSync('../Brewfile')
	.toString()
	.split('\n')
	.filter((l) => !l.startsWith('#')) // no comments
	.filter(Boolean) // no empty lines
	.map((l) => l.replace(/^(.*?"[^"]*?").*/g, '$1'));

const listedButNotInstalled = listed.filter((l) => !installed.includes(l));
const installedButNotListed = installed.filter((l) => !listed.includes(l));

console.log('# listed but not installed\n', listedButNotInstalled.join('\n'));
console.log('# installed but not listed\n', installedButNotListed.join('\n'));
