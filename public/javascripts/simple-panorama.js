(function(){window.simplePanorama={modules:{}}}).call(this);window.Modernizr=function(an,am,al){function H(b){ae.cssText=b}function Y(d,c){return H(ab.join(d+";")+(c||""))}function W(d,c){return typeof d===c}function U(d,c){return !!~(""+d).indexOf(c)}function S(f,c){for(var h in f){var g=f[h];if(!U(g,"-")&&ae[g]!==al){return c=="pfx"?g:!0}}return !1}function Q(g,c,j){for(var i in g){var h=c[g[i]];if(h!==al){return j===!1?g[i]:W(h,"function")?h.bind(j||c):h}}return !1}function O(g,f,j){var i=g.charAt(0).toUpperCase()+g.slice(1),h=(g+" "+Z.join(i+" ")+i).split(" ");return W(f,"string")||W(f,"undefined")?S(h,f):(h=(g+" "+X.join(i+" ")+i).split(" "),Q(h,f,j))}var ak="2.6.2",aj={},ai=!0,ah=am.documentElement,ag="modernizr",af=am.createElement(ag),ae=af.style,ad,ac={}.toString,ab=" -webkit- -moz- -o- -ms- ".split(" "),aa="Webkit Moz O ms",Z=aa.split(" "),X=aa.toLowerCase().split(" "),V={},T={},R={},P=[],N=P.slice,M,K=function(v,u,t,s){var r,q,p,o,h=am.createElement("div"),g=am.body,b=g||am.createElement("body");if(parseInt(t,10)){while(t--){p=am.createElement("div"),p.id=s?s[t]:ag+(t+1),h.appendChild(p)}}return r=["&#173;",'<style id="s',ag,'">',v,"</style>"].join(""),h.id=ag,(g?h:b).innerHTML+=r,b.appendChild(h),g||(b.style.background="",b.style.overflow="hidden",o=ah.style.overflow,ah.style.overflow="hidden",ah.appendChild(b)),q=u(h,v),g?h.parentNode.removeChild(h):(b.parentNode.removeChild(b),ah.style.overflow=o),!!q},J={}.hasOwnProperty,I;!W(J,"undefined")&&!W(J.call,"undefined")?I=function(d,c){return J.call(d,c)}:I=function(d,c){return c in d&&W(d.constructor.prototype[c],"undefined")},Function.prototype.bind||(Function.prototype.bind=function(a){var h=this;if(typeof h!="function"){throw new TypeError}var g=N.call(arguments,1),f=function(){if(this instanceof f){var b=function(){};b.prototype=h.prototype;var d=new b,c=h.apply(d,g.concat(N.call(arguments)));return Object(c)===c?c:d}return h.apply(a,g.concat(N.call(arguments)))};return f}),V.touch=function(){var a;return"ontouchstart" in an||an.DocumentTouch&&am instanceof DocumentTouch?a=!0:K(["@media (",ab.join("touch-enabled),("),ag,")","{#modernizr{top:9px;position:absolute}}"].join(""),function(b){a=b.offsetTop===9}),a},V.csstransforms3d=function(){var b=!!O("perspective");return b&&"webkitPerspective" in ah.style&&K("@media (transform-3d),(-webkit-transform-3d){#modernizr{left:9px;position:absolute;height:3px;}}",function(a,d){b=a.offsetLeft===9&&a.offsetHeight===3}),b};for(var L in V){I(V,L)&&(M=L.toLowerCase(),aj[M]=V[L](),P.push((aj[M]?"":"no-")+M))}return aj.addTest=function(e,c){if(typeof e=="object"){for(var f in e){I(e,f)&&aj.addTest(f,e[f])}}else{e=e.toLowerCase();if(aj[e]!==al){return aj}c=typeof c=="function"?c():c,typeof ai!="undefined"&&ai&&(ah.className+=" "+(c?"":"no-")+e),aj[e]=c}return aj},H(""),af=ad=null,function(aq,ap){function z(f,e){var h=f.createElement("p"),g=f.getElementsByTagName("head")[0]||f.documentElement;return h.innerHTML="x<style>"+e+"</style>",g.insertBefore(h.lastChild,g.firstChild)}function y(){var b=s.elements;return typeof b=="string"?b.split(" "):b}function x(d){var c=B[d[D]];return c||(c={},C++,d[D]=C,B[C]=c),c}function w(b,h,e){h||(h=ap);if(A){return h.createElement(b)}e||(e=x(h));var d;return e.cache[b]?d=e.cache[b].cloneNode():F.test(b)?d=(e.cache[b]=e.createElem(b)).cloneNode():d=e.createElem(b),d.canHaveChildren&&!G.test(b)?e.frag.appendChild(d):d}function v(b,l){b||(b=ap);if(A){return b.createDocumentFragment()}l=l||x(b);var k=l.frag.cloneNode(),j=0,i=y(),h=i.length;for(;j<h;j++){k.createElement(i[j])}return k}function u(d,c){c.cache||(c.cache={},c.createElem=d.createElement,c.createFrag=d.createDocumentFragment,c.frag=c.createFrag()),d.createElement=function(a){return s.shivMethods?w(a,d,c):c.createElem(a)},d.createDocumentFragment=Function("h,f","return function(){var n=f.cloneNode(),c=n.createElement;h.shivMethods&&("+y().join().replace(/\w+/g,function(b){return c.createElem(b),c.frag.createElement(b),'c("'+b+'")'})+");return n}")(s,c.frag)}function t(b){b||(b=ap);var d=x(b);return s.shivCSS&&!E&&!d.hasCSS&&(d.hasCSS=!!z(b,"article,aside,figcaption,figure,footer,header,hgroup,nav,section{display:block}mark{background:#FF0;color:#000}")),A||u(b,d),b}var ao=aq.html5||{},G=/^<|^(?:button|map|select|textarea|object|iframe|option|optgroup)$/i,F=/^(?:a|b|code|div|fieldset|h1|h2|h3|h4|h5|h6|i|label|li|ol|p|q|span|strong|style|table|tbody|td|th|tr|ul)$/i,E,D="_html5shiv",C=0,B={},A;(function(){try{var b=ap.createElement("a");b.innerHTML="<xyz></xyz>",E="hidden" in b,A=b.childNodes.length==1||function(){ap.createElement("a");var c=ap.createDocumentFragment();return typeof c.cloneNode=="undefined"||typeof c.createDocumentFragment=="undefined"||typeof c.createElement=="undefined"}()}catch(d){E=!0,A=!0}})();var s={elements:ao.elements||"abbr article aside audio bdi canvas data datalist details figcaption figure footer header hgroup mark meter nav output progress section summary time video",shivCSS:ao.shivCSS!==!1,supportsUnknownElements:A,shivMethods:ao.shivMethods!==!1,type:"default",shivDocument:t,createElement:w,createDocumentFragment:v};aq.html5=s,t(ap)}(this,am),aj._version=ak,aj._prefixes=ab,aj._domPrefixes=X,aj._cssomPrefixes=Z,aj.testProp=function(b){return S([b])},aj.testAllProps=O,aj.testStyles=K,ah.className=ah.className.replace(/(^|\s)no-js(\s|$)/,"$1$2")+(ai?" js "+P.join(" "):""),aj}(this,this.document),function(ad,ac,ab){function aa(b){return"[object Function]"==P.call(b)}function Z(b){return"string"==typeof b}function Y(){}function X(b){return !b||"loaded"==b||"complete"==b||"uninitialized"==b}function W(){var b=O.shift();M=1,b?b.t?R(function(){("c"==b.t?L.injectCss:L.injectJs)(b.s,0,b.a,b.x,b.e,1)},0):(b(),W()):M=0}function V(w,v,t,s,q,p,n){function m(a){if(!g&&X(h.readyState)&&(x.r=g=1,!M&&W(),h.onload=h.onreadystatechange=null,a)){"img"!=w&&R(function(){I.removeChild(h)},50);for(var c in D[v]){D[v].hasOwnProperty(c)&&D[v][c].onload()}}}var n=n||L.errorTimeout,h=ac.createElement(w),g=0,b=0,x={t:t,s:v,e:q,a:p,x:n};1===D[v]&&(b=1,D[v]=[]),"object"==w?h.data=v:(h.src=v,h.type=w),h.width=h.height="0",h.onerror=h.onload=h.onreadystatechange=function(){m.call(this,b)},O.splice(s,0,x),"img"!=w&&(b||2===D[v]?(I.insertBefore(h,J?null:Q),R(m,n)):D[v].push(h))}function U(g,e,j,i,h){return M=0,e=e||"j",Z(g)?V("c"==e?G:H,g,e,this.i++,j,i,h):(O.splice(this.i++,0,g),1==O.length&&W()),this}function T(){var b=L;return b.loader={load:U,i:0},b}var S=ac.documentElement,R=ad.setTimeout,Q=ac.getElementsByTagName("script")[0],P={}.toString,O=[],M=0,K="MozAppearance" in S.style,J=K&&!!ac.createRange().compareNode,I=J?S:Q.parentNode,S=ad.opera&&"[object Opera]"==P.call(ad.opera),S=!!ac.attachEvent&&!S,H=K?"object":S?"script":"img",G=S?"script":H,F=Array.isArray||function(b){return"[object Array]"==P.call(b)},E=[],D={},C={timeout:function(d,c){return c.length&&(d.timeout=c[0]),d}},N,L;L=function(e){function c(i){var i=i.split("!"),h=E.length,q=i.pop(),p=i.length,q={url:q,origUrl:q,prefixes:i},o,l,j;for(l=0;l<p;l++){j=i[l].split("="),(o=C[j.shift()])&&(q=o(q,j))}for(l=0;l<h;l++){q=E[l](q)}return q}function n(b,s,r,q,p){var o=c(b),l=o.autoCallback;o.url.split(".").pop().split("?").shift(),o.bypass||(s&&(s=aa(s)?s:s[b]||s[q]||s[b.split("/").pop().split("?")[0]]),o.instead?o.instead(b,s,r,q,p):(D[o.url]?o.noexec=!0:D[o.url]=1,r.load(o.url,o.forceCSS||!o.forceJS&&"css"==o.url.split(".").pop().split("?").shift()?"c":ab,o.noexec,o.attrs,o.timeout),(aa(s)||aa(l))&&r.load(function(){T(),s&&s(o.origUrl,p,q),l&&l(o.origUrl,p,q),D[o.url]=2})))}function m(w,v){function u(b,h){if(b){if(Z(b)){h||(r=function(){var i=[].slice.call(arguments);q.apply(this,i),p()}),n(b,r,v,0,t)}else{if(Object(b)===b){for(g in o=function(){var a=0,i;for(i in b){b.hasOwnProperty(i)&&a++}return a}(),b){b.hasOwnProperty(g)&&(!h&&!--o&&(aa(r)?r=function(){var i=[].slice.call(arguments);q.apply(this,i),p()}:r[g]=function(i){return function(){var a=[].slice.call(arguments);i&&i.apply(this,a),p()}}(q[g])),n(b[g],r,v,g,t))}}}}else{!h&&p()}}var t=!!w.test,s=w.load||w.both,r=w.callback||Y,q=r,p=w.complete||Y,o,g;u(t?w.yep:w.nope,!!s),s&&u(s)}var k,f,d=this.yepnope.loader;if(Z(e)){n(e,0,d,0)}else{if(F(e)){for(k=0;k<e.length;k++){f=e[k],Z(f)?n(f,0,d,0):F(f)?L(f):Object(f)===f&&m(f,d)}}else{Object(e)===e&&m(e,d)}}},L.addPrefix=function(d,c){C[d]=c},L.addFilter=function(b){E.push(b)},L.errorTimeout=10000,null==ac.readyState&&ac.addEventListener&&(ac.readyState="loading",ac.addEventListener("DOMContentLoaded",N=function(){ac.removeEventListener("DOMContentLoaded",N,0),ac.readyState="complete"},0)),ad.yepnope=T(),ad.yepnope.executeStack=W,ad.yepnope.injectJs=function(r,q,p,n,m,h){var g=ac.createElement("script"),f,b,n=n||L.errorTimeout;g.src=r;for(b in p){g.setAttribute(b,p[b])}q=h?W:q||Y,g.onreadystatechange=g.onload=function(){!f&&X(g.readyState)&&(f=1,q(),g.onload=g.onreadystatechange=null)},R(function(){f||(f=1,q(1))},n),m?g.onload():Q.parentNode.insertBefore(g,Q)},ad.yepnope.injectCss=function(b,n,m,l,k,h){var l=ac.createElement("link"),f,n=h?W:n||Y;l.href=b,l.rel="stylesheet",l.type="text/css";for(f in m){l.setAttribute(f,m[f])}k||(Q.parentNode.insertBefore(l,Q),R(n,0))}}(this,document),Modernizr.load=function(){yepnope.apply(window,[].slice.call(arguments,0))};(function(){simplePanorama.modules.move_mousedown=function(a,b){a.elem.on("mousedown",function(c){if(c.which===1){b.mouseStart=c.pageX;$("html").css("cursor","move");return c.preventDefault()}});$("*").on("mousemove",function(c){if(b.mouseStart!==void 0){return a.targetSpeed=(b.mouseStart-c.pageX)/$(window).width()*3}});return $("*").on("mouseup",function(){if(b.mouseStart!==void 0&&event.which===1){a.targetSpeed=0;$("html").css("cursor","auto");return b.mouseStart=void 0}})};simplePanorama.modules.move_mousehover=function(){return function(a){return a.elem.on("mousemove",function(c){var b;a.targetSpeed=2-(c.pageX-a.elem.position().left)/a.elem.width()*4;b=a.targetSpeed>0?a.targetSpeed<1:a.targetSpeed>-1;if(b){return a.targetSpeed=0}})}};simplePanorama.modules.move_swipe=function(a,b){a.elem.on("touchstart",function(c){a.setSpeed(0.000001);b.touchStart=c.originalEvent.touches[0].pageX;return a.targetSpeed=0});$("*").on("touchmove",function(d){var e,c;if(b.touchStart!==void 0){c=d.originalEvent.changedTouches[0].pageX;e=(b.touchStart-c)/100;console.log($(window).width());if(Math.abs(e)>Math.abs(a.speed)){a.setSpeed(e)}return b.touchStart=c}});return $("*").on("touchend",function(){if(b.touchStart!==void 0){return b.touchStart=void 0}})};simplePanorama.modules.move_touch=function(a,b){a.elem.on("touchstart",function(c){a.setSpeed(0.000001);return b.touchStart=c.originalEvent.touches[0].pageX});$("*").on("touchmove",function(c){if(b.touchStart!==void 0){return a.targetSpeed=(b.touchStart-c.originalEvent.touches[0].pageX)/200}});return $("*").on("touchend",function(){if(b.touchStart!==void 0){a.targetSpeed=0;return b.touchStart=void 0}})};simplePanorama.modules.show_coordinates=function(a){var f,b,g,e,d,c;f=$('<div class="scInfoBox"><p></p><p></p><p></p></div>');g={};b={};d={};e="SCTemp_9012457832451";c=function(){$(f.children("p")[0]).html("Cursor: "+g.x+" "+g.y+"<br />Rotation: "+a.getRotation());if(d.path){$(f.children("p")[1]).html("Rechteck: "+d.path);d={}}if(b.path){$(f.children("p")[2]).html("Kreis: "+b.path);return b={}}};$(a).on("loaded",function(){f.insertBefore(a.elem);return setInterval(c,1000/30)});a.elem.on("mousedown",function(h){switch(h.which){case 3:return d.start=g;case 2:return b.pos=g}});a.elem.on("mouseup",function(h){switch(h.which){case 3:return d.path=d.x+","+d.y+","+(d.x+d.w)+","+(d.y+d.h);case 2:return b.path=b.pos.x+","+b.pos.y+","+b.r}});return $("*").on("mousemove",function(h){g=a.getRelativePos(h.pageX,h.pageY);if(d.start){d.w=Math.abs(g.x-d.start.x);d.h=Math.abs(g.y-d.start.y);d.x=Math.min(g.x,d.start.x);d.y=Math.min(g.y,d.start.y);a.removeHotspots("rect"+e);a.createRectHotspot("",d.x,d.y,d.w,d.h,"rect"+e)}if(b.pos){b.r=Math.max(Math.abs(b.pos.x-g.x),Math.abs(b.pos.y-g.y));a.removeHotspots("circ"+e);return a.createCircleHotspot("",b.pos.x,b.pos.y,b.r,"circ"+e)}})}}).call(this);(function(){window.SimplePanorama=(function(){function a(c){var d,b,e;this.maxPos=0;this.width=0;this.elem=null;this.img=null;this.subElem=null;this.pos=0;this.targetSpeed=0;this.speed=0;this.counter=0;this.hsCounter=0;this.isRepeative=null;this.moduleData={};this.offset=0;this.hotspots={};e=c.elem;if((!e)&&c.selector){e=$(c.selector)}if(!e.length){console.error('No DOM element supplied for panorama, use "elem" or "selector."');return null}this.elem=$('<div class="sp-container"></div>');d=c.imagePath;if(!d){console.error('No image path supplied for panorama, use "imagePath".');return null}if(c.initialPos){this.pos=-c.initialPos}this.isRepeative=c.repeative===void 0?true:c.repeative;this.img=new Image;b=this;this.img.onload=function(){var g,h,f,k,j;b.elem.css("height",this.height+"px");h="<div>";f=b.isRepeative?2:0;for(g=k=0;0<=f?k<=f:k>=f;g=0<=f?++k:--k){h+='<img class="sp-image sp-number_'+g+'" src="'+d+'" alt"Panorama" />'}b.elem.html(h+"</div>");b.subElem=$(b.elem.children()[0]);b.offset=b.isRepeative?this.width:0;b.subElem.css({width:this.width*(f+1)+"px",left:"-"+b.offset+"px"});b.lastTick=(new Date).getTime();b.updateSpeedTicks=0;window.setInterval((function(){return b.updatePano()}),1);b.elem.on("touchstart",function(i){return i.preventDefault()});b.elem.mousedown(function(i){return i.preventDefault()});b.elem.attr("oncontextmenu","return false;");if(c.modules){$.each(c.modules,function(l,m){b.moduleData[m]={};return simplePanorama.modules[m](b,b.moduleData[m])})}e.html(b.elem);$(window).trigger("resize");if((j=c.callback)!=null){j.call(b)}return $(b).trigger("loaded")};$(window).resize(function(){b.width=b.img.width<b.elem.width()?b.img.width:b.elem.parent().innerWidth();b.elem.css("width",b.width+"px");return b.maxPos=b.isRepeative?b.img.width:b.img.width-b.width});this.img.src=d}a.prototype.updateSpeed=function(){if(this.speedOverride){this.speed=this.speedOverride;return this.speedOverride=false}else{return this.speed=(1.8*this.speed+0.2*this.targetSpeed)/2}};a.prototype.setSpeed=function(b){return this.speedOverride=b};a.prototype.updatePano=function(){var d,b,e,c;e=new Date().getTime();b=e-this.lastTick;this.lastTick=e;this.updateSpeedTicks+=b;if(this.updateSpeedTicks>50){this.updateSpeed();this.updateSpeedTicks=0}if(this.subElem!==null){d=this.pos+this.speed*b;if(this.isRepeative){d=d%this.maxPos}else{if(d>0){d=0}else{if(d<-this.maxPos){d=-this.maxPos}}}this.pos=d;if(Modernizr.csstransforms3d){c="translate3D("+this.pos+"px, 0, 0)";return this.subElem.css({"-o-transform":c,"-webkit-transform":c,"-moz-transform":c,"-ms-transform":c,transform:c})}else{return this.subElem.css("left",this.pos-this.offset+"px")}}};a.prototype.createCircleHotspot=function(f,b,g,e,d){var c;c=this.prepareHotspot(f,"sp-circ",b-e,g-e,e*2,e*2);c.css("border-radius",e+"px");return this.populateTripleBuffer(c,d)};a.prototype.createRectHotspot=function(g,b,i,c,e,f){var d;d=this.prepareHotspot(g,"sp-rect",b,i,c,e);return this.populateTripleBuffer(d,f)};a.prototype.prepareHotspot=function(g,e,c,i,d,f){var b;b=$('<div class="sp-number-'+ ++this.hsCounter+" sp-hotspot "+e+'"><div class="sp-hotspot-content">'+g+"</div></div>");b.css({left:c+"px",top:i+"px",width:d+"px",height:f+"px"});return b};a.prototype.getRelativePos=function(d,c){var f,b,e;f=this.elem.offset().left;e=this.elem.offset().top;b=new Object();b.x=Math.floor(d-f+this.img.width-this.pos);b.x%=this.img.width;b.y=Math.floor(c-e);if(b.y<0){b.y=0}return b};a.prototype.getRotation=function(){return this.getRelativePos(this.elem.offset().left,0).x};a.prototype.populateTripleBuffer=function(e,d){var c,b,f;if(!this.hotspots[d]){this.hotspots[d]=[]}if(this.isRepeative){c=e.clone();b=e.clone();f=parseInt(e.css("left").slice(0,-2));c.css("left",f+this.img.width+"px");b.css("left",f+this.img.width*2+"px");this.subElem.append(c,b);this.hotspots[d].push(c,b)}this.subElem.append(e);return this.hotspots[d].push(e)};a.prototype.showHotspots=function(e,h){var d,g,c,f,b;if(h==null){h=true}f=this.hotspots[e];b=[];for(g=0,c=f.length;g<c;g++){d=f[g];if(h){b.push($(d).show())}else{b.push($(d).hide())}}return b};a.prototype.removeHotspots=function(d){var c,f,b,e;if(this.hotspots[d]){e=this.hotspots[d];for(f=0,b=e.length;f<b;f++){c=e[f];$(c).remove()}return this.hotspots[d]=[]}};return a})()}).call(this);