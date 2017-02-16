<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\WorkDays */

$this->title = Yii::t('app', 'Create Work Days');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Work Days'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="work-days-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
