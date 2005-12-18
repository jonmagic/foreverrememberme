/*
	Copyright (c) 2004-2005, The Dojo Foundation
	All Rights Reserved.

	Licensed under the Academic Free License version 2.1 or above OR the
	modified BSD license. For more information on Dojo licensing, see:

		http://dojotoolkit.org/community/licensing.shtml
*/

dojo.hostenv.loadedUris.push("../src/bootstrap1.js");
dojo.hostenv.loadedUris.push("../src/hostenv_browser.js");
dojo.hostenv.loadedUris.push("../src/bootstrap2.js");

dojo.hostenv.getDepsForEval = function(contents){
	// FIXME: should probably memoize this!
	if(!contents){ contents = ""; return []; }

	// if we get the contents of the file from Rhino, it might not be a JS
	// string, but rather a Java string, which will cause the replace() method
	// to bomb.
	contents = new String(contents);
	// clobber all comments
	contents = contents.replace( /^(.*?)\/\/(.*)$/mg , "$1");
	contents = contents.replace( /(\n)/mg , "__DOJONEWLINE");
	contents = contents.replace( /\/\*(.*?)\*\//g , "");
	contents = contents.replace( /__DOJONEWLINE/mg , "\n");
	// print(contents);
	// check to see if we need to load anything else first. Ugg.
	var deps = [];
	var tmp;
	var testExps = [
		/dojo.hostenv.loadModule\(.*?\)/mg,
		/dojo.hostenv.require\(.*?\)/mg,
		/dojo.require\(.*?\)/mg,
		/dojo.requireIf\([\w\W]*?\)/mg,
		/dojo.hostenv.conditionalLoadModule\([\w\W]*?\)/mg
	];
	for(var i=0; i<testExps.length; i++){
		tmp = contents.match(testExps[i]);
		if(tmp){
			for(var x=0; x<tmp.length; x++){ deps.push(tmp[x]); }
		}
	}

	return deps;
}

dojo.hostenv.getProvidesForEval = function(contents){
	if(!contents){ contents = ""; }
	// check to see if we need to load anything else first. Ugg.
	var mods = [[], []];
	var tre;
	var tmp;
	var testExps = [
		/dojo.hostenv.startPackage\((.*?)\)/mg,
		/dojo.hostenv.provide\((.*?)\)/mg,
		/dojo.provide\((.*?)\)/mg
	];
	for(var i=0; i<testExps.length; i++){
		tre = testExps[i];
		tmp = tre.exec(contents);
		while(tre.lastIndex > 0){
			mods[0].push(tmp[0]);
			mods[1].push(tmp[1].substr(1, tmp[1].length-2));
			tmp = tre.exec(contents);
		}
	}
	return mods;
}

dojo.getNonExistantDescendants = function(objpath){
	var ret = [];
	// fast path for no periods
	if(typeof objpath != "string"){ return dj_global; }
	if(objpath.indexOf('.') == -1){
		if(dj_undef(objpath, dj_global)){
			ret.push[objpath];
		}
		return ret;
	}

	var syms = objpath.split(/\./);
	var obj = dj_global;
	for(var i=0;i<syms.length;++i){
		if(dj_undef(syms[i], obj)){
			for(var j=i; j<syms.length; j++){
				ret.push(syms.slice(0, j+1).join("."));
			}
			break;
		}
	}
	return ret;
}

dojo.clobberLastObject = function(objpath){
	if(objpath.indexOf('.') == -1){
		if(!dj_undef(objpath, dj_global)){
			delete dj_global[objpath];
		}
		return true;
	}

	var syms = objpath.split(/\./);
	var base = dojo.evalObjPath(syms.slice(0, -1).join("."), false);
	var child = syms[syms.length-1];
	if(!dj_undef(child, base)){
		// alert(objpath);
		delete base[child];
		return true;
	}
	return false;
}

var removals = [];

function zip(arr){
	var ret = [];
	var seen = {};
	for(var x=0; x<arr.length; x++){
		if(!seen[arr[x]]){
			ret.push(arr[x]);
			seen[arr[x]] = true;
		}
	}
	return ret;
}

// over-write dj_eval to prevent actual loading of subsequent files
var old_dj_eval = dj_eval;
dj_eval = function(){ return true; }
dojo.hostenv.oldLoadUri = dojo.hostenv.loadUri;
dojo.hostenv.loadUri = function(uri){
	if(dojo.hostenv.loadedUris[uri]){
		return;
	}
	var contents = this.getText(uri, null, true);
	if(!contents){ 
		dojo.debug("fail:", uri);
		return 0;
	}
	// dojo.debug(uri);
	try{
		// FIXME: need to get a list of the "provided" objects here and remove
		// after requires[] is eval()'d
		var requires = dojo.hostenv.getDepsForEval(contents);
		var ptemp = dojo.hostenv.getProvidesForEval(contents);
		var provides = ptemp[0];
		var providesObjs = ptemp[1];
		// alert(provides);
		for(var x=0; x<providesObjs.length; x++){
			removals = 	zip(
							removals.concat(
								dojo.getNonExistantDescendants(providesObjs[x])
							)
						);
		}
		eval(provides.join(";"));
		eval(requires.join(";"));
		dojo.hostenv.loadedUris.push(uri);
		dojo.hostenv.loadedUris[uri] = true;
	}catch(e){ 
		alert(e);
	}
	return true;
}

dojo.hostenv.writeIncludes = function(){
	for(var x=removals.length-1; x>=0; x--){
		dojo.clobberLastObject(removals[x]);
	}
	var depList = [];
	var seen = {};
	for(var x=0; x<dojo.hostenv.loadedUris.length; x++){
		var curi = dojo.hostenv.loadedUris[x];
		// dojo.debug(curi);
		if(!seen[curi]){
			seen[curi] = true;
			depList.push(curi);
		}
	}

	dojo.hostenv._global_omit_module_check = true;
	for(var x=3; x<depList.length; x++){
		document.write("<script type='text/javascript' src='"+depList[x]+"'></script>");
	}
	document.write("<script type='text/javascript'>dojo.hostenv._global_omit_module_check = false;</script>");
	dj_eval = old_dj_eval;
}
