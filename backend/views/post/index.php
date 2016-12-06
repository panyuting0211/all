<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $searchModel common\models\PostSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '内容管理';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="posts-index">


    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Posts', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'id',
            'title'=>[
                'attribute'=>'title',
                'format'=>'raw',
                'value'=>function($model){
                    return '<a href="'.Yii::$app->params['frontUrl'].Url::to(['post/view','id'=>$model->id]).'">'.$model->title.'</a>';
                },
            ],
            'summary'=>[
                'attribute'=>'summary',
                'contentOptions' => ['style' => 'white-space: normal;', 'width' => '30%'],
            ],
            //'content:ntext',
            'label_img'=>[
                'label'=>'封面图',
                'format'=>'raw',
                'value'=>function($m){
                    return Html::img(Yii::$app->params['frontUrl'].$m->label_img,
                        ['class' => 'img-circle', 'width' => 100]
                    );
                }
            ],
             'cat.cat_name',
            // 'user_id',
             'user_name',
             'is_valid'=>[
                 'label'=>'状态',
                 'attribute'=>'is_valid',
                 'value'=>function($model){
                     return ($model->is_valid == 1)?'有效':'无效';
                 },
                 'filter'=>['0'=>'无效','1'=>'有效'],
             ],
             'created_at'=>[
                 'label'=>'创建日期',
                 'format' => ['date', 'php:Y-m-d H:i:s'],
                 'value' => 'created_at',
             ],
            // 'updated_at',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
