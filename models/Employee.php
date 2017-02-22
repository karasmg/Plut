<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "employee".
 *
 * @property string $id
 * @property string $username
 * @property string $password
 * @property string $first_name
 * @property string $middle_name
 * @property string $last_name
 * @property string $department_id
 * @property string $sector_id
 * @property string $status
 */
class Employee extends \yii\db\ActiveRecord implements \yii\web\IdentityInterface
{

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'employee';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['first_name', 'middle_name', 'last_name', 'department_id', 'sector_id', 'username', 'password'], 'required'],
            [['department_id', 'sector_id', 'status'], 'integer'],
            [['first_name', 'middle_name', 'last_name'], 'string', 'max' => 55],
            [['username'], 'string', 'max' => 30],
            [['username'], 'unique'],
            [['password'], 'string', 'max' => 50],
            [['password'], 'validatePassword'],

        ];
    }
    public function getSectors(){
        return $this->hasOne(Sector::className(), ['id'=>'sector_id']);
    }

    /* Геттер для названия сектора*/
    public function getSectorName() {
        return $this->sectors->sector;
    }

    public function getDepartments(){
        return $this->hasOne(DepartmentStructure::className(), ['id'=>'department_id']);
    }

    /* Геттер для названия департамента*/
    public function getDepartmentName() {
        return $this->departments->structure_category;
    }

    /* Геттер для ФИО*/
    public function getFullName() {
        return $this->last_name. ' '. $this->first_name. ' ' . $this->middle_name;
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'username' => Yii::t('app', 'Логин'),
            'password' => Yii::t('app', 'Пароль'),
            'first_name' => Yii::t('app', 'Имя'),
            'middle_name' => Yii::t('app', 'Отчество'),
            'last_name' => Yii::t('app', 'Фамилия'),
            'department_id' => Yii::t('app', 'Категория по структуре отдела'),
            'departmentName' => Yii::t('app', 'Категория по структуре отдела'),
            'status' => Yii::t('app', 'Статус'),
            'sector_id' => Yii::t('app', 'Сектор'),
            'sectorName' => Yii::t('app', 'Сектор'),
            'fullName' => Yii::t('app', 'ФИО'),
        ];
    }

    /**
     * @inheritdoc
     * @return EmployeeQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new EmployeeQuery(get_called_class());
    }

    /**
     * @inheritdoc
     */
    public static function findIdentity($id)
    {
        $user = self::findOne($id);
        return !is_null($user) ? new static($user) : null;
    }

    /**
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null)
    {
        return null;
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username)
    {
        $user = self::find()->where(['username'=>$username])->one();
        return !is_null($user) ? new static($user) : null;
    }

    /**
     * @inheritdoc
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @inheritdoc
     */
    public function getAuthKey()
    {
        return false;
    }

    /**
     * @inheritdoc
     */
    public function validateAuthKey($authKey)
    {
        return false;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return bool if password provided is valid for current user
     */
    public function validatePassword($password)
    {
        return $this->password === md5(md5($password));
    }


}
