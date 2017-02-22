<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use yii\widgets\ActiveForm;
/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Work Days');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="work-days-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Create Work Days'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>
<?php Pjax::begin(); ?>    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'date',
           // 'hours',
[

    'attribute' => 'hours',
    'format' => 'raw',
    'value' => function ($model, $index) {
        $res = Html::beginForm(['workdays/index'], 'post', ['data-pjax' => '', 'class' => 'form-inline']);
        $res .= Html::tag('hours', $model->hours);
        $res .= Html::input('text', 'hours', $model->hours, ['class' => 'form-control']);
        $res .= Html::input('hidden', 'id', $model->id, ['class' => 'form-control']);
        $res .= Html::submitButton('Изменить', ['class' => 'btn btn-primary', 'name' => 'hash-button']);
        $res .= Html::endForm();
        return $res;
    },
],
            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
<?php Pjax::end(); ?></div>
