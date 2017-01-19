<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "project".
 *
 * @property string $id
 * @property string $number
 * @property string $name
 * @property string $customer
 * @property string $status
 * @property string $responsible_id
 * @property string $budget_hours
 * @property string $planned_end_date
 * @property string $actual_end_date
 */
class Project extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'project';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['number', 'name', 'customer', 'responsible_id', 'budget_hours', 'planned_end_date'], 'required'],
            [['status', 'responsible_id', 'budget_hours'], 'integer'],
            [['planned_end_date', 'actual_end_date'], 'safe'],
            [['number'], 'string', 'max' => 15],
            [['name', 'customer'], 'string', 'max' => 155],
            [['number'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'number' => 'Number',
            'name' => 'Name',
            'customer' => 'Customer',
            'status' => 'Status',
            'responsible_id' => 'Responsible ID',
            'budget_hours' => 'Budget Hours',
            'planned_end_date' => 'Planned End Date',
            'actual_end_date' => 'Actual End Date',
        ];
    }
}