from flask import Flask, request, jsonify
import subprocess
import os
import re

app = Flask(__name__)

@app.route('/generate_gpt', methods=['POST'])
def generate_gpt():
    try:
        data = request.json
        plan1 = data.get('plan', '')
        plan = "n\n" + plan1
        # Specify the path to your AutoGPT Docker Compose file
        docker_compose_path = '/Users/haotianbao/Documents/AutoGPT-0.3.1/docker-compose.yml'
        
        # Build the Docker Compose command
        docker_command = f"docker compose -f {docker_compose_path} run --rm auto-gpt"

        # Run the Docker Compose command and pass the input plan
        process = subprocess.Popen(docker_command.split(), stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        stdout, stderr = process.communicate(input=plan)

        if process.returncode == 0:
            # Successfully generated GPT output
            gpt_output = stdout.strip()
            return jsonify({'result': gpt_output})
        else:
            # Error in generating GPT output
            real_message = f"{stdout.strip()}"
            # Define the patterns to filter out
            garbage_words = [
                re.escape("\u001b[32mNEWS:"),
                re.escape("\u001b[0m"),
                re.escape("\u001b[33m"),
                re.escape("\u001b[0m\n\u001b[32mNEWS:"),
                re.escape("\u001b[32m"),
                re.escape("\u001b[36m"),
                re.escape("\u001b[35m"),
                re.escape("Thinking..."),
                re.escape("\u001b[94m")
            ]

            # Create a regular expression pattern
            pattern = "|".join(garbage_words)
            # Use re.sub to replace the garbage words with an empty string
            filtered_message = re.sub(pattern, "", real_message)
        
       
            return jsonify({'result': filtered_message}), 500

    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
