const logger = ((req, res, next) => {
    console.log(`${req.method} ${req.url}`);
    console.log(`req: ${req.body}`);
    return next();
});

export default logger;