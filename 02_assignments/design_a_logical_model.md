# Assignment 1: Design a Logical Model

## Question 1
Create a logical model for a small bookstore. 📚

At the minimum it should have employee, order, sales, customer, and book entities (tables). Determine sensible column and table design based on what you know about these concepts. Keep it simple, but work out sensible relationships to keep tables reasonably sized. Include a date table. There are several tools online you can use, I'd recommend [_Draw.io_](https://www.drawio.com/) or [_LucidChart_](https://www.lucidchart.com/pages/).

## Question 2
We want to create employee shifts, splitting up the day into morning and evening. Add this to the ERD.

## Question 3
The store wants to keep customer addresses. Propose two architectures for the CUSTOMER_ADDRESS table, one that will retain changes, and another that will overwrite. Which is type 1, which is type 2?

_Hint, search type 1 vs type 2 slowly changing dimensions._

The customer_address table in type1 does not allow more than one entry for each customer_id.  Each row is only uniquely identified by the customer_id column.  Hence when an existing customer address is updated, the existing row has to be updated and the old data is not retained.

On the other hand, the customer_address table in the type2 design has a date_updated column, as well as an is_current column (meant to store a boolean value).  This way, when an existing customer with an existing address needs to update their address, a new row can be inserted into the table, with date_updated as the current time, and is_current value set to true.  At the same time, the old entry needs to have the is_current value updated to false.  That row remains in the table.  The columns that uniquely identify a row in the table would be customer_id and date_updated.

Bonus: Are there privacy implications to this, why or why not?
```
Your answer...
There are privacy implications, because address is PII (Personal Identification Information).  And we are directly associating that with the customer's name.
```

## Question 4
Review the AdventureWorks Schema [here](https://i.stack.imgur.com/LMu4W.gif)

Highlight at least two differences between it and your ERD. Would you change anything in yours?
```
Your answer...
Differences between AdventureWorks Schema and mine:
1. all tables in the AdventureWorks Schema has the ModifiedDate column
2. All tables in the AdventureWorks Schema has an ID column as a primary key
3. Many tables in the AdventureWorks Schema has a unique key to uniquely identify a row in the table.

I would implement the above in my schema.  The ModifiedDate column can clearly identify when a change was made in any of the data.  The ID column as a primary key will facilitate the use of foreign key relationships between tables.  The unique keys will add business logic to the design.  
```

# Criteria

[Assignment Rubric](./assignment_rubric.md)

# Submission Information

🚨 **Please review our [Assignment Submission Guide](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md)** 🚨 for detailed instructions on how to format, branch, and submit your work. Following these guidelines is crucial for your submissions to be evaluated correctly.

### Submission Parameters:
* Submission Due Date: `June 1, 2024`
* The branch name for your repo should be: `model-design`
* What to submit for this assignment:
    * This markdown (design_a_logical_model.md) should be populated.
    * Two Entity-Relationship Diagrams (preferably in a pdf, jpeg, png format).
* What the pull request link should look like for this assignment: `https://github.com/<your_github_username>/sql/pull/<pr_id>`
    * Open a private window in your browser. Copy and paste the link to your pull request into the address bar. Make sure you can see your pull request properly. This helps the technical facilitator and learning support staff review your submission easily.

Checklist:
- [ ] Create a branch called `model-design`.
- [ ] Ensure that the repository is public.
- [ ] Review [the PR description guidelines](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md#guidelines-for-pull-request-descriptions) and adhere to them.
- [ ] Verify that the link is accessible in a private browser window.

If you encounter any difficulties or have questions, please don't hesitate to reach out to our team via our Slack at `#cohort-3-help`. Our Technical Facilitators and Learning Support staff are here to help you navigate any challenges.
