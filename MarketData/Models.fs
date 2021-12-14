namespace MarketData.Models
open System

[<CLIMutable>]
type MarketDataQuery =
    {
        provider : string
        pair : string
        // provider : list<string>
        // pair : list<string>
        minPrice : int
        maxPrice : int
        minQuantity : int
        maxQuantity : int
        startDate : string
        endDate : string
    }

type MarketDataResponse =
    {
        //date : float
        pair : string
        provider : string
        //price : float
        quantity : int
    }
