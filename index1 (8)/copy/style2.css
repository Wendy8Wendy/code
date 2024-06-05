function copy(str = '', callback) {
            const element = document.createElement('textarea');
            element.value = str;
            element.addEventListener('copy', (e) => {
                e.stopPropagation();
                if (e.clipboardData) {
                    e.preventDefault();
                    e.clipboardData.clearData();
                    e.clipboardData.setData('text/plain', str);
                }
            });
            document.body.appendChild(element);
            //选中需要复制的内容
            element.select();
            //执行复制
            document.execCommand('copy');
            //删除dom
            element.remove();
            if (typeof callback === 'function') {
                callback();
            }
        }
        jQuery(document).ready(function ($) {
            let copyid = 0;
            $('pre').each(function () {
                copyid++;
                $(this).attr('data-copyid', copyid).wrap('<div class="pre-wrapper"/>');
                $(this).parent().css('margin', $(this).css('margin'));
                $('<button class="copy-snippet">复制</button>').insertAfter($(this)).data('copytarget', copyid);
            });
            $('body').on('click', '.copy-snippet', function (ev) {
                ev.preventDefault();
                const $copyButton = $(this);
                $pre = $(document).find('pre[data-copyid=' + $copyButton.data('copytarget') + ']');
                if ($pre.length) {
                    try {
                        copy($pre[0].innerText);
                        $copyButton.text('复制成功').prop('disabled', true);
                    } catch (e) {
                        $copyButton.text('复制失败').prop('disabled', true);
                    }
                    setTimeout(function () {
                        $copyButton.text('复制').prop('disabled', false);
                    }, 3000);
                }
            });
        });