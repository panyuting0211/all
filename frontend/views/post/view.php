<?php
use yii\helpers\Url;
use frontend\widgets\hot\HotWidget;

/**
 * @Created by PhpStorm.
 * @Desc:
 * @Author: panyuting
 * @Date: 2016/11/30 14:09
 */
$this->title = $data['title'];
$this->params['breadcrumbs'][] = ['label' => '文章', 'url' => ['post/index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="row">
    <div class="col-lg-9">
        <div class="page-title">
            <h1><?= $data['title'] ?></h1>
            <span>作者：<?= $data['user_name'] ?></span>
            <span>发布：<?= date('Y-m-d', $data['created_at']) ?></span>
            <span>浏览：<?= isset($data['extend']['browser']) ? $data['extend']['browser'] : 0 ?>次</span>
        </div>
        <div class="page-content">
            <?= $data['content'] ?>
        </div>
        <div class="page-tag">
            标签：
            <?php foreach ($data['tags'] as $tag): ?>
                <span><a href="#"><?= $tag ?></a></span>
            <?php endforeach; ?>
        </div>
    </div>
    <div class="col-lg-3">
        <?php if (!\Yii::$app->user->isGuest): ?>
            <p><a href="<?= Url::to(['post/create']) ?>" role="button"
                  class="btn btn-success btn-block btn-post">创建文章<a/></p>
            <?php if (\Yii::$app->user->identity->id == $data['user_id']): ?>
                <p><a href="<?= Url::to(['post/update', 'id' => $data['id']]) ?>" role="button"
                      class="btn btn-info btn-block btn-post">编辑文章<a/></p>
            <?php endif; ?>
        <?php endif; ?>

        <!-- 热门浏览 -->
        <?= HotWidget::widget() ?>
    </div>
</div>
