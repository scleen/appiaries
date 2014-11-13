appiaries
=========

appiaries ruby client

# TODOs

items to track todos: once done, completed testing, move it to the CLOSED section 

 - JsonDataClient
  - create
  - update
  - updateField
  - delete
  - get
  - find (might be get enhance)
 - FileDataClient
  - create
  - update
  - delete
  - get
  - find (might be get enhance)

# CLOSED

 - JsonDataClient
  - get

 - FileDataClient

# About appiaries-client

Appiaries is a mobile backend as a service which helps you develop mobile apps and other web application very easily. This library, appiaries-client, is developed for those who would like to develop ruby application integrated with Appiaries service.

Appiaries-client is now under development, and provide just a couple of object set to access appiaries service. 

# HOW TO USE

## Json Data

```
client = Appiaries::JsonData.new(:application_token => @apptoken, :application_id => APP_ID, :datastore_id => DATASTORE_ID, :collection_id => collection_id)
res = client.get("object_id")
```

# API COVERAGE STATUS

## JSON DATA

### METHOD

| METHOD | REST API | JsonDataClient | Status |
|:-----------|:-----------:|:------------:|:------------:|
| Insert Json |    create |     create     | OK |
| Replace    |      put |    put    | OK |
| Update Json      |         patch |     patch     | OK |
| Delete Multiple Jsons         |       delete|      delete      | Not Ready |
| Delete Json Field         |          delete|      delete      | Not Ready |
| Delete Single Json      |       delete|    delete    | OK |
| Get      |       get|    get    | OK |
| Query    |     get|   get    | Not Ready |
| Count    |    count |   count    | Not Ready |

### QUERY

http://docs.appiaries.com/v1/api/datastore/conditions

| Operator | Appiaries::Query | Status  |
| -------- |:----------------:|:-----:|
| exist    | exist            | OK |
| eq       | eq               | OK |
| neq      | neq              | OK |
| is       | is               | Testing |
| isn      | isn              | Testing |
| lt       | lt               | Testing |
| lte      | lte              | Testing |
| gt       | gt               | Testing |
| gte      | gte              | Testing |
| sw       | sw               | Testing |
| nsw      | nsw              | Testing |
| in       | in               | Testing |
| wic      | wic              | Not Ready |
| wib      | wib              | Not Ready |
| wip      | wip              | Not Ready |

# LICENSE

Copyright (c) 2014 Scleen

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
