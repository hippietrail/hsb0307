(function(){
    jDbank.ui.tableOld = function(tableId) {
        this._tableId = tableId;
        this._tableObj = document.getElementById(tableId);
        this._lastSelectedFile = null;
        this._eventObj = {};            //event object for event bind
        this._eventMap = {};            //event map
        this._alterType = 0;
        this._currentItem = null;
        this._currentItemP = null;
        this._oldItemName = '';
        this._selectedItems = {};
        
        this._dCheckboxs = this._tableObj.getElementsByTagName('input');
        this._dSelectAll = this._dCheckboxs[0];
        this._dTrs = null;
        this.alterDivId = 'dbtreealter';
        this.focusIndex = -1;    //focused status
    };

    var jut = jDbank.ui.tableOld;
    //--value set and get--
    jut.prototype.setFocusIndex = function(value) {
        this.focusIndex = value;
    };

    //--get event handler--
    jut.prototype.getEventHandler = function(eventObj) {
        return this._eventMap[eventObj.type] ? this._eventMap[eventObj.type] : function(eventObj){return true;};
    }

    //--get handler arguments--
    jut.prototype.getHandlerArguments = function(eventObj) {
        var arr = new Array(eventObj);
        return this._eventMap[eventObj.type + '_arguments'] ? arr.concat(this._eventMap[eventObj.type + '_arguments']) : arr;
    }

    //--bind event handler--
    jut.prototype.bind = function(type, func) {
        if (typeof(func) != 'function') {return 'not a function';}
        this._eventMap[type] = func;
        this._eventMap[type + '_arguments'] = Array.prototype.slice.call(arguments,2);
    };

    //change img src of item who is selected
    jut.prototype.changeImgSrc = function(dTr, ifBig){
        var dImgs,dImg,dDiv,dP;
        if (dTr && dTr.tagName.toLowerCase() == 'tr') {
            dImgs = dTr.getElementsByTagName('img');
            dImg = dImgs[0];
            if (dImg.className == 'linkarr') {
                dImg = dImgs[1];
            }
            dDiv = dTr.getElementsByTagName('div')[0];
            dP = dDiv.getElementsByTagName('p')[1];
            if (ifBig) {
                dImg.src = dTr.getAttribute('bigpic');
                dP.style.display = 'block';
                jDbank(dTr).addClass('one');
            }else {
                dImg.src = dTr.getAttribute('smallpic');
                dP.style.display = 'none';
                jDbank(dTr).removeClass('one');
            }
        }
    };

    //select all files
    jut.prototype.selectAllItem = function(ifCheck, module) {
        var dInputs,i,iLen,oTr;
        if (typeof(ifCheck) == 'undefined')
        {
            var ifCheck = true;
        }
        if (!this._dCheckboxs && module) {
            dInputs = module.getElementsByTagName('input');
            this._dCheckboxs = dInputs;
        }
        dInputs = this._dCheckboxs;
        iLen = dInputs.length;
        for (i=0;i<iLen;i++) {
            if (dInputs[i] && dInputs[i].getAttribute('type') == 'checkbox' && dInputs[i].parentNode.tagName.toLowerCase() == 'td') {
                if (!ifCheck) {
                    oTr = jDbank(dInputs[i].parentNode.parentNode);
                    
                    //remove it from selected items
                    if (this._selectedItems[oTr[0].getAttribute('dtid')] && oTr.hasClass('selected')) {
                        //unselect
                        dInputs[i].checked = false;
                        oTr.removeClass('selected');
                        
                        //change img src
                        this.changeImgSrc(oTr[0], false);
                        
                        delete this._selectedItems[oTr[0].getAttribute('dtid')];
                    }
                }else {
                    dInputs[i].checked = true;
                    oTr = jDbank(dInputs[i]).parents('tr');
                    oTr.addClass('selected');
                    oTr.removeClass('on');
                    
                    if (this._selectedItems[oTr[0].getAttribute('dtid')] && oTr.hasClass('selected')) {
                        //change img src
                        this.changeImgSrc(oTr[0], false);
                    }else {                    
                        //put it in selected items
                        this._selectedItems[oTr[0].rowIndex] = oTr[0];
                        oTr[0].setAttribute('dtid', oTr[0].rowIndex);
                    }
                }
            }
        }
    };

    //get selected files
    jut.prototype.getSelectedItems = function() {
        var dSelectedItems = new Array();
        
        for (var key in this._selectedItems) {
            dSelectedItems[dSelectedItems.length] = this._selectedItems[key];
        }
        
        return dSelectedItems;
    };

    //set a file selected
    jut.prototype.setItemSelected = function(oTar, ifMulti) {
        var oTr,i=0,dTrs,arrTemp = new Array();
        oTar = jDbank(oTar);
        
        if (!ifMulti) {
            //reset last selected file
            if (this._lastSelectedFile) {
                this.selectAllItem(false);
                this.setSelectAllCheck(false);
            }
        }
        
        var iStart = 0,iEnd = 0;
        if (oTar[0].tagName.toLowerCase() != 'tr') {
            oTr = oTar.parents('tr');
        }else if (oTar[0].tagName.toLowerCase() == 'tr') {
            oTr = oTar;
        }
            
        //change style
        if(ifMulti == 'shift') {
            if (!this._lastSelectedFile) {
                this._lastSelectedFile = oTr;
            }
            if (!this._dTrs) {  //cache them
                dTrs = oTr.parent()[0].getElementsByTagName('tr');
                this._dTrs = dTrs;
            }
            
            dTrs = this._dTrs;
            iEnd = dTrs.length;
            iStart = iEnd;
            for (i=0;i<dTrs.length;i++) {
                if (this._lastSelectedFile[0] == dTrs[i]) {
                    iStart = i;
                }
                
                if (oTr[0] == dTrs[i]) {
                    iEnd = i;
                }
                
                if ((i>=iStart && i<=iEnd) || (i>=iEnd && i<=iStart)) {
                    jDbank(dTrs[i]).addClass('selected');
                    jDbank(dTrs[i]).removeClass('on');
                    jDbank(dTrs[i]).children('td.checkboxs').children('input[type=checkbox]')[0].checked = true;
                    
                    //put it into selectedItems
                    this._selectedItems[dTrs[i].rowIndex] = dTrs[i];
                    dTrs[i].setAttribute('dtid',dTrs[i].rowIndex);
                    
                    //change back small img if the first ctrl click
                    this.changeImgSrc(dTrs[i], false);
                }
            }
        }else if (ifMulti == 'ctrl') {
            oTr.addClass('selected');
            oTr.removeClass('on');
            oTr.children('td.checkboxs').children('input[type=checkbox]')[0].checked = true;
            
            //put it into selectedItems
            this._selectedItems[oTr[0].rowIndex] = oTr[0];
            oTr[i].setAttribute('dtid',oTr[i].rowIndex);
            
            //change back small img if the first ctrl click
            arrTemp = this.getSelectedItems();
            if (arrTemp.length == 2) {
                this.changeImgSrc(arrTemp[0], false);
                this.changeImgSrc(arrTemp[1], false);
            }else if (arrTemp.length == 1) {
                this.changeImgSrc(arrTemp[0], true);
            }
        }else { //just click one
            //check if all is selected
            if (this.getSelectedItems().length > 1) {
                this.selectAllItem(false);
                this.setSelectAllCheck(false);
            }
            
            oTr.addClass('selected');
            oTr.removeClass('on');
            oTr.children('td.checkboxs').children('input[type=checkbox]')[0].checked = true;
            
            //put it into selectedItems
            this._selectedItems[oTr[0].rowIndex] = oTr[0];
            oTr[0].setAttribute('dtid',oTr[0].rowIndex);
            
            //change img src
            this.changeImgSrc(oTr[0], true);
        }
        
        //check if all are selected
        if (this.getSelectedItems().length == this._dCheckboxs.length - 1) {
            this.setSelectAllCheck(true);
        }
        
        //record last selected
        this._lastSelectedFile = oTr;
    };

    //select item
    jut.prototype.selectItem = function(item) {
        if (item && item.tagName.toLowerCase() == 'tr') {
            this.setItemSelected(item);
        }
    };

    //unselect item
    jut.prototype.unSelectItem = function(item) {
        if (item && item.tagName.toLowerCase() == 'tr') {
            jDbank(item).removeClass('selected');
            this.setSelectAllCheck(false);
            
            //remove it from selected items
            delete this._selectedItems[item.getAttribute('dtid')];
            
            //change img src
            this.changeImgSrc(item, false);
        }
    };
    
    //remove item
    jut.prototype.removeItem = function(item) {
        this.unSelectItem(item);
        if (item.tagName.toLowerCase() == 'tr') {
            item.parentNode.removeChild(item);
        }
    };

    //set select all checkbox selected or unselected
    jut.prototype.setSelectAllCheck = function(ifCheck) {
        if (!this._dSelectAll) {
            this._tableObj = document.getElementById(this._tableId);
            this._dCheckboxs = this._tableObj.getElementsByTagName('input');
            this._dSelectAll = this._dCheckboxs[0];
        }
        if (ifCheck) {
            this._dSelectAll.checked = true;
        }else {
            this._dSelectAll.checked = false;
        }
    };

    /* tr mouse over */
    jut.prototype.trMouseOn = function(module){
        var dTds;
        
        dTds = module.getElementsByTagName('td');
        jDbank(dTds).bind('mouseenter',function(event){
            jDbank(this.parentNode).addClass('on');
        });
        
        jDbank(dTds).bind('mouseleave',function(event){
            jDbank(this.parentNode).removeClass('on');
        });
    };

    /* td mouse over */
    jut.prototype.thMouseOn = function(module){
        var dThs;
        dThs = module.getElementsByTagName('th');
        jDbank(dThs).bind('mouseenter',function(event){
            jDbank(this).addClass('on');
        });
        
        jDbank(dThs).bind('mouseleave',function(event){
            jDbank(this).removeClass('on');
        });
    };

    //--rename alter start{{--
    //--show some float div in a position--
    jut.prototype.showFloatObj = function(obj, left, top) {
        if (!obj) {return 'no dom object.';}
        if (obj) {
            obj = jDbank(obj)[0];
            obj.style.left = parseInt(left).toString().replace(/\D/ig,'') + 'px';
            obj.style.top = parseInt(top).toString().replace(/\D/ig,'') + 'px';
            if (obj.style.display != 'block') {
                obj.style.display = 'block';
            }
        }
    };

    //--set input or textarea select all--
    jut.prototype.setInputTextSelected = function(obj) {
        if (!obj) {return 'your first argument input or textaret dom object is not exist.';}
        obj = jDbank(obj)[0];
        jDbank(obj).addClass('dtfile');
        if (obj.tagName.toLowerCase() != 'input' && obj.tagName.toLowerCase() != 'textarea') {
            return 'need a text input object or textarea object.';
        }
        
        try {
            obj.focus();
            obj.select();
        }catch(e){}
    };

    jut.prototype.setAlterText = function(txt) {
        if (document.getElementById(this.alterDivId + 'input')) {
            document.getElementById(this.alterDivId + 'input').value = txt;
        }
    };

    jut.prototype.getAlterText = function() {
        if (document.getElementById(this.alterDivId + 'input')) {
            return document.getElementById(this.alterDivId + 'input').value;
        }
    };

    jut.prototype.showAlterInput = function(left,top) {
        var dDiv = document.getElementById(this.alterDivId);
        var self = this;
        self.showFloatObj(dDiv,left,top);
        self.setInputTextSelected(dDiv.getElementsByTagName('input')[0]);
    };

    jut.prototype.hideAlterInput = function(obj) {
        //hide it
        if (obj) {
            obj = jDbank(obj)[0];
            obj.style.top = '-9999px';
        }else if (document.getElementById(this.alterDivId)) {
            document.getElementById(this.alterDivId).style.top = '-9999px';
        }
    };
    //--rename alter end}}--

    //file select events
    jut.prototype.fileSelectInit = function(module, This) {
        var self = This || this;
        var dTar,oTr,oTar;
        var oTemp, oPos;
        var oModule = jDbank(module);

        var dAlterDiv = document.getElementById(self.alterDivId);
        var dAlterInput = dAlterDiv.getElementsByTagName('input')[0];
        var fun = null;

        module.onselectstart = function(){  //disable text select
            return false;
        };
        
        oModule.bind('click',function(e){
            dTar = e.target;
            oTar = jDbank(dTar);
            
            //set current focus is file list
            window.currentFocusedDom = self.focusIndex;
            
            if ( (dTar.tagName.toLowerCase() == 'td' && dTar.className != 'checkboxs')
                || dTar.tagName.toLowerCase() == 'img'
                || (dTar.tagName.toLowerCase() == 'p' && oTar.hasClass('filetxt'))
                || (dTar.tagName.toLowerCase() == 'p' && oTar.hasClass('operations'))
            ) {
                if (oTar[0].tagName.toLowerCase() != 'tr') {
                    oTar = oTar.parents('tr');
                }
            
                //before focused
                self._eventObj = {};        //clear it
                self._eventObj.type = 'beforeFocusItem';
                self._eventObj.oldFocusItem = self._lastSelectedFile ? self._lastSelectedFile[0] : null;
                self._eventObj.newFocusItem = oTar[0];
                fun = self.getEventHandler(self._eventObj);
                if (!fun.apply(self, self.getHandlerArguments(self._eventObj))) {
                    return false;
                }
            
                if (!e.ctrlKey && !e.shiftKey) {
                    self.setItemSelected(oTar);
                }else if (e.ctrlKey) {
                    self.setItemSelected(oTar, 'ctrl');
                }else if (e.shiftKey) {
                    self.setItemSelected(oTar, 'shift');
                }
                
                //after focused
                self._eventObj.type = 'afterFocusItem';
                fun = self.getEventHandler(self._eventObj);
                if (!fun.apply(self, self.getHandlerArguments(self._eventObj))) {
                    return false;
                }
            }else if (dTar.tagName.toLowerCase() == 'input' && dTar.getAttribute('type') == 'checkbox' && dTar.parentNode.tagName.toLowerCase() == 'td') {
                if (oTar[0].tagName.toLowerCase() != 'tr') {
                    oTar = oTar.parents('tr');
                }
                
                if (dTar.checked) {
                    //before focused
                    self._eventObj = {};        //clear it
                    self._eventObj.type = 'beforeFocusItem';
                    self._eventObj.oldFocusItem = self._lastSelectedFile ? self._lastSelectedFile[0] : null;
                    self._eventObj.newFocusItem = oTar[0];
                    fun = self.getEventHandler(self._eventObj);
                    if (!fun.apply(self, self.getHandlerArguments(self._eventObj))) {
                        return false;
                    }
                    
                    if (!e.ctrlKey && !e.shiftKey) {
                        self.setItemSelected(oTar, 'ctrl');
                    }else if(e.ctrlKey) {
                        self.setItemSelected(oTar, 'ctrl');
                    }else if(e.shiftKey) {
                        self.setItemSelected(oTar, 'shift');
                    }
                    
                    //after focused
                    self._eventObj.type = 'afterFocusItem';
                    fun = self.getEventHandler(self._eventObj);
                    if (!fun.apply(self, self.getHandlerArguments(self._eventObj))) {
                        return false;
                    }
                }else { //if unselect a file
                    oTr = jDbank(dTar.parentNode.parentNode);
                    oTr.removeClass('selected');
                    self.setSelectAllCheck(false);
                    
                    //remove it from selected items
                    delete self._selectedItems[oTr[0].getAttribute('dtid')];
                    
                    //change img src
                    arrTemp = self.getSelectedItems();
                    if (arrTemp.length == 0) {
                        self.changeImgSrc(oTr[0], false);
                    }
                }
            }else if (dTar.tagName.toLowerCase() == 'a' && dTar.className == 'renameit') {
                oTemp = jDbank(dTar).parent().prev();
                self._alterType = 1;    //rename
                //oPos = jDbank.util.getPosition(oTemp[0]);
                oPos = oTemp.position();
                //add diffs
                oPos.left += document.all ? parseInt(document.getElementById('dbkdiskcontainer').currentStyle['borderLeftWidth'].replace('px','')) : (jDbank('#dbkdiskcontainer').position().left);
                oPos.top += document.all ? (parseInt(document.getElementById('dbkdiskcontainer').currentStyle['borderTopWidth'].replace('px',''))-4) : (jDbank('#dbkdiskcontainer').position().top-2);
                
                self._currentItem = oTemp.parents('tr')[0];
                self._currentItemP = oTemp[0];
                self._oldItemName = self._currentItemP.innerHTML;
                //show alter input
                self.setAlterText(self._oldItemName);
                
                //--interface for do something before rename--
                self._eventObj = {};        //clear it
                self._eventObj.type = 'beforeRenameItem';
                self._eventObj.currentItem = self._currentItem;
                self._eventObj.oldName = self._oldItemName;
                fun = self.getEventHandler(self._eventObj);
                if (!fun.apply(self, self.getHandlerArguments(self._eventObj))) {
                    return false;
                }
                //-----interface end---
                
                //clear innerhtml and show alter
                self._currentItemP.style.visibility = 'hidden';
                self.showAlterInput(oPos.left, oPos.top);
                
                //stop event
                e.preventDefault();
            }
        });
    };

    //--rename folder--
    jut.prototype.renameItem = function(item, newName) {
        var dAlterDiv = document.getElementById(this.alterDivId);
        var itemP, fun = null;
        if (!item && !newName) {
            var item = this._currentItem ? this._currentItem : null;
            var newName = this.getAlterText();
            itemP = this._currentItemP ? this._currentItemP : null;
        }else {
            itemP = jDbank(item).children('td.filename').children('div.file').children('p.filetxt')[0];
        }
        
        if (dAlterDiv) {
            //rename or create it
            if (parseInt(dAlterDiv.style.top.replace(/px/ig,'')) >= 0) {
                if(this._alterType == 1) {
                    //--interface for do something else here--
                    this._eventObj.type = 'afterRenameItem';
                    this._eventObj.currentItem = item;
                    this._eventObj.newName = newName;
                    this._eventObj.oldName = itemP ? itemP.innerHTML : null;
                    fun = this.getEventHandler(this._eventObj);
                    if (!fun.apply(this, this.getHandlerArguments(this._eventObj))) {
                        return false;
                    }
                }
                
                if (this._alterType > 0) {
                    if (itemP) {
                        itemP.innerHTML = newName;
                        itemP.style.visibility = '';
                    }

                    //hide it
                    this.hideAlterInput(dAlterDiv);
                }
            }
            
            jDbank(dAlterDiv.getElementsByTagName('input')[0]).removeClass('dtfile');
            this._alterType = 0;      //reset alter status
        }
    };

    /* fill scroll bar of y */
    jut.prototype.widthAdapt = function(module, bBind) {
        if (typeof(bBind) == 'undefined') {
            var bBind = true;
        }
        
        //check scrollbar and fit the width
        var dDivs = module.childNodes;
        var arr = new Array();
        var dDivhd = null, dDivbd = null, timer;
        var i = 0;
        for (i=0;i<dDivs.length;i++) {
            if (dDivs[i].nodeType == 1) {
                arr[arr.length] = dDivs[i];
            }
        }
        
        //get divs
        if (arr[0] && arr[0].className.indexOf('mhead') > -1) {
            dDivhd = arr[0];
        }
        
        if (arr[1] && arr[1].className == 'mbody') {
            dDivbd = arr[1];
        }
        
        //check scrollbar
        if (dDivhd && dDivbd && dDivbd.offsetHeight > 0 && (dDivbd.scrollTop > 0 || dDivbd.scrollHeight > dDivbd.offsetHeight)) {
            dDivhd.className = 'mhead mheads';
            if (document.all) { //if ie
                jDbank(dDivhd).children('table').css('width','');
                jDbank(dDivhd).children('table').width(jDbank(dDivhd).width() - 28);
            }
        }else if(dDivhd && dDivhd.offsetHeight > 0) {
            dDivhd.className = 'mhead';
            if (document.all) { //if ie
                jDbank(dDivhd).children('table').css('width','');
                jDbank(dDivhd).children('table').width(jDbank(dDivhd).width() - 10);
            }
        }
        
        if (dDivbd && !timer && bBind) {
            jDbank(window).bind('resize', function(e) {
                if (timer) {
                    clearTimeout(timer);
                }
                timer = setTimeout(function(){
                    //check scrollbar
                    if (dDivhd && dDivbd && dDivbd.offsetHeight > 0 && (dDivbd.scrollTop > 0 || dDivbd.scrollHeight > dDivbd.offsetHeight)) {
                        dDivhd.className = 'mhead mheads';
                        if (document.all) { //if ie
                            jDbank(dDivhd).children('table').css('width','');
                            jDbank(dDivhd).children('table').width(jDbank(dDivhd).width() - 28);
                        }
                    }else if(dDivhd && dDivhd.offsetHeight > 0) {
                        dDivhd.className = 'mhead';
                        if (document.all) { //if ie
                            jDbank(dDivhd).children('table').css('width','');
                            jDbank(dDivhd).children('table').width(jDbank(dDivhd).width() - 10);
                        }
                    }
                },200);
            });
        }
    };
    
    /* keyShortcuts */
    jut.prototype.keyShortcuts = function(module, This) {
        var self = This || this;
        var dTar,oModule, arrTemp;
        oModule = jDbank(module);
        module = This._tableObj;      //table dom object
        
        oModule.bind('click',function(e){
            dTar = e.target;
            //if select all
            if (window.currentFocusedDom == self.focusIndex && dTar.tagName.toLowerCase() == 'input' && dTar.getAttribute('type') == 'checkbox' && dTar.parentNode.tagName.toLowerCase() == 'th') {
                if (dTar.checked) {
                    self.selectAllItem();
                    self.setSelectAllCheck(true);
                }else if (dTar.checked == false) {
                    self.selectAllItem(false);
                    self.setSelectAllCheck(false);
                }
            }
            
            if (self._alterType > 0 && e.target.tagName.toLowerCase() != 'input' && e.target.tagName.toLowerCase() != 'a') {
                self.renameItem();
            }
        });
        
        //move up or move down
        var fnMoveFile = function(e, fromTr, ifUp) {
            var oTemp;
            if (ifUp) {
                oTemp = fromTr.prev();
                
                if (oTemp[0] && oTemp[0].tagName.toLowerCase() == 'tr') {
                    if(e.shiftKey) {
                        self.setItemSelected(oTemp, 'shift');
                    }else {
                        self.setItemSelected(oTemp);
                    }
                }
            }else {
                oTemp = fromTr.next();
                
                if (oTemp[0] && oTemp[0].tagName.toLowerCase() == 'tr') {
                    if(e.shiftKey) {
                        self.setItemSelected(oTemp, 'shift');
                    }else {
                        self.setItemSelected(oTemp);
                    }
                }
            }
        };
        
        oModule.bind('keydown',function(e){
            //ctrl + A select all
            if (window.currentFocusedDom == self.focusIndex && e.ctrlKey && e.keyCode == 65) {
                self.selectAllItem();
                self.setSelectAllCheck(true);
                
                //stop event
                e.preventDefault();
            }
            
            if (window.currentFocusedDom == self.focusIndex && self._alterType === 0) {
                if (e.keyCode == 38) {
                    //move up
                    if (!self._lastSelectedFile) {
                        self._lastSelectedFile = jDbank(module.getElementsByTagName('tr')[0]);
                    }
                    fnMoveFile(e, self._lastSelectedFile, true);
                    
                    //stop event
                    e.preventDefault();
                }else if (e.keyCode == 40) {
                    //move down
                    if (!self._lastSelectedFile) {
                        self._lastSelectedFile = jDbank(module.getElementsByTagName('tr')[0]);
                    }
                    fnMoveFile(e, self._lastSelectedFile, false);
                    
                    //stop event
                    e.preventDefault();
                }else if (e.keyCode == 46) {    //delete
                    //interface for before delete items
                    self._eventObj = {};        //clear it
                    self._eventObj.type = 'beforeDelItem';
                    arrTemp = self.getSelectedItems();
                    self._eventObj.delItems = arrTemp.length > 0 ? arrTemp : null;
                    fun = self.getEventHandler(self._eventObj);
                    if (!fun.apply(self, self.getHandlerArguments(self._eventObj))) {
                        return false;
                    }
                    
                    //do something here
                    
                    //interface for after delete items
                    self._eventObj.type = 'afterDelItem';
                    fun = self.getEventHandler(self._eventObj);
                    if (!fun.apply(self, self.getHandlerArguments(self._eventObj))) {
                        return false;
                    }
                }
            }
            
            if (self._alterType > 0) {  //rename file
                if (e.keyCode == 13) {
                    //rename it
                    self.renameItem();
                }else if (e.keyCode == 27) {
                    //interface for after cancel
                    self._eventObj = {};
                    self._eventObj.type = 'beforeCancelRename';
                    fun = self.getEventHandler(self._eventObj);
                    if (!fun.apply(self, self.getHandlerArguments(self._eventObj))) {
                        return false;
                    }
                    
                    //if cancel then hide it
                    self._currentItemP.innerHTML = self._oldItemName;
                    self._currentItemP.style.visibility = '';
                    self.hideAlterInput();
                    self._alterType = 0;
                }
            }
        });
    };

    /*--init--*/
    jut.prototype.init = function(This) {
        This.thMouseOn(This._tableObj);
        This.trMouseOn(This._tableObj);
        This.keyShortcuts(document, This);
        This.fileSelectInit(This._tableObj, This);
        This.widthAdapt(This._tableObj);
    };
    
    /*--rebind th and tr hover event, and col drag event--*/
    jut.prototype.rebind = function() {
        this.thMouseOn(this._tableObj);
        this.trMouseOn(this._tableObj);
        this.fileSelectInit(this._tableObj, this);
        this.widthAdapt(this._tableObj);
    };
    
    /*--refresh--*/
    jut.prototype.refresh = function() {
        this.selectAllItem(false);
        this._tableObj = document.getElementById(this._tableId);
        this._dCheckboxs = this._tableObj.getElementsByTagName('input');
        this._dSelectAll = this._dCheckboxs[0];
        
        this._lastSelectedFile = null;
        this._currentItem = null;
        this._currentItemP = null;
        this._oldItemName = '';
        this._selectedItems = {};
        this._dTrs = null;
    };

    /* file drag and drop */
    jut.prototype.dragFileInit = function(module, This, tableThis) {
        var self = This;
        var dTar,arrTemp,oModule, arrList = new Array(), i = 0;
        var fun = null;
            
        oModule = jDbank(module);
        oModule.bind('mousedown',function(e) {
            dTar = e.target;
            if (e.button != 2) {
                if (dTar.tagName.toLowerCase() == 'td'
                    || dTar.tagName.toLowerCase() == 'img'
                    || (dTar.tagName.toLowerCase() == 'p' && jDbank(dTar).hasClass('filetxt'))
                    || (dTar.tagName.toLowerCase() == 'p' && jDbank(dTar).hasClass('operations'))
                ) {           
                    //get how many files selected
                    arrTemp = tableThis.getSelectedItems();
                    arrList.length = 0;
                    for (i=0;i<arrTemp.length;i++) {
                        arrList[arrList.length] = arrTemp[i].getElementsByTagName('p')[0].innerHTML;
                    }
                    oTr = jDbank(dTar).parents('tr'); 
                    
                    //if move a selected file or folder
                    if (oTr.hasClass('selected') && arrTemp.length > 0) {
                        //--interface before drag item--
                        tableThis._eventObj = {};        //clear it
                        tableThis._eventObj.type = 'beforeDragItem';
                        tableThis._eventObj.dragItem = oTr[0];
                        fun = tableThis.getEventHandler(tableThis._eventObj);
                        if (!fun.apply(tableThis, tableThis.getHandlerArguments(tableThis._eventObj))) {
                            return false;
                        }
                        
                        //set drag start
                        self.startDrag(oTr[0], 1);
                        
                        //set follow div list
                        self.setList(arrList, 1);
                    }else {     //------do something else like use mouse multi select--------
                    
                    }
                }
                
                if (dTar.tagName.toLowerCase() != 'input' && dTar.tagName.toLowerCase() != 'textarea') {
                    //stop event
                    e.preventDefault();
                }
            }
        });
    };
})();