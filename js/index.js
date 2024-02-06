window.onload = hidenav()
var x = window.matchMedia("(max-width: 700px)")
let nav = false

window.addEventListener("resize", () => {
    console.log(window.innerWidth);
    toggleNav();
});
function toggleNav() {
    if (x.matches) {
        if (nav == false) {
            nav = true
            document.getElementById("smenu").style.display = "inline";
        } else {
            nav = false
            document.getElementById("smenu").style.display = "none";
        }
    }
}

function hidenav() {
    document.getElementById("smenu").style.display = "none";
}