import requests
import json
from urllib import parse
import re
pid = -1
token = ''
header = {
            "X-Auth-Token": token
        }
def login(username, password):
    url = "https://api.shisanshui.rtxux.xyz/auth/login"
    headers = {
        'content-type': 'application/json'
    }
    data = {
        "username": username,
        "password": password
    }
    respond = requests.post(url, json=data).text
    print(respond)
    res = json.loads(respond)
    status = -1
    status = res['status']
    if status == 0:
        token = res['data']['token']
        print(type(token))
        pid = res['data']['user_id']
        print(token)
        header['X-Auth-Token'] = token
    return status




def register(username, password):
    url = 'https://api.shisanshui.rtxux.xyz/auth/register'
    data = {
        "username": username,
        "password": password
    }
    print(data)
    respond = requests.post(url, json=data).text
    print(respond)
    res = json.loads(respond)
    status = res['status']
    if status == 0:
        if login(username, password) == 0:
            return True
    else:
        return False


def validate(header):
    u = 'https://api.shisanshui.rtxux.xyz/auth/validate'
    header = {
        "X-Auth-Token": token
    }
    response = requests.get(url=u, headers=header).text
    print(response)


def logout(header):
    url = 'https://api.shisanshui.rtxux.xyz/auth/logout'
    data ={}
    respond = requests.post(url, json=data).text
    print(respond)


def open(header):
    url = 'https://api.shisanshui.rtxux.xyz/game/open'
    data = {}
    respond = requests.post(url, headers=header).text
    print(respond)
    res = json.loads(respond)
    return res['data']['id'], res['data']['card']


def getHglist(header, playerid, page):
    url = "https://api.shisanshui.rtxux.xyz/history"
    querystring = {
        "page": page,
        "limit": "4",
        "player_id": playerid
    }
    respones = requests.request('GET', url, headers=header, params=querystring).text
    print(respones)

def getHgmore(header, gameid):
    url = "https://api.shisanshui.rtxux.xyz/history/" + str(gameid)

    response = requests.request("GET", url, headers=header).text
    print(response)

def httprank(header):
    url = "https://api.shisanshui.rtxux.xyz/rank"
    response = requests.get(url, headers=header).text
    #print(response)
    res = json.loads(response)
    return res
if __name__ == '__main__':

    username = 'x'
    password = '123456'


    #register(username, password)
    status = login(username, password)
    httprank(header)
    #validate(header)
    gid, card = open(header)
    page = 1
    #getHglist(header, str(pid), page)
    #getHgmore(header, gid)
    logout(header)
