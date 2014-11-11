appiaries
=========

appiaries ruby client

# About appiaries-client

Appiaries is a mobile backend as a service which helps you develop mobile apps and other web application very easily. This library, appiaries-client, is developed for those who would like to develop ruby application integrated with Appiaries service.

Appiaries-client is now under development, and provide just a couple of object set to access appiaries service. 

# HOW TO USE

## Json Data

```
client = Appiaries::JsonData.new(:application_token => @apptoken, :application_id => APP_ID, :datastore_id => DATASTORE_ID, :collection_id => collection_id)
res = client.get("object_id")
```

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
