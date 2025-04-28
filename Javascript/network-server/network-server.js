const express = require('express');
const path = require('path');
const net = require('net');
const cors = require('cors');
const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname))); // Serve static files from current directory

// Route to serve your HTML file
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'client-html-network-server.html'));
});

// Test printer connection endpoint
app.post('/api/test-printer', async (req, res) => {
    const { ip, port } = req.body;
    
    if (!ip || !port) {
        return res.status(400).json({ success: false, message: 'IP and port are required' });
    }

    try {
        const isConnected = await testPrinterConnection(ip, port);
        if (isConnected) {
            res.json({ success: true, message: 'Printer is responding' });
        } else {
            res.json({ success: false, message: 'Printer not responding' });
        }
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
});

// Send print job endpoint
app.post('/api/print', async (req, res) => {
    const { ip, port, text } = req.body;
    
    if (!ip || !port || !text) {
        return res.status(400).json({ success: false, message: 'IP, port, and text are required' });
    }

    try {
        await sendToPrinter(ip, port, text);
        res.json({ success: true, message: 'Print job sent successfully' });
    } catch (error) {
        res.status(500).json({ success: false, message: error.message });
    }
});

// Function to test printer connection
function testPrinterConnection(ip, port, timeout = 3000) {
    return new Promise((resolve, reject) => {
        const socket = new net.Socket();
        
        socket.setTimeout(timeout);
        
        socket.on('connect', () => {
            socket.destroy();
            resolve(true);
        });
        
        socket.on('timeout', () => {
            socket.destroy();
            resolve(false);
        });
        
        socket.on('error', (err) => {
            socket.destroy();
            resolve(false);
        });
        
        socket.connect(port, ip);
    });
}

// Function to send text to printer
function sendToPrinter(ip, port, text) {
    return new Promise((resolve, reject) => {
        const socket = new net.Socket();
        
        socket.connect(port, ip, () => {
            // Many printers understand ESC/P, PCL, or plain text
            // This sends the text with some basic ESC/P commands for line feed
            // const printData = Buffer.from(text + '\n\n\n\x1B@', 'ascii');

            // Prepare the print data
            const printData = Buffer.concat([
                // 1. Your original text (with line feeds)
                Buffer.from(text + '\n\n\n', 'ascii'),
                
                // 2. Cutter command (ESC/POS format)
                // Full cut: GS V 0 (or GS V 1 for partial cut)
                Buffer.from('\x1D\x56\x00', 'binary'), // Full cut
                
                // Optional: Add a feed before cutting (some printers need this)
                Buffer.from('\n', 'ascii'),
            ]);
            socket.write(printData, (err) => {
                socket.destroy();
                if (err) reject(err);
                else resolve();
            });
        });
        
        socket.on('error', (err) => {
            socket.destroy();
            reject(err);
        });
        
        socket.setTimeout(5000, () => {
            socket.destroy();
            reject(new Error('Connection timeout'));
        });
    });
}

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
    console.log(`Access the interface at http://localhost:${port}/`);
});