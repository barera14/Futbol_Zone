	!function(e){
		"use strict"; var t = function(){
	}; 
	t.prototype.init = function(){
		if (e.isFunction(e.fn.fullCalendar)){
			e("#external-events .fc-event").each(function(){
				var t = {
					title:e.trim(e(this).text())
				};
				e(this).data("eventObject", t), e(this).draggable({
					zIndex:999, revert:!0, revertDuration:0
				})
			}); 
		var t = new Date, a = t.getDate(), n = t.getMonth(), r = t.getFullYear(); 
		var calendarioN = new Date(17,12,23);
		var a1 = calendarioN.getDate();
		var n1 = calendarioN.getMonth();
		var r1 = calendarioN.getFullYear();
		e("#calendar").fullCalendar({
			header:{
				left:"prev,next today", center:"title", right:"month,basicWeek,basicDay"
			}, 
			editable:!0, eventLimit:!0, droppable:!0, drop:function(t, a){
				var n = e(this).data("eventObject"), r = e.extend({
				}, n); 
			r.start = t, r.allDay = a, e("#calendar").fullCalendar("renderEvent", r, !0), e("#drop-remove").is(":checked") && e(this).remove()}, 
                    events:[{title:"Exitos", start:new Date(r, n, 22, 10, 0), end:new Date(r, n, a, 12, 0), allDay:!1}]}), e("#add_event_form").on("submit", function(t){
t.preventDefault(); var a = e(this).find(".new-event-form"), n = a.val(); if (n.length < 3)a.focus();  else{
var r = "new" + Math.random().toString(36).substring(7); e("#external-events").append('<div id="' + r + '" class="fc-event">' + n + "</div>"); var i = {
title:e.trim(e("#" + r).text())}; e("#" + r).data("eventObject", i), e("#" + r).draggable({
revert:!0, revertDuration:0, zIndex:999}), a.val("").focus()}})} else alert("Calendar plugin is not installed")}, e.CalendarPage = new t, e.CalendarPage.Constructor = t}(window.jQuery), function(e){
"use strict"; e.CalendarPage.init()}(window.jQuery);

console.log("Hoola Mundo");