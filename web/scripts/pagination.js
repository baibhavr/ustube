/*!
 * author: aparna joshi
 * Date: Tue April 24 15:23:33 2012
 */

var totalPages;
var totalRecords;
var recordsPerPage=1;
function Validate() { //v3.0
	var name=document.frm.name;
	
	if ((name.value==null)||(name.value=="")){
		alert("Please Enter title of the file");
		name.focus();
		return false;
		}
}

function render(pageToLoad,totalButtons){
var start=recordsPerPage*(pageToLoad-1);
var endOfRecords;
if(pageToLoad !=totalButtons){
	endOfRecords = recordsPerPage*(pageToLoad);
}else{endOfRecords=totalRecords;}
if(start>0)
	start=start+1;
var i=0;
var j=0;
var button_name;
for(j;j<totalButtons;j++){
	button_name="button_"+j;
	document.getElementById(button_name).disabled=false;
}
button_name="button_"+(pageToLoad-1);
	document.getElementById(button_name).disabled=true;
	
for(i;document.getElementById(i)!=null;i++){
	document.getElementById(i).style.display="none";
}
for(start;start<endOfRecords;start++){
	document.getElementById(start).style.display="list-item";
}
}

window.onload=totalPagesFunc;
function totalPagesFunc(){
var i=0;
var j=0;
var button_name;
for(i;document.getElementById(i)!=null;i++){
	document.getElementById(i).style.display="none";
}totalRecords=i;
if(totalRecords>0){
button_name="button_0";
document.getElementById(button_name).disabled=true;
}
totalPages = j;

for(i=0;i<recordsPerPage;i++){
	document.getElementById(i).style.display="list-item";
	}
}
function getHits(pageToLoad,totalButtons){
render(pageToLoad,totalButtons);
}