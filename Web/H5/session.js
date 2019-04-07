function saveSessionStorage(id) {
    var target = document.getElementById(id);
    var str = target.value;
    sessionStorage.setItem("message", str)
}

function loadSessionStorage(id) {
    var target = document.getElementById(id);
    var str = sessionStorage.getItem("message");
    target.innerHTML = str;
}

function saveLocalStorage(id) {
    var result = document.getElementById(id).value;
    var time = new Date().getTime()
    localStorage.setItem(time, result)
    loadLocalStorage("msg1")
}

function loadLocalStorage(id) {
    var result = "<table border = '1'>"
    for (var i = 0; i < localStorage.length; i++) {
        var key = localStorage.key(i)
        var value = localStorage.getItem(key);
        var date = new Date()
        date.setTime(key);
        result +="<tr><td>" + value + "</td><td>" + date + "</td></tr>"
    }
    result += "</table>"
    var target = document.getElementById(id);
    target.innerHTML = result
}

function clearStorage() {
    localStorage.clear()
    loadLocalStorage("msg1")
}

function saveUserInfo() {
    var data = new Object()
    data.name = document.getElementById("name").value;
    data.email = document.getElementById("email").value;
    data.tel = document.getElementById("tel").value;
    data.memo = document.getElementById("memo1").value;
    var str = JSON.stringify(data);
    localStorage.setItem(data.name, str)
}

function loadUserInfo(id) {
    var find = document.getElementById("find").value;
    var str = localStorage.getItem(find);
    var data = JSON.parse(str)
    var result = "姓名：" + data.name + "<br>";
    result += "Email：" + data.email + "<br>";
    result += "电话：" + data.tel + "<br>";
    result += "备注：" + data.memo + "<br>";
    document.getElementById(id).innerHTML = result
}