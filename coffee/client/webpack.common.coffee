
WebpackBar=require "webpackbar"
UglifyJsPlugin=require "uglifyjs-webpack-plugin"
HtmlWebpackPlugin = require "html-webpack-plugin"
CopyPlugin = require "copy-webpack-plugin"
LodashModuleReplacementPlugin = require 'lodash-webpack-plugin'
module.exports=
	stats:"detailed"
	performance:
		hints: false
	entry: './js/index.js'
	output:
		path: "#{__dirname}/dist"
		filename: '[name].bundle.js'
	performance:
		maxEntrypointSize: 1.5e6
		maxAssetSize: 1.5e6
	devtool: 'inline-source-map'
	module:
		rules: [
			{
				loader: "worker-loader"
				test: /\.worker\.js$/
				options:
					filename: "[contenthash].js"
			}
		]
	plugins:[
		new HtmlWebpackPlugin({
			filename: "index.html"
			template: "./static/html/index.html"
			inject: "head"
		})
		new LodashModuleReplacementPlugin()
		new WebpackBar()
		new CopyPlugin({
			patterns: [
				{ from: "static/assets", to: "assets" }
				{ from: "static/css", to: "css" }
			]
		})
	]