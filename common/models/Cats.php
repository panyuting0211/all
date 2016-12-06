<?php

namespace common\models;

use common\models\base\Base;
use Yii;

/**
 * This is the model class for table "cats".
 *
 * @property integer $id
 * @property string $cat_name
 */
class Cats extends Base
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'cats';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cat_name'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'cat_name' => '分类',
        ];
    }

    /**
     * @Description:获取所有分类
     * @Return:
     * @Author: 潘玉婷 @panyuting
     * @Date: 2016/11/28 11:32
     * @Version 2.0
     */
    public static function getAllCats()
    {
        $cat=['0'=>'请选择分类'];
        $res=self::find()->asArray()->all();
        if ($res)
        {
            foreach ($res as $k =>$v)
            {
                $cat[$v['id']]=$v['cat_name'];
            }
        }
        return $cat;
    }
}
