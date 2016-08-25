function RealmChange() {
    var element = document.getElementById('realm-changer');
    var sel = element.options[element.selectedIndex];

    if (typeof sel != 'undefined' && sel.value > 0) {
        //need to add the index crap
        if (document.location.pathname.indexOf('/index') == -1) {
            document.location.pathname += '/index/' + sel.value;
        }
        //need to add slash
        else if (document.location.pathname.indexOf('/index/') == -1) {
            document.location.pathname += '/' + sel.value;
        }
        //need to replace the current realm id
        else {
            var pathstr = document.location.pathname;
            document.location.pathname = pathstr.substr(0, pathstr.indexOf('index/') + 6) + sel.value;
        }
    }

    return true;
}

function InstanceChange() {
    var element = document.getElementById('instance-changer');
    var sel = element.options[element.selectedIndex];

    var realmId = document.getElementById('realmId').value;

    if (typeof sel != 'undefined' && sel.value != "" && realmId > 0) {
        //need to add the index crap
        if (document.location.pathname.indexOf('/index') == -1) {
            document.location.pathname += '/index/' + sel.value;
        }
        //need to add slash
        else if (document.location.pathname.indexOf('/index/') == -1) {
            document.location.pathname += '/' + sel.value;
        }
        //need to replace the current realm id
        else {
            var pathstr = document.location.pathname;
            console.log(pathstr.substr(0, pathstr.indexOf('index/') + 6) + realmId + '/' + sel.value);
            document.location.pathname = pathstr.substr(0, pathstr.indexOf('index/') + 6) + realmId + '/' + sel.value;
        }
    }

    return true;
}