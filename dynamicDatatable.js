import { api, LightningElement } from 'lwc';
import readFieldSet from '@salesforce/apex/dynamicDatatable.readFieldSet';
import getRecords from '@salesforce/apex/dynamicDatatable.getRecords';


export default class dynamicDatatable extends LightningElement {
    objectName;
    fieldSetName;
    tabledata;
    columns = [];

    @api tableMethod(fieldset, object){
        this.fieldSetName = fieldset;
        this.objectName = object;
        readFieldSet({fieldSetName : this.fieldSetName, ObjectName: this.objectName})
            .then(result => {
                this.columns = result;
                this.getDataForDatatable();
            })
            .catch(error => {
                
            })
    }

    getDataForDatatable(){
        let fieldsList = [];
        this.columns.forEach(element => {
            fieldsList.push(element.fieldName);
        });
        getRecords({fieldsList : fieldsList, objectName: this.objectName})
            .then(result => {
                console.log(result);
                this.tabledata = result;
            })
            .catch(error => {
                
            })
    }
}