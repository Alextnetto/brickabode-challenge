# Brick-Abode Challenge

##### Preparing the database

If you dont have Postgres, you can run this command with docker:
```bash
docker run --name db-postgres -p 5432:5432 -e POSTGRES_PASSWORD=test -e POSTGRES_DB=test -e POSTGRES_USER=test -d postgres
```

To populate the database, follow this steps

You can choose the number of rows to populate in the first argument in the python script, as shown below.

1. Run 
```bash
cd ./scripts
pip install -r requirements.txt
python generate_sql.py 1000 # 1000 rows generated
```

2. Run the generated .sql file in the PostgreSQL database 
and voilá


##### Running the application

on ```/MarketData``` run ```dotnet run```

##### Testing the application

If you have Postman, you can play around with the collection. Import ```Brickabode.postman_collection.json``` into Postman.

API will run on https://localhost:5001/