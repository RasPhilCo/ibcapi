## IceBucketChallenge API

This Rails API stores data on IceBucketChallenge videos from YT.

### Endpoints, V1

All calls are namespaced with 'api' and the api version, ex: "http://example.com/api/v1".

#####Videos

`
GET /videos
`    

Optional parameters:  
`page` - Results page count, default value: 1  
`per_page` - Results per page count, default value: 30  
`query` - Search term


#####Video  
`
GET /video/:id
`

`
POST /video/:id
`

Required parameter:  
`vote` - Either "up" to incrase or "down" to decrese, ex: vote=up