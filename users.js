let searchField = document.querySelector('.search input');
let searchBtn = document.querySelector('.search button');
let usersList = document.querySelector('.users .users-list');
let createGrpBtn = document.querySelector('.create_group');
let modal = document.querySelector('.modal');
let modalClose = document.querySelector('.modal-close');
let modalUserList = document.querySelector('.modal-user-list');
let modalSubmitBtn = document.querySelector('.modal-submit');

let isClickSearchBtn = false;

searchBtn.addEventListener('click', () => {
    if (!isClickSearchBtn) {
        searchField.classList.add('active');
        searchBtn.classList.add('active');
        searchField.focus();
        isClickSearchBtn = true;
    } else {
        searchField.classList.remove('active');
        searchBtn.classList.remove('active');
        searchField.value = "";
        searchField.blur();
        isClickSearchBtn = false;
    }
})

searchField.addEventListener('keyup', (e) => {
    let searchValue = e.target.value;
    let xhr = new XMLHttpRequest();

    if (searchValue != '') {
        searchField.classList.add('active');
    } else {
        searchField.classList.remove('active');
    }

    xhr.open('POST', 'php/search.php', true);

    xhr.onload = () => {
        if (xhr.readyState == XMLHttpRequest.DONE) {
            if (xhr.status == 200) {
                let data = xhr.response;
                usersList.innerHTML = data;
            }
        }
    }

    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

    xhr.send("searchValue=" + searchValue);
})

// Fetch users List
let userListt = setInterval(() => {
    let xhr = new XMLHttpRequest();

    xhr.open('GET', 'php/users.php', true);

    xhr.onload = () => {
        if (xhr.readyState == XMLHttpRequest.DONE) {
            if (xhr.status == 200) {
                let data = xhr.response;
                if (!searchField.classList.contains('active')) {
                    usersList.innerHTML = data;
                }
            }
        }
    }

    xhr.send();
}, 500)

// Notification Permission
if (Notification.permission == "default") {
    Notification.requestPermission();
}

// Get Nofication
let msgId = -1;
setInterval(() => {
    let xhr = new XMLHttpRequest();

    xhr.open('GET', 'php/getUserNotification.php', true);

    xhr.onload = () => {
        if (xhr.readyState == XMLHttpRequest.DONE) {
            if (xhr.status == 200) {
                let data = xhr.response;
                if (data) {
                    data = JSON.parse(data);
                    if (data[0] != msgId) {
                        getNotification(data);
                        console.log(data);
                        msgId = data[0];
                    }
                }
            }
        }
    }
    xhr.send();
}, 500)

// Show Notification
function showNotification(data) {
    data[1] = String(data[1]).length > 25 ? String(data[1]).substring(0, 25) + "..." : data[1];
    let msg = data[1];
    if (data[4] == "img") {
        msg = "Sent an Image";
    }
    else if (data[4] == "voice") {
        msg = "Sent a voice";
    }
    const notification = new Notification(data[2], {
        body: msg,
        icon: "php/images/" + data[3],
    })
}

// Get Notification
function getNotification(data) {
    if (Notification.permission == "granted") {
        showNotification(data);
    } else if (Notification.permission == "default") {
        Notification.requestPermission().then(permission => {
            if (permission == "granted") {
                showNotification(data);
            }
        })
    }
}

// Update Active Status
document.addEventListener('visibilitychange', () => {
    setTimeout(() => {
        let update;
        if (document.visibilityState == 'visible') {
            update = 'Active Now';
        } else {
            update = new Date().toLocaleString();
        }
        let formData = new FormData();
        formData.append('update', update);
        let xhr = new XMLHttpRequest();
        xhr.open('POST', 'php/updateActiveStatus.php', true);
        xhr.onload = () => {
            if (xhr.readyState = XMLHttpRequest.DONE) {
                if (xhr.status == 200) {
                    let data = xhr.response;
                }
            }
        }
        xhr.send(formData);
    }, 50)
})

// Open modal
createGrpBtn.addEventListener('click', (e) => {
    modal.style.display = "block";

    let xhr = new XMLHttpRequest();

    xhr.open('GET', 'php/modalUser.php', true);

    xhr.onload = () => {
        if (xhr.readyState == XMLHttpRequest.DONE) {
            if (xhr.status == 200) {
                let data = xhr.response;
                modalUserList.innerHTML = data;
            }
        }
    }

    xhr.send();
})

// Close modal
modalClose.addEventListener('click', (e) => {
    modal.style.display = "none";
})

// modal submit
modalSubmitBtn.addEventListener('click', () => {
    let modalUserRows = document.querySelectorAll('.user-row input');
    let groupName = document.querySelector('.modal-group-name');
    let errorText = document.querySelector('.modal-content .error-text');
    let formData = new FormData();
    formData.append("groupName", groupName.value);
    let groupId = "";
    let xhr = new XMLHttpRequest();
    xhr.open('POST', 'php/createGroup.php', false);
    xhr.onload = () => {
        if (xhr.readyState = XMLHttpRequest.DONE) {
            if (xhr.status == 200) {
                let data = xhr.response;
                if (data === "fill_group_name") {
                    errorText.style.display = "block";
                    errorText.innerHTML = "Please enter the group name!";
                } else {
                    groupId = data;
                }
            }
        }
    }
    xhr.send(formData);

    let xhr2 = new XMLHttpRequest();

    modalUserRows.forEach((modalUserRow) => {
        if (modalUserRow.checked) {
            xhr2.open('POST', 'php/createGroupMember.php', false);
            xhr2.onload = () => {
                if (xhr2.readyState = XMLHttpRequest.DONE) {
                    if (xhr.status == 200) {
                        let data = xhr2.response;
                    }
                }
            }
            let formData2 = new FormData();
            formData2.append("userId", modalUserRow.getAttribute("id"));
            formData2.append("groupId", groupId);

            xhr2.send(formData2);
        }
    })

    modal.style.display = "none";
})