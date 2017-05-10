<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\ProjectCategory */

$this->title = Yii::t('app', 'Обновить {modelClass}: ', [
    'modelClass' => 'категорию',
]) . $model->responsible_for;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Категории по проектам'), 'url' => ['index']];
//$this->params['breadcrumbs'][] = ['label' => $model->responsible_for, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Обновить');
?>
<div class="project-category-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
