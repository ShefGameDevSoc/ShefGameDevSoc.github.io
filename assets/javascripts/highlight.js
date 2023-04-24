window.addEventListener("load", (evt) => {
    var el = null;
    var d = document.getElementsByClassName('entries-list')[0];
    var inserted = false;

        d.childNodes.forEach((element) => {
            if (element.nodeName == 'DATE') {
                if (element.innerText > (new Date().toISOString().slice(0,10))) {
                    el = element;
                    if (!inserted) {
                        insertAfter(document.getElementById('start'), d.childNodes[0]);
                        console.log("inserted")
                        inserted = true;
                    }
                }
            }
        });
        if (el != null) {
            insertAfter(document.getElementById("end"), el.nextSibling.nextSibling);
            el.nextSibling.nextSibling.style = "border-bottom-width: 0";
        }
        else {
            insertAfter(document.getElementById("end"), d.childNodes[0]);
        }
        
        
        
});
function insertAfter(newNode, existingNode) {
    existingNode.parentNode.insertBefore(newNode, existingNode.nextSibling);
}