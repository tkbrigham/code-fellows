// Declare easy-to-use variables
var list = document.getElementById("myList");
var button = document.getElementById("button");
var inputContent = document.getElementById("input");

// Some FUNctionality for rapid Todo entry. Allows user to
// press enter when in <input> to trigger the button
inputContent.onkeydown = function () {
    if (event.keyCode == 13) button.click();
}

// If <input> isn't blank, runs main()
button.addEventListener("click", function () {
    if (inputContent.value != "") {
        main()
    };
});

// Primary function, which adds the new <li>, the <li>'s listener, 
// and clears the input box
function main() {
    var newListItem = document.createElement("LI");
    appendNewElement(newListItem);
    addListener(newListItem);
    resetInput();
}

// Takes input value and uses that to attach an <li> with that text to the list
function appendNewElement(element) {
    var input = document.getElementById("input").value;
    var textnode = document.createTextNode(input);
    element.appendChild(textnode);
    list.appendChild(element);
}

// Adds listener for <li> so they get deleted
function addListener(element) {
    element.addEventListener("click", function () {
        removeMyself(element);
    });
}

// Function to remove the element passed in. 
// NOTE: could probably combine with addListener(), but if we
// ever wanted the click of an <li> to do something else, this 
// would make it easier to refactor
function removeMyself(element) {
    element.parentNode.removeChild(element);
}

// More FUNctionality, clearing and focusing <input>
function resetInput() {
    inputContent.value = "";
    inputContent.focus();
}
