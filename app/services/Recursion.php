<?php

namespace Website\Services;

class Recursion
{

    /*
     * Đệ Quy
     *
     */
    public static function recursion($arrays, $parent = 0, $level = 1)
    {
        $result = array();
        foreach ($arrays as $cate) {
            $cate['level'] = $level;
            // nếu là cate con
            if ($cate['parent'] == $parent) {
                // loop cate con
                $children = self::recursion($arrays, $cate['id'], $level + 1);
                $result[$cate['id']] = $cate;
                // nếu tồn tại cate con nhỏ nhất lấy ra
                if ($children) {
                    foreach ($children as $c) {
                        $result[$c['id']] = $c;
                    }
                }
            }
        }
        return $result;
    }
    /*
     * Đệ quy hiện trong thẻ <select> trong volt
     */
    public static function  showCategories($categories, $parent_id = 0, $char = '')
    {
        foreach ($categories as $key => $item)
        {
            // Nếu là chuyên mục con thì hiển thị
            if ($item['parent_id'] == $parent_id)
            {
                echo '<option value="'.$item[$key].'">';
                echo $char . $item['title'];
                echo '</option>';

                // Xóa chuyên mục đã lặp
                unset($categories[$key]);

                // Tiếp tục đệ quy để tìm chuyên mục con của chuyên mục đang lặp
                self::showCategories($categories, $item['id'], $char.'|---');
            }
        }
    }

}