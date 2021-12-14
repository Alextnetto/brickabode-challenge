namespace MarketData


module Repository =
    open Npgsql.FSharp
    open MarketData.Models

    let connectionString : string =
        Sql.host "localhost"
        |> Sql.database "test"
        |> Sql.username "test"
        |> Sql.password "test"
        |> Sql.port 5432
        |> Sql.formatConnectionString

    let getMarketData (query: MarketDataQuery) : MarketDataResponse list =

        // let maxQuantityFilter =
        //     if query.maxQuantity = 0
        //     then  ""
        //     else  "AND quantity <= %d" query.maxQuantity  

        let queryString = sprintf "SELECT * FROM data 
            WHERE pair = '%s'
            AND provider = '%s'
            AND quantity >= %d
            AND price >= %d;" query.pair query.provider query.minQuantity query.minPrice

        connectionString
        |> Sql.connect
        |> Sql.query queryString
        // |> Sql.parameters [ "provider", Sql.string query.provider ]
        // |> Sql.parameters [ "pair", Sql.string query.pair ]
        |> Sql.execute (fun read ->
            {
                //date = read.int "date"
                pair = read.text "pair"
                provider = read.text "provider"
                //price = read.float "price"
                // Raises error: Type constraint mismatch. The type 'float32' is not compatible with type 'float'
                quantity = read.int "quantity"
            })
 