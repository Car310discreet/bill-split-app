const errorHandler = (err, req, res, next) => {
    console.error('Global error handler:', err.message);

    // Customize your response based on error type, status, etc.
    res.status(err.status || 500).json({
        success: false,
        message: err.message || 'Internal Server Error',
    });
};

export default errorHandler;