var table = document.getElementById('table');
                
for(var i = 1; i < table.rows.length; i++)
{
    table.rows[i].onclick = function()
    {
         //rIndex = this.rowIndex;
         document.getElementById("cells_0").value = this.cells[0].innerHTML;
         document.getElementById("cells_1").value = this.cells[1].innerHTML;
         document.getElementById("cells_2").value = this.cells[2].innerHTML;
    };
}