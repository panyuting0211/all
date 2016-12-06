<?php
namespace frontend\models;
use common\models\Tags;
use yii\base\Exception;
use yii\base\Model;

/**
 * @Created by PhpStorm.
 * @Desc:
 * @Author: panyuting
 * @Date: 2016/11/29 14:35
 */
class TagForm extends Model
{
    public $id;
    public $tags;

    public function rules()
    {
        return [
            ['tags','required'],
            ['tags','each','rule'=>['String']],
        ];
    }

    /**
     * @Description:保存标签集合
     * @Params:
     * @Return:
     * @Author: 潘玉婷 @panyuting
     * @Date: 2016/11/30 11:05
     * @Version 2.0
     */
    public function saveTags()
    {
        $ids = [];
        if (!empty($this->tags))
        {
            foreach ($this->tags as $tag)
            {
                $ids[]=$this->_saveTag($tag);
            }
        }

        return $ids;
    }

    /**
     * @Description:保存单个标签
     * @Params:
     * @Return:
     * @Author: 潘玉婷 @panyuting
     * @Date: 2016/11/30 11:13
     * @Version 2.0
     */
    private function _saveTag($tag)
    {
        $model = new Tags();
        $res = $model->find()->where(['tag_name'=>$tag])->one();
        //新建标签
        if (!$res)
        {
            $model->tag_name=$tag;
            $model->post_num=1;
            if (!$model->save())
            {
                throw new \Exception("保存标签失败！");
            }
            return $model->id;
        }else
        {
            $res->updateCounters(['post_num'=>1]);
        }

        return $res->id;

    }

}