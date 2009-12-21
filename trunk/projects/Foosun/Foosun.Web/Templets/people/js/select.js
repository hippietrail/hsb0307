function Selecter(listId/*list id*/){
    this.list =document.getElementById(listId) ;
    this.selectedElement=null;
    this.state = false;

    this.changeListState = function(event){
        var e = event ? event : window.event;
        this.selectedElement = e.srcElement || e.target ;
        this.list.style.left = this.selectedElement.offsetLeft + "px" ;
        this.list.style.top = (this.selectedElement.offsetTop+22) + "px";
        this.list.style.display=this.list.style.display=="block"?"none":"block";
    };
    this.changeSelected = function(option,event){
        this.selectedElement.innerHTML=option.innerHTML;
        var value = option.getAttribute("value") ;
        document.getElementById(this.selectedElement.id+"_value").value=value;
        this.changeListState(event);
    };
	this.changeSelected1 = function(option,event){
        this.selectedElement.innerHTML=option.innerHTML;
        var value = option.getAttribute("value") ;
        document.getElementById(this.selectedElement.id+"_value").value=value;
        this.changeListState(event);
    };
    this.hiddenList = function(){
        if(!this.state)
            this.list.style.display="none";
    };
};
var s ;
function Selecter1(listId/*list id*/){
    this.list =document.getElementById(listId) ;
    this.selectedElement=null;
    this.state = false;

    this.changeListState = function(event){
        var e = event ? event : window.event;
        this.selectedElement = e.srcElement || e.target ;
        this.list.style.left = this.selectedElement.offsetLeft + "px" ;
        this.list.style.top = (this.selectedElement.offsetTop+22) + "px";
        this.list.style.display=this.list.style.display=="block"?"none":"block";
    };
    this.changeSelected = function(option,event){
        this.selectedElement.innerHTML=option.innerHTML;
        var value1 = option.getAttribute("value") ;
        document.getElementById(this.selectedElement.id+"_value").value=value1;
        this.changeListState(event);
    };
    this.hiddenList = function(){
        if(!this.state)
            this.list.style.display="none";
    };
};
var v;
function Selecter2(listId/*list id*/){
    this.list =document.getElementById(listId) ;
    this.selectedElement=null;
    this.state = false;

    this.changeListState = function(event){
        var e = event ? event : window.event;
        this.selectedElement = e.srcElement || e.target ;
        this.list.style.left = this.selectedElement.offsetLeft + "px" ;
        this.list.style.top = (this.selectedElement.offsetTop+22) + "px";
        this.list.style.display=this.list.style.display=="block"?"none":"block";
    };
    this.changeSelected = function(option,event){
        this.selectedElement.innerHTML=option.innerHTML;
        var value1 = option.getAttribute("value") ;
        document.getElementById(this.selectedElement.id+"_value").value=value1;
        this.changeListState(event);
    };
    this.hiddenList = function(){
        if(!this.state)
            this.list.style.display="none";
    };
};
var e;
function Selecter4(listId/*list id*/){
    this.list =document.getElementById(listId) ;
    this.selectedElement=null;
    this.state = false;

    this.changeListState = function(event){
        var e = event ? event : window.event;
        this.selectedElement = e.srcElement || e.target ;
        this.list.style.left = this.selectedElement.offsetLeft + "px" ;
        this.list.style.top = (this.selectedElement.offsetTop+22) + "px";
        this.list.style.display=this.list.style.display=="block"?"none":"block";
    };
    this.changeSelected = function(option,event){
        this.selectedElement.innerHTML=option.innerHTML;
        var value1 = option.getAttribute("value") ;
        document.getElementById(this.selectedElement.id+"_value").value=value1;
        this.changeListState(event);
    };
    this.hiddenList = function(){
        if(!this.state)
            this.list.style.display="none";
    };
};
var g;