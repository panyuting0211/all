<?php
/**
 * @Created by PhpStorm.
 * @Desc:
 * @Author: panyuting
 * @Date: 2016/12/2 13:45
 */

namespace backend\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class LoginAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'statics/css/font-awesome-4.4.0/css/font-awesome.min.css',
        'statics/css/layout.css',
    ];
    public $js = [
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
