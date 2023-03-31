window.addEventListener("load", (evt) => {
    var el = null;
    var d = document.getElementsByClassName('entries-list')[0];
    insertAfter(document.getElementById('start'), d.childNodes[0]);
        d.childNodes.forEach((element) => {

            if (element.nodeName == 'DATE') {
                //alert(element.innerText + " " + (new Date().toISOString().slice(0,10)));
                if (element.innerText > (new Date().toISOString().slice(0,10))) {
                    //alert('valid');
                    el = element;
                }
            }
        });
        insertAfter(document.getElementById("end"), el.nextSibling.nextSibling);
        el.nextSibling.nextSibling.style = "border-bottom-width: 0";
        
});
function insertAfter(newNode, existingNode) {
    existingNode.parentNode.insertBefore(newNode, existingNode.nextSibling);
}