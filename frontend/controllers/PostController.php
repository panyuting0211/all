<?php
namespace frontend\controllers;

use common\models\Cats;
use common\models\PostExtends;
use frontend\models\PostsForm;
use Yii;
use frontend\controllers\base\BaseController;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;

/**
 * @Created by PhpStorm.
 * @Desc:文章控制器
 * @Author: panyuting
 * @Date: 2016/11/24 16:03
 */
class PostController extends BaseController
{

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['index', 'create', 'upload', 'ueditor'],
                'rules' => [
                    [
                        'actions' => ['index', 'upload', 'ueditor'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['create'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    '*' => ['get', 'post'],
                ],
            ],
        ];
    }


    /**
     * @Description:配置
     * @Params:
     * @Return:
     * @Author: 潘玉婷 @panyuting
     * @Date: 2016/11/30 11:22
     * @Version 2.0
     */
    public function actions()
    {
        return [
            'upload' => [
                'class' => 'common\widgets\file_upload\UploadAction',     //这里扩展地址别写错
                'config' => [
                    'imagePathFormat' => "/image/{yyyy}{mm}{dd}/{time}{rand:6}",
                ]
            ],
            'ueditor' => [
                'class' => 'common\widgets\ueditor\UeditorAction',
                'config' => [
                    //上传图片配置
                    'imageUrlPrefix' => "", /* 图片访问路径前缀 */
                    'imagePathFormat' => "/image/{yyyy}{mm}{dd}/{time}{rand:6}", /* 上传保存路径,可以自定义保存路径和文件名格式 */
                ]
            ]
        ];
    }

    /**
     * @Description:文章基础列表
     * @Return:
     * @Author: 潘玉婷 @panyuting
     * @Date: 2016/11/24 16:06
     * @Version 2.0
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    /**
     * @Description:创建文章
     * @Return:
     * @Author: 潘玉婷 @panyuting
     * @Date: 2016/11/25 13:44
     * @Version 2.0
     */
    public function actionCreate()
    {
        $model = new PostsForm();
        //定义场景
        $model->setScenario(PostsForm::SCENARIOS_CREATE);
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if (!$model->create()) {
                Yii::$app->session->setFlash('warning', $model->_lastError);

            } else {

                return $this->redirect(['post/view', 'id' => $model->id]);
            }
        }

        $cat = Cats::getAllCats();
        return $this->render('create', ['model' => $model, 'cat' => $cat]);
    }

    /**
     * @Description:文章详情
     * @Params:
     * @Return:
     * @Author: 潘玉婷 @panyuting
     * @Date: 2016/11/30 11:42
     * @Version 2.0
     */
    public function actionView($id)
    {
        $model = new PostsForm();
        $data = $model->getViewById($id);

        //文章统计
        $model = new PostExtends();
        $model->upCounter(['post_id' => $id], 'browser', 1);

        return $this->render('view', ['data' => $data]);
    }
}