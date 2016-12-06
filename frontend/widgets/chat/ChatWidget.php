<?php
namespace frontend\widgets\chat;
/**
 * @Created by PhpStorm.
 * @Desc:
 * @Author: panyuting
 * @Date: 2016/12/1 11:28
 */

use frontend\models\FeedForm;
use Yii;
use yii\bootstrap\Widget;

class ChatWidget extends Widget
{
    public function run()
    {
        $feed = new FeedForm();
        $data['feed'] = $feed ->getList();
        return $this->render('index',['data'=>$data]);
    }
}