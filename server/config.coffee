Confidence = require ('confidence')

criteria = {
    env: process.env.NODE_ENV
};

Config = {
    $meta: 'This file configures the plot device.',
    projectName: '{{projectName}}',
    port: {
        web: {
            $filter: 'env',
            test: 9001,
            production: 3001,
            $default: 8001
        }
    },
    baseUrl: {
        $filter: 'env',
        $meta: 'values should not end in "/"',
        production: 'url',
        $default: 'http://127.0.0.1:8000'
    },
}
store = new Confidence.Store(Config);

exports.get = (key) -> store.get(key, criteria);
exports.meta = (key) -> store.meta(key, criteria);
