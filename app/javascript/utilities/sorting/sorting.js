import {Sorter} from "utilities/sorting/sorter"

document.addEventListener("turbolinks:load", () => {
  let control = document.querySelector(".sort-by-title");
  if (control) {
    control.addEventListener("click", function(){
      let table = document.querySelectorAll("table")[1];
      let sortedTable = new Sorter(table, this).sortTable();
      table.replaceWith(sortedTable);
    });
  }
});
