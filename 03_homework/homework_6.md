# Homework 6: Reflecton

- Due on Saturday, May 25 at 11:59pm
- Weight: 8% of total grade

<br>

**Write**: Reflect on your previous work and how you would adjust to include ethics and inequity components. Total length should be a few paragraphs, no more than one page.

I have worked with databases that contain PII data, for example, full name, email and address information.  We used to take backups of production databases and restore it on test and development environments.  Many people on the test and dev teams have access to the test and dev environments.  Looking back we should have some scripts to run right after each restore on the test and dev environments that will obfuscate the PII data right away. 

Although in some cases it may not be that straight forward, if the same PII information exists on multiple data sources, and the information may need to match to join data.  

The other issue to consider is what kind of encryption to use.  It may mean anything tested using these databases will need some modification in the code in order to accomodate for the encrypted value.  That may not be desirable, but can be accomodated.  

It will be a cross-team effort in order to properly do this.  We need to have agreement amongst all teams that are the producer and consumer of the backup databases. Perhaps we need to map out what are other dependencies of each team, as mentioned earlier, when other data sources are joined the obfuscated data may be an issue.   
