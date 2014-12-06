
/**
 * 图片预览
 * @author wl
 * */


function previewImage(file)
{
    var MAXWIDTH = 60;
    var MAXHEIGHT = 60;
    var div = $(file).parent().find('.preview');
    var num = $(file).parent().find('.preview').length;
    if (num == 0) {
        var div = $(file).parent().parent().find('.preview');
    }
    if (file.files && file.files[0]){//适配谷歌
        div.html('<img class="imghead" />');
        // 获取jquery对象
        var $img = $(file).parent().find('.imghead');
        var img_num = $(file).parent().find('.imghead').length;
        if (img_num == 0) {
            var $img = $(file).parent().parent().find('.imghead');
        }
        // 对象是数组，通过索引取出dom
        var img = $img[0];
        img.onload = function () {
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            img.width = rect.width;
            img.height = rect.height;
            img.style.marginLeft = rect.left + 'px';
            img.style.marginTop = rect.top + 'px';
        };
        var reader = new FileReader();
        reader.onload = function (evt) {
            img.src = evt.target.result;
        };
        reader.readAsDataURL(file.files[0]);
    } else {//适配IE
        var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
        file.select();
        file.blur();
        var src = document.selection.createRange().text;
        div.html('<img class="imghead">');
        var $img = $(file).parent().find('.imghead');
        var img_num = $(file).parent().find('.imghead').length;
        if (img_num == 0) {
            var $img = $(file).parent().parent().find('.imghead');
        }
        var img = $img[0];
        img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
        var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
        status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
        div.html("<div class='divhead' style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;margin-left:" + rect.left + "px;" + sFilter + src + "\"'></div>");
    }
}

function clacImgZoomParam(maxWidth, maxHeight, width, height) {
    var param = {top: 0, left: 0, width: width, height: height};
    if (width > maxWidth || height > maxHeight)
    {
        rateWidth = width / maxWidth;
        rateHeight = height / maxHeight;

        if (rateWidth > rateHeight)
        {
            param.width = maxWidth;
            param.height = Math.round(height / rateWidth);
        } else
        {
            param.width = Math.round(width / rateHeight);
            param.height = maxHeight;
        }
    }

    param.left = Math.round((maxWidth - param.width) / 2);
    param.top = Math.round((maxHeight - param.height) / 2);
    return param;
}
