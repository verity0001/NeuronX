window.onload = hidenav()

let nav = false

function toggleNav() {
    if (nav == false) {
        nav = true
        document.getElementById("smenu").style.display = "inline";
    } else {
        nav = false
        document.getElementById("smenu").style.display = "none";
    }
}

function hidenav() {
    document.getElementById("smenu").style.display = "none";
}