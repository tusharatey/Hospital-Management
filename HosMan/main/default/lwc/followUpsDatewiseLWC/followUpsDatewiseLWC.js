import { LightningElement } from 'lwc';
import searchFollow from '@salesforce/apex/FollowUpsDateWise.searchFollow';
export default class FollowUpsDatewiseLWC extends LightningElement {
   

    searchTerm = '';
    FollowUps = [];

    handleSearchTermChange(event) {
        this.searchTerm = event.target.value;
    }

    handleSearchClick() {
        searchFollow({ searchTerm: this.searchTerm })
            .then(result => {
                this.FollowUps = result;
            })
            .catch(error => {
                console.error(error);
            });
    }
}