module.exports = {
    beforeEach: function (browser, done) {
        browser.maximizeWindow()
    },

    afterEach: function (browser, done) {
        browser.end()
    }
};
