import {Sorter} from "utilities/sorter"

document.addEventListener("turbolinks:load", () => {
  let table = document.getElementById("tests");
  const cell = table?.querySelector(".sort-by-title");
  if (cell) {
    cell.addEventListener("click", () => {
      const sortedTable = new Sorter(table, cell).sortTable();
      table.replaceWith(sortedTable);
      table = sortedTable;
    });
  }
});
