var Ajax;
if (Ajax && (Ajax != null)) {
	Ajax.Responders.register({
	  onCreate: function() {
        if($('spinner') && Ajax.activeRequestCount>0)
          Effect.Appear('spinner',{duration:0.5,queue:'end'});
	  },
	  onComplete: function() {
        if($('spinner') && Ajax.activeRequestCount==0)
          Effect.Fade('spinner',{duration:0.5,queue:'end'});
	  }
	});
}


function getObjectByID(objectId) {
	if(document.getElementById) {
		return document.getElementById(objectId);
	} else if (document.all) {
		return document.all[objectId];
	} else if (document.layers) {
		return document.layers[objectId];
	} else {
		return null;
	}
}


function hideObject(objectId) {
	var o = getObjectByID(objectId);
	if(o && o.style) {
		o.style.visibility = "hidden";
		o.style.display = "none";
	}
}

function showObject(objectId) {
	var o = getObjectByID(objectId);
	if(o && o.style) {
		o.style.visibility = "visible";
		o.style.display = "";
	}
}