# setup template
vue init rohitkrai03/vue-starter shell2

# install prerender
yarn add -D prerender-spa-plugin

# require prerender in webpack
# This line should go at the top of build/webpack.production.js, where other 'imports' live in
var PrerenderSpaPlugin = require('prerender-spa-plugin');
