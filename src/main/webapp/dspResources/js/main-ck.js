require.config({urlArgs:"bust="+(new Date).getTime(),paths:{jquery:"vendor/jquery-1.10.1.min",bootstrap:"vendor/bootstrap.min","responsive-tables":"vendor/responsive-tables",templating:"templating"},shim:{bootstrap:["jquery"],"responsive-tables":["jquery"]}});require(["jquery","templating","bootstrap","responsive-tables"],function(e,t){var n=new t;n.init();e(document).on("show.bs.modal",".modal",function(){var t=e(window).height(),n=e(".wrap").outerHeight();t>=n&&e(document.body).removeClass("modal-open")})});