# dynamic-datatable-in-LWC
Dynamic datatable in LWC using fieldsets. We can simply pass the fieldset, object names and this component will set up the columns and query the required data from the salesforce org.


Step 1: Create the dynamic datatable lwc component and apex class in your Salesforce org using the attached files
Step 2: Create the fieldset in the object as per your project requirement
        For ex: I've created in Account object
Step 3: Insert the "dynamic datatable lwc component" inside your component (where ever datatable is required)
Step 4: Invoke the @api method "tableMethod" using quertSelector from your parent component JS
        For ex: this.template.querySelector('c-dynamic-datatable').tableMethod('account_for_lwc', 'Account');
        Here,
            c-dynamic-datatable --> represents the dynamic datatable lwc component
            account_for_lwc --> represents the fieldset name
            Account --> represents the object name
