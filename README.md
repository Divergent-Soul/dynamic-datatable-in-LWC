# dynamic-datatable-in-LWC
Dynamic datatable in LWC using fieldsets. We can simply pass the fieldset, object names and this component will set up the columns and query the required data from the salesforce org.




Step 1: Create the fieldset in your org object. For ex: I've created fieldset in account object in the name of "account_for_lwc".
Step 2: Use these files to create a dynamic datatable component and apex class in your org.
Step 3: Place this component inside any component where you need this data table.
Step 4: Pass the fieldset name and object name to the @api method "tableMethod" in your component using querySelector
        For ex: this.template.querySelector('c-dynamic-datatable').tableMethod('account_for_lwc', 'Account');
        Here,
        "c-dynamic-datatable" --> represents the dynamic datatable lwc component
        "account_for_lwc" --> represents the fieldset name
        "Account" --> represents the object name
