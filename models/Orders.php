<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "orders".
 *
 * @property string $id
 * @property string $number
 * @property string $project_id
 * @property string $name
 * @property string $responsible_id
 * @property string $budget_hours
 * @property string $date_creation
 * @property string $planned_end_date
 * @property string $actual_end_date
 * @property string $status
 */
class Orders extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'orders';
    }
    public function getEmployees(){
        return $this->hasOne(Employee::className(), ['id'=>'responsible_id']);
    }
    /* Геттер для ФИО*/
    public function getFullName() {
        return $this->employees->last_name. ' '. $this->employees->first_name. ' ' . $this->employees->middle_name;
    }
    public function getProjects(){
        return $this->hasOne(Project::className(), ['id'=>'project_id']);
    }
    /* Геттер для номера проекта*/
    public function getProjectNumber() {
        return $this->projects->number;
    }


    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['number', 'project_id', 'name', 'responsible_id', 'budget_hours', 'planned_end_date'], 'required'],
            [['project_id', 'responsible_id', 'budget_hours', 'status'], 'integer'],
            [['planned_end_date', 'actual_end_date'], 'safe'],
            [['number'], 'string', 'max' => 15],
            [['name'], 'string', 'max' => 155],
            [['number'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'number' => Yii::t('app', 'Номер заказа'),
            'project_id' => Yii::t('app', 'Номер проекта'),
            'name' => Yii::t('app', 'Наименование'),
            'responsible_id' => Yii::t('app', 'Ответственный'),
            'budget_hours' => Yii::t('app', 'Бюджет часов'),
            'date_creation' => Yii::t('app', 'Дата создания заказа'),
            'planned_end_date' => Yii::t('app', 'Запланированная дата выполнения'),
            'actual_end_date' => Yii::t('app', 'Фактическая дата выполнения'),
            'status' => Yii::t('app', 'Статус'),
            'fullName' => Yii::t('app', 'ФИО'),
            'projectNumber' => Yii::t('app', 'Номер проекта'),
        ];
    }

    /**
     * @inheritdoc
     * @return OrdersQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new OrdersQuery(get_called_class());
    }
}
