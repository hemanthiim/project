import { LightningElement, track } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getEsignRequestRecords from '@salesforce/apex/EsignRequestsController.getEsignRequestRecords';
import updateEsignRecord from '@salesforce/apex/EsignRequestsController.updateEsignRecord';
import signed from '@salesforce/resourceUrl/Signed';
import notSigned from '@salesforce/resourceUrl/NotSigned';

export default class ESignRequestsLWC extends NavigationMixin(LightningElement) {
    @track eSignRecords = [];
    sign = signed;
    notSign = notSigned;

    connectedCallback() {
        getEsignRequestRecords()
            .then(result => {
                console.log('recs+++++'+JSON.stringify(result));
                if (result) {
                    result.forEach(function(rec){
                            rec["signed"] = rec.Signing_Status__c == 'Signed' ? true : false
                            //rec["icon"] = rec.Signing_Status__c == 'Signed' ? 'utility:check' : 'utility:info_alt'
                            //rec["cls"] = rec.Signing_Status__c == 'Signed' ? "select" : ""
                           
                    });
                    this.eSignRecords = result;
                    console.log('inside recs+++++'+JSON.stringify(this.eSignRecords));
                }
                this.addPagination();
            })
            .catch(error => {

            })
    }

    @track noOfRecord = 5;
    @track paginationRange = [];
    @track startingRecord = 1;
    @track endingRecord = 0;
    @track page = 1;
    @track totalPage = 0;
    @track totalRecountCount = 0;
    @track eSignRecordItems = [];
    
    addPagination() {
        console.log('this.noOfRecord ++ '+this.noOfRecord);
        if (this.eSignRecords.length < this.noOfRecord) {
            console.log('inside 1st IF ++ ');
            this.eSignRecordItems = this.eSignRecords;
            this.paginationRange = [];
            this.page = 1;
            this.totalRecountCount = this.eSignRecords.length;
        }
        if (this.eSignRecords.length >= this.noOfRecord) {
            console.log('inside 2nd IF ++ ');
            this.totalRecountCount = this.eSignRecords.length; //here it is 23
            this.totalPage = Math.ceil(this.totalRecountCount / this.noOfRecord); //here it is 5
            this.paginationRange = [];
            for (let i = 1; i <= this.totalPage; i++) {
                this.paginationRange.push(i);
            }
            if (this.page > this.totalPage) {
                this.page = this.totalPage;
            }
            this.endingRecord = this.noOfRecord;
            this.startingRecord = ((this.page - 1) * this.noOfRecord);
            this.endingRecord = (this.noOfRecord * this.page);

            this.endingRecord = (this.endingRecord > this.totalRecountCount)
                ? this.totalRecountCount : this.endingRecord;

            this.eSignRecordItems = this.eSignRecords.slice(this.startingRecord, this.endingRecord);
            this.startingRecord = this.startingRecord + 1;
        }

    }

    handlePaginationClick(event) {
        this.page = event.target.dataset.targetNumber;;
        /*let's say for 2nd page, it will be => "Displaying 6 to 10 of 23 records. Page 2 of 5"
        page = 2; pageSize = 5; startingRecord = 5, endingRecord = 10
        so, slice(5,10) will give 5th to 9th records.
        */
        this.startingRecord = ((this.page - 1) * this.noOfRecord);
        this.endingRecord = (this.noOfRecord * this.page);

        this.endingRecord = (this.endingRecord > this.totalRecountCount)
            ? this.totalRecountCount : this.endingRecord;

        this.eSignRecordItems = this.eSignRecords.slice(this.startingRecord, this.endingRecord);

        //increment by 1 to display the startingRecord count, 
        //so for 2nd page, it will show "Displaying 6 to 10 of 23 records. Page 2 of 5"
        this.startingRecord = this.startingRecord + 1;

    }

    handleSign(event){
        let index = event.currentTarget.dataset.name;
        index = parseInt(index);
        alert(index);
        if(!this.eSignRecords[(((this.page - 1) * this.noOfRecord)) + index].signed){
            alert(this.eSignRecords[(((this.page - 1) * this.noOfRecord)) + index].Id);
            updateEsignRecord({recId : this.eSignRecords[(((this.page - 1) * this.noOfRecord)) + index].Id})
            .then(result => {

            })
            .catch(error => {

            })
            this.eSignRecords[(((this.page - 1) * this.noOfRecord)) + index].signed = true;
        }
        else{
        }
    }

    navigateToYoti(event){
        const config = {
            type: 'standard__webPage',
            attributes: {
                url: 'http://www.yoti.com/'
            }
        };
        this[NavigationMixin.Navigate](config);
    }

}