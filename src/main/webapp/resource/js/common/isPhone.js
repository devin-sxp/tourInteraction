/**
 * 
 */
function isPhone(){
    var userAgentInfo = navigator.userAgent;
    var Agents = ["Android", "iPhone",
                "SymbianOS", "Windows Phone",
                "iPad", "iPod"];
    var flag = false;
    for (var v = 0; v < Agents.length; v++) {
        if (userAgentInfo.indexOf(Agents[v]) > 0) {
            flag = true;
            break;
        }
    }
    return flag;
};

function isPhoneByReg(){
	if(/Android|webOS|iPhone|iPod|BlackBerry/i.test(navigator.userAgent)) {
	    return true;
	} 
}