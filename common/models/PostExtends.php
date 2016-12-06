<?php

namespace common\models;

use common\models\base\Base;
use Yii;

/**
 * This is the model class for table "post_extends".
 *
 * @property integer $id
 * @property integer $post_id
 * @property integer $browser
 * @property integer $collect
 * @property integer $praise
 * @property integer $comment
 */
class PostExtends extends Base
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'post_extends';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['post_id', 'browser', 'collect', 'praise', 'comment'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'post_id' => 'Post ID',
            'browser' => 'Browser',
            'collect' => 'Collect',
            'praise' => 'Praise',
            'comment' => 'Comment',
        ];
    }

    /**
     * @Description:更新文章统计
     * @Params:
     * @Return:
     * @Author: 潘玉婷 @panyuting
     * @Date: 2016/11/30 16:05
     * @Version 2.0
     */
    public function upCounter($cond,$attribute,$num)
    {
        $counter = $this->findOne($cond);
        if(!$counter)
        {
            $this->setAttributes($cond);
            $this->$attribute = $num;
            $this->save();
        }else
        {
            $countData[$attribute]=$num;
            $counter->updateCounters($countData);

        }

    }
}
