//值-字符串mapping转换
function valueToText(str, value) {
	//去掉大括号
	str = str.substring(1, str.length - 1);
	console.log("str=" + str);
	//逗号分隔
	var array = str.split(",");
	for (var i = 0; i < array.length; i++) {
		console.log("value=" + value);
		//根据等号前后分割 根据等号前面的值判断 返回后面的值(为什么会多出空格？)
		//因为多了空格 substring不好用
		console.log("array[" + i + "]:" + array[i]);
		var array2 = array[i].split("=");
		if ($.trim(array2[0]) == $.trim(value)) {
			return array2[1].trim();
		}
	}
}