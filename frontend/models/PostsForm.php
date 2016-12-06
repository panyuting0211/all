<?php
namespace frontend\models;

use common\models\Posts;
use common\models\RelationPostTags;
use yii\base\Exception;
use yii\base\Model;
use Yii;
use yii\db\Query;
use yii\web\NotFoundHttpException;

/**
 * @Created by PhpStorm.
 * @Desc:文章表单模型
 * @Author: panyuting
 * @Date: 2016/11/25 9:44
 */
class PostsForm extends Model
{
    public $id;
    public $title;
    public $content;
    public $label_img;
    public $cat_id;
    public $tags;

    public $_lastError = "";

    /**
     * 定义场景
     * SCENARIOS_CREATE 创建
     * SCENARIOS_UPDATE 更新
     * */
    const SCENARIOS_CREATE = "create";
    const SCENARIOS_UPDATE = "update";

    /**
     * @Description:定义事件
     * @Params:EVENT_AFTER_CREATE 创建之后的事件；EVENT_AFTER_UPDATE 更新之后的事件
     * @Return:
     * @Author: 潘玉婷 @panyuting
     * @Date: 2016/11/29 11:25
     * @Version 2.0
     */
    const EVENT_AFTER_CREATE = "eventAfterCreate";
    const EVENT_AFTER_UPDATE = "eventAfterUpdate";


    /**
     * @Description:场景设置
     * @Return:
     * @Author: 潘玉婷 @panyuting
     * @Date: 2016/11/28 15:53
     * @Version 2.0
     */
    public function scenarios()
    {
        $scenarios = [
            self::SCENARIOS_CREATE => ['title', 'content', 'label_img', 'cat_id', 'tags'],
            self::SCENARIOS_UPDATE => ['title', 'content', 'label_img', 'cat_id', 'tags'],
        ];
        return array_merge(parent::scenarios(), $scenarios);
    }

    public function rules()
    {
        return [
            [['id', 'title', 'content', 'cat_id'], 'required'],
            [['id', 'cat_id'], 'integer'],
            ['title', 'string', 'min' => 4, 'max' => 50],
        ];
    }

    public function attributeLabels()
    {
        return [
            'title' => '标题',
            'cat_id' => '分类',
            'content' => '内容',
            'label_img' => '标签图',
            'tags' => '标签',
        ];
    }

    /**
     * @Description:获取文章标题列表
     * @Params:
     * @Return:
     * @Author: 潘玉婷 @panyuting
     * @Date: 2016/12/1 9:44
     * @Version 2.0
     */
    public static function getList($cond, $curPage = 1, $pageSize = 5, $orderBy = ['id' => SORT_DESC])
    {
        $model = new Posts();
        $select = ['id', 'title', 'summary', 'label_img', 'cat_id', 'user_id', 'user_name', 'is_valid', 'created_at', 'updated_at'];

        $query = $model->find()->select($select)->where($cond)->with('relate.tag', 'extend')->orderBy($orderBy);

        //获取分页数据
        $res = $model->getPages($query, $curPage, $pageSize);
        //格式化
        $res['data'] = self::_formatList($res['data']);
        return $res;
    }

    /**
     * @Description:数据格式化
     * @Params:
     * @Return:
     * @Author: 潘玉婷 @panyuting
     * @Date: 2016/12/1 9:45
     * @Version 2.0
     */
    public static function _formatList($data)
    {
        foreach ($data as $list) {
            $list['tags'] = [];
            if (isset($list['relate']) && !empty($list['relate'])) {
                foreach ($list['relate'] as $lt) {
                    $list['tags'][] = $lt['tag']['tag_name'];
                }
            }
            unset($list['relate']);
        }
        return $data;
    }

    /**
     * @Description:文章创建
     * @Return:
     * @Author: 潘玉婷 @panyuting
     * @Date: 2016/11/29 10:21
     * @Version 2.0
     */
    public function create()
    {
        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = new Posts();
            $model->setAttributes($this->attributes);
            $model->summary = $this->_getSummary();
            $model->user_id = Yii::$app->user->identity->id;
            $model->user_name = Yii::$app->user->identity->username;
            $model->is_valid = Posts::IS_VALID;
            $model->created_at = time();
            $model->updated_at = time();
            if (!$model->save())
                throw new \Exception("文章保存失败！");

            $this->id = $model->id;

            //调用事件
            $data = array_merge($this->getAttributes(), $model->getAttributes());
            $this->_eventAfterCreate($data);

            $transaction->commit();
            return true;
        } catch (\Exception $e) {
            $transaction->rollBack();
            $this->_lastError = $e->getMessage();
            return False;

        }
    }

    public function getViewById($id)
    {
        $res = Posts::find()->with("relate.tag", "extend")->where(['id' => $id])->asArray()->one();
        if (!$res) {
            throw new NotFoundHttpException("文章不存在！");
        }
        $res['tags'] = [];
        if (isset($res['relate']) && !empty($res['relate'])) {
            foreach ($res['relate'] as $k => $v) {
                $res['tags'][] = $v['tag']['tag_name'];
            }
        }
        unset($res['relate']);
        return $res;
    }


    /**
     * @Description:截取文章摘要
     * @Params:$s(起始位置)，$e(结束文章)，$char(字符编码)
     * @Return:
     * @Author: 潘玉婷 @panyuting
     * @Date: 2016/11/29 10:29
     * @Version 2.0
     */
    private function _getSummary($s = 0, $e = 90, $char = "utf-8")
    {
        if (empty($this->content))
            return null;
        return (mb_substr(str_replace('&nbsp;', '', strip_tags($this->content)), $s, $e, $char));

    }

    /**
     * @Description:文章创建之后的事件
     * @Params:
     * @Return:
     * @Author: 潘玉婷 @panyuting
     * @Date: 2016/11/29 10:45
     * @Version 2.0
     */
    public function _eventAfterCreate($data)
    {
        //添加事件
        $this->on(self::EVENT_AFTER_CREATE, [$this, '_eventAddTag'], $data);
        //触发事件
        $this->trigger(self::EVENT_AFTER_CREATE);

    }

    /**
     * @Description:添加标签
     * @Params:
     * @Return:
     * @Author: 潘玉婷 @panyuting
     * @Date: 2016/11/29 11:35
     * @Version 2.0
     */
    public function _eventAddTag($event)
    {
        $tag = new TagForm();
        $tag->tags = $event->data['tags'];
        $tagids = $tag->saveTags();

        //删除原先的关联关系
        RelationPostTags::deleteAll(['post_id' => $event->data['id']]);

        //批量保存文章和标签的关联关系
        if (!empty($tagids)) {
            foreach ($tagids as $k => $v) {
                $row[$k]['post_id'] = $this->id;
                $row[$k]['tag_id'] = $v;
            }

            //批量插入
            $res = (new Query())->createCommand()->batchInsert(RelationPostTags::tableName(), ['post_id', 'tag_id'], $row)->execute();

            //返回结果
            if (!$res)
                throw new \Exception('关联关系保存失败！');
        }


    }


}