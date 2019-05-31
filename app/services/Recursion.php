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
            if ($cate['parent'] == $parent) {
                $children = static::recursion($arrays, $cate['id'], $level + 1);
                $result[$cate['id']] = $cate;
                // nếu tồn tại cate con nhỏ nhất
                if ($children) {
                    foreach ($children as $c) {
                        $result[$c['id']] = $c;
                    }
                }

            }
        }
        return $result;
    }

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
                showCategories($categories, $item['id'], $char.'|---');
            }
        }
    }

}