<?php
/**
 * @Created by PhpStorm.
 * @Desc:
 * @Author: panyuting
 * @Date: 2016/11/24 16:08
 */
use frontend\widgets\post\PostWidget;
use frontend\widgets\hot\HotWidget;
use frontend\widgets\tag\TagWidget;
use yii\helpers\Url;

?>
<div class="row">
    <div class="col-lg-9">
        <!-- 文章列表 -->
        <?= PostWidget::widget() ?>
    </div>
    <div class="col-lg-3">
        <div class="panel">
            <?php if (!\Yii::$app->user->isGuest): ?>
                <p><a href="<?= Url::to(['post/create']) ?>" role="button"
                      class="btn btn-success btn-block btn-post">创建文章<a/></p>
            <?php endif; ?>
        </div>
        <!-- 热门浏览 -->
        <?= HotWidget::widget() ?>
        <!-- 标签云 -->
        <?= TagWidget::widget()?>
    </div>
</div>

