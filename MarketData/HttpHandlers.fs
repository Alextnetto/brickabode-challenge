namespace MarketData

module HttpHandlers =

    open Microsoft.AspNetCore.Http
    open FSharp.Control.Tasks
    open Giraffe
    open MarketData.Models
    open MarketData.Repository


    // let handleGetHello() : HttpHandler =
    //     fun (next : HttpFunc) (ctx : HttpContext) -> 
    //         task { 
    //             let animalTypeFromQuery = ctx.GetQueryStringValue "type"
    //             let animalType =
    //                 match animalTypeFromQuery with
    //                 | Ok t    -> Some t
    //                 | Error _ -> None

    //             Successful.OK animalType next ctx
    //         }

    let handleGetHello (next : HttpFunc) (ctx : HttpContext) =
        // Binds the query string to a Car object
        let query = ctx.BindQueryString<MarketDataQuery>()

        let test = getMarketData(query)
        // Sends the object back to the client
        Successful.OK test next ctx