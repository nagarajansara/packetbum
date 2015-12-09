function PopUp(config) {
	config = config ? config : {};
	this.parentId = config.parentId ? config.parentId : '';
	this.body = config.body;
	this.width = config.width ? config.width : "50%";
	this.height = config.height ? config.height : "auto";
	this.backgroundColor = config.backgroundColor ? config.backgroundColor
			: "#FFFFFF";
	this.top = config.top ? config.top : "23%";
	this.right = config.right ? config.right : "24%";
	this.height = config.height ? config.height : "auto";
	this.title = config.title ? config.title : "&nbsp;";
	this.doneCbk = config.doneCbk;
	this.body = config.body ? config.body : "";
	this.closeIcon = config.closeIcon ? '' : "close";
	// this.title = config.title ? config.title : "";
	this.minwidth = config.minwidth ? config.minwidth : "50%";
	this.parentClass = config.parentClass ? config.parentClass : '';
	this.position = config.position ? config.position : 'absolute';
};
PopUp.prototype.render = function() {
	var tObj = this, html = '<div class="lsModal" id="' + tObj.parentId + '">'
			+ '<fieldset>' + '<legend>' + '<div class="lsModalHead">'
			+ '<span>' + tObj.title + '</span>' + '<div class="lsModalClose">'
			+ '<a class="btn_close">' + tObj.closeIcon + '</a>&nbsp' + ''
			+ '</div>' + '</div>' + '</legend>'
			+ '<div class="lsModalBodyCont" align="center">' + tObj.body
			+ '</div>' + '</fieldset>' + '</div>', modalHtml = '<div class="lsModalMask">'
			+ '</div>';
	tObj.removeModal();
	$('body').append(html);
	$('body').append(modalHtml);

	tObj.setStyleComp();
	tObj.registerEvents();
	if (tObj.doneCbk) {
		tObj.doneCbk();
	}
};
PopUp.prototype.setStyleComp = function() {
	var tObj = this, lsModal = {
		"background-color" : tObj.backgroundColor,
		"top" : tObj.top,
		"right" : tObj.right,
		"height" : tObj.height,
		"width" : tObj.width,
		"min-width" : tObj.minwidth,
		"position" : tObj.position
	}
	$(".lsModal").css(lsModal);

	$(".lsModalMask").css({
		height : $("body").height()
	});
	if ($('object').length > 0) {
		$(".lsModalMask").css({
			opacity : 1
		});
	} else {
		$(".lsModalMask").css({
			opacity : 0.55
		});
	}
};
PopUp.prototype.registerEvents = function() {
	// var tObj = this;
	$('.lsModalClose').click(function() {
		$(".lsModal, .lsModalMask").css({
			"display" : "none"
		})
		$(".lsModal, .lsModalMask").remove();
	});
	/*
	 * if(tObj.parentClass) { $(document).click(function(e) { var cbk =
	 * function($i, e) { return $i.length>0 &&
	 * $(e.target).parents().andSelf().index($i)>-1 ; }
	 * 
	 * if(!cbk($('.lsModal'), e ) && !cbk($(tObj.parentClass), e )) {
	 * $('.lsModalClose').trigger('click'); } }); } else {
	 * //$(document).unbind('click'); }
	 */
};
PopUp.prototype.removeModal = function() {
	$('.lsModalClose').trigger('click');
}