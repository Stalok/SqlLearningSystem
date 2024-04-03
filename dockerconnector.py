from flask import Flask, request
import docker

app = Flask(__name__)
client = docker.from_env()

@app.before_request
def restrict_remote_addr():
    # 只接受來自本地的請求
    allowed_ip = '127.0.0.1'
    if request.remote_addr != allowed_ip:
        return 'Forbidden', 403


@app.route('/hello', methods=['GET'])
def hello_world():
    return 'Hello, World!'


@app.route('/docker/<port>', methods=['GET'])
def docker(port: int):
    containerId = client.containers.run("mysql:8.0.36-debian", ports={'3306/tcp': port},
                                        environment=["MYSQL_ROOT_PASSWORD=123456"], detach=True).id
    return containerId


@app.route('/docker/<containerId>', methods=['DELETE'])
def delete(containerId: str):
    client.containers.get(containerId).stop()
    client.containers.get(containerId).remove()
    return 'Platform deleted!'


if __name__ == '__main__':
    app.run()
