<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AI Study Helper</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
        }
        #chatbox {
            width: 80%;
            height: 300px;
            border: 1px solid #ccc;
            overflow-y: scroll;
            margin: auto;
            padding: 10px;
        }
        input {
            width: 70%;
            padding: 10px;
        }
        button {
            padding: 10px;
        }
    </style>
</head>
<body>
    <h1>Welcome to AI Study Helper</h1>
    <p>Ask me anything related to studies!</p>
    <div id="chatbox"></div>
    <input type="text" id="userInput" placeholder="Type your question...">
    <button onclick="getResponse()">Ask AI</button>

    <script>
        async function getResponse() {
            let userText = document.getElementById('userInput').value;
            let chatbox = document.getElementById('chatbox');
            
            chatbox.innerHTML += `<p><strong>You:</strong> ${userText}</p>`;
            document.getElementById('userInput').value = '';
            
            let response = await fetch(`https://api.openai.com/v1/completions`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': 'Bearer YOUR_OPENAI_API_KEY'
                },
                body: JSON.stringify({
                    model: "text-davinci-003",
                    prompt: userText,
                    max_tokens: 50
                })
            });
            
            let data = await response.json();
            chatbox.innerHTML += `<p><strong>AI:</strong> ${data.choices[0].text}</p>`;
        }
    </script>
</body>
</html>
