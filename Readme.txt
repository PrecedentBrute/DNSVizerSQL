
1. Open the provided MySQL Script and execute it upto just before the test queries.

2. To test the MySQL portions, execute the Test queries one by one and you can see the results as you go. To see it in the Frontend, follow the next steps.

3. Open the backend folder. In the server.js file, modify the details of the MySQL user from line 12 - host, port, user, database and password details as below (otherwise the procedures won't run due to insufficient privileges), save and run the commands 

npm i
node server.js

This starts the server. It is essential that the backend is deployed on port 3000 so we do not change that in the original code.

    Creds:

    host: 'localhost',    
    port: 3306,
    user: 'root',
    password: '<your_password>',
    database: 'viz'

    If such credentials are not present, either modify the user credentials on your MySQL Workbench or create a new user with the same credentials for a smooth functioning of the project. Alternatively, you can use your available credentials but then also update the definer values in all the procedures stored and executed via MySQL.

4. [Optional] Open the frontend folder, and run the following commands from your shell

npm install
npm start

The frontend source code has been shared for reference.

5. The frontend is deployed on 'www.dnsvizer.tech', which you can visit directly from your web browser. Make sure that the backend and the database are running before using anything.

---------------------------------------------------------------------------------------------------------------------------------------------------
In case of any errors or difficulties contact - f20200024@pilani.bits-pilani.ac.in / F20200043@pilani.bits-pilani.ac.in