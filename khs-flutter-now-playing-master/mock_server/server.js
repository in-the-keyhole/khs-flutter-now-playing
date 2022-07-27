var express = require('express')
var bodyParser = require('body-parser')
var cors = require('cors')

module.exports = api = express()

api.use(cors())

api.use(bodyParser.json()) // to support JSON-encoded bodies
api.use(
  bodyParser.urlencoded({
    // to support URL-encoded bodies
    extended: true
  })
)

api.namespace = '/api'

var apiModule = require('./endpoint/api')
apiModule.configure(api)

api.listen(3001, function() {
  console.log('API is up and listening on port 3001')
})
