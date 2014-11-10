Adapter = require '../adapter_base'
W       = require 'when'

class Less extends Adapter
  name: 'less'
  extensions: ['less']
  output: 'css'

  _render: (str, options) ->
    deferred = W.defer()

    @engine.render str, options, (err, res) ->
      if err then return deferred.reject(err)
      deferred.resolve(res.css)

    return deferred.promise

module.exports = Less
