<?php
namespace frontend\widgets\post;
use common\models\Posts;
use frontend\models\PostsForm;
use yii\base\Widget;
use Yii;
use yii\data\Pagination;
use yii\helpers\Url;

/**
 * @Created by PhpStorm.
 * @Desc:文章列表组件
 * @Author: panyuting
 * @Date: 2016/11/30 16:19
 */
class PostWidget extends Widget
{
    /**
     * 文章列表标题
     * @var string
     */
    public $title ="";
    /**
     * 显示条数
     * @var int
     */
    public $limit = 5;
    /**
     * 是否显示更多
     * @var bool
     */
    public $more = true;
    /**
     * 是否显示分页
     * @var bool
     */
    public $page = true;

    public function run()
    {
        $curPage = Yii::$app->request->get("page",1);
        //查询条件
        $cond = ["=","is_valid",Posts::IS_VALID];
        $res = PostsForm::getList($cond,$curPage,$this->limit);
        $result['title'] = $this->title? :"最新文章";
        $result['more'] = Url::to(["post/index"]);
        $result['body']=$res['data']? :[];
        //是否显示分页
        if($this->page)
        {
            $pages = new Pagination(['totalCount'=>$res['count'],'pageSize'=>$res['pageSize']]);
            $result['page'] = $pages;
        }
        return $this->render('index',['data'=>$result]);
    }
}