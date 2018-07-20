module.exports = {
  module: {
    rules: [
      {
        test: /\.imba$/,
        loader: 'imba/loader',
      }
    ]
  },
  resolve: {
    extensions: [".imba",".js", ".json"]
  },
  entry: "./app/client.imba",
  output: {  path: __dirname + '/dist', filename: "client.js" }
}