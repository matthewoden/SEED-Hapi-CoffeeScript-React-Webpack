var path              = require( 'path' );
var webpack           = require( 'webpack' );
var merge             = require( 'webpack-merge' );
var HtmlWebpackPlugin = require( 'html-webpack-plugin' );
var autoprefixer      = require( 'autoprefixer' );
var ExtractTextPlugin = require( 'extract-text-webpack-plugin' );

console.log( 'WEBPACK GO!');

// detemine build env
var TARGET_ENV = process.env.npm_lifecycle_event === 'build' ? 'prod' : 'dev';

// common webpack config
var commonConfig = {

  resolve: {
    modulesDirectories: ['node_modules'],
    extensions:         ['', '.js', '.cjsx', '.coffee']
  },
  output: {
    path: path.resolve( __dirname, 'public/' ),
    publicPath: 'public',
    filename: 'bundle.js',
  },
  module: {
    loaders: [
      {test: /\.woff(2)?(\?v=\d+\.\d+\.\d+)?$/, loader: "url?limit=10000&mimetype=application/font-woff" },
      {test: /\.ttf(\?v=\d+\.\d+\.\d+)?$/, loader: "url?limit=10000&mimetype=application/octet-stream" },
      {test: /\.eot(\?v=\d+\.\d+\.\d+)?$/, loader: "file" },
      {test: /\.svg(\?v=\d+\.\d+\.\d+)?$/, loader: "url?limit=10000&mimetype=image/svg+xml" },
      {
        test: /\.(css|scss)$/,
        loader: ExtractTextPlugin.extract(['css', 'sass'])
      },
      { test: /\.cjsx?$/, loaders: ['coffee','cjsx'] },
      { test: /\.coffee$/, loader: 'coffee' }
    ]
  },

  plugins: [
    new HtmlWebpackPlugin({
      template: 'view.html',
      inject:   'body',
      filename: 'view/index.html'
    }),
    new ExtractTextPlugin( 'app.css' ),

  ],

  postcss: [ autoprefixer( { browsers: ['last 2 versions'] } ) ],

}

// additional webpack settings for local env (when invoked by 'npm start')
if ( TARGET_ENV === 'dev' ) {
  console.log( 'Serving locally...');
  module.exports = merge( commonConfig, {
    entry:  path.join( __dirname, 'public/scripts/startup.cjsx' )
  });
}

// additional webpack settings for prod env (when invoked via 'npm run build')
if ( TARGET_ENV === 'prod' ) {
  console.log( 'Building for prod...');

  module.exports = merge( commonConfig, {

    entry: [path.join( __dirname, 'public/scripts/startup.cjsx' )],

    plugins: [
      new webpack.optimize.OccurenceOrderPlugin(),

      // extract CSS into a separate file
      new ExtractTextPlugin( './[hash].css', { allChunks: true } ),

      // minify & mangle JS/CSS
      new webpack.optimize.UglifyJsPlugin({
          minimize:   true,
          compressor: { warnings: false }
          // mangle:  true
      })
    ]

  });
}
