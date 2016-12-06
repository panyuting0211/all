<?php
namespace frontend\widgets\banner;

use Yii;
use yii\bootstrap\Widget;

/**
 * @Created by PhpStorm.
 * @Desc:
 * @Author: panyuting
 * @Date: 2016/12/1 11:28
 */
class BannerWidget extends Widget
{
    public $items=[];

    public function init()
    {
        if (empty($this->items))
        {
            $this->items=[
                [
                    'label'=>'demo',
                    'image_url'=>'/statics/images/banner/b_0.jpg',
                    'url'=>['site/index'],
                    'html'=>'',
                    'active'=>'active',
                ],
                [
                    'label'=>'demo',
                    'image_url'=>'/statics/images/banner/b_1.jpg',
                    'url'=>['site/index'],
                    'html'=>'',
                ],
                [
                    'label'=>'demo',
                    'image_url'=>'/statics/images/banner/b_2.jpg',
                    'url'=>['site/index'],
                    'html'=>'',
                ],
            ];
        }
    }

    public function run()
    {
       $data['items']=$this->items;
        return $this->render('index',['data'=>$data]);
    }
}