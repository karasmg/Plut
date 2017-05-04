<?php

namespace app\controllers;

use Yii;
use app\models\Orders;
use app\models\OrdersSearch;
use app\models\Project;
use app\models\Employee;
use app\components\ParentController;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;

/**
 * OrdersController implements the CRUD actions for Orders model.
 */
class OrdersController extends ParentController
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Orders models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new OrdersSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Orders model.
     * @param string $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Orders model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Orders();

        $items_project = Project::find()
            ->select(['id as value', 'concat(number, " ", name) as label'])
            ->asArray()
            ->all();
        $items_project = ArrayHelper::map($items_project, 'value', 'label');
        asort($items_project);
        reset($items_project);

     //   $items_employee = Employee::find()
         //   ->select(['id as value', 'last_name as label'])
          //  ->asArray()
           // ->all();
        $items_employee = Employee::find()
            ->select(['id as value', 'concat(last_name, " ", first_name, " ", middle_name) as label'])
            ->asArray()
            ->all();
        $items_employee = ArrayHelper::map($items_employee, 'value', 'label');
        asort($items_employee);
        reset($items_employee);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index']);//переводит на страницу index
            //return $this->redirect(['view', 'id' => $model->id]);//переводит на страницу view
        } else {
            return $this->render('create', [
                'model' => $model,
                'items_project' => $items_project,
                'items_employee' => $items_employee,
            ]);
        }
    }

    /**
     * Updates an existing Orders model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        $items_project = Project::find()
            ->select(['id as value', 'concat(number, " ", name) as label'])
            ->asArray()
            ->all();
        $items_project = ArrayHelper::map($items_project, 'value', 'label');
        asort($items_project);
        reset($items_project);

        $items_employee = Employee::find()
            ->select(['id as value', 'concat(last_name, " ", first_name, " ", middle_name) as label'])
            ->asArray()
            ->all();
        $items_employee = ArrayHelper::map($items_employee, 'value', 'label');
        asort($items_employee);
        reset($items_employee);
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index']);//переводит на страницу index
           // return $this->redirect(['view', 'id' => $model->id]);   //переводит на страницу view
        } else {
            return $this->render('update', [
                'model' => $model,
                'items_project' => $items_project,
                'items_employee' => $items_employee,
            ]);
        }
    }

    /**
     * Deletes an existing Orders model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Orders model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return Orders the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Orders::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
