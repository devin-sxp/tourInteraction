/**
 * Created by shenxp on 2016/10/2.
 */

/**
 * 时间戳转换为年月日时分秒格式
 * @param m
 * @returns {string}
 */
var  add0 = function(m){
    return m<10?'0'+m:m
}
var stampToStandard = function(createTime){
    var time = new Date(createTime);
    var y = time.getFullYear();
    var m = time.getMonth()+1;
    var d = time.getDate();
    var h = time.getHours();
    var mm = time.getMinutes();
    var s = time.getSeconds();

    var createtime = y+'-'+add0(m)+'-'+add0(d)+' '+add0(h)+':'+add0(mm)+':'+add0(s);

    return createtime;

}