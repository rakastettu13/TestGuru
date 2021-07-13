export class Sorter {
  constructor(table, cell) {
    this.table = table;
    this.rows = table.querySelectorAll("tr");
    this.cell = cell;
  }

  sortTable () {
    let sortedTable = document.createElement("table");
    let sortedRows = this.#sortRows()

    sortedTable.classList.add("table");
    sortedTable.append(this.rows[0]);
    sortedRows.forEach((row) => {
      sortedTable.append(row);
    });

    return sortedTable;
  }

  #sortRows() {
    let sortedRows = Array.from(this.rows).slice(1, this.rows.length);

    if(this.#hiddenCheck("up")) {
      sortedRows.sort(this.#compareRowsAsc);
      this.#swap("up", "down");
    } else {
      sortedRows.reverse();
      this.#swap("down", "up");
    }

    return sortedRows;
  }

  #hiddenCheck (arrow) {
    return this.cell.querySelector(".octicon-arrow-" + arrow).classList.contains("hide");
  }

  #swap (arrow1, arrow2) {
    this.cell.querySelector(".octicon-arrow-" + arrow1).classList.remove("hide");
    this.cell.querySelector(".octicon-arrow-" + arrow2).classList.add("hide");
  }

  #compareRowsAsc(row1, row2) {
    let title1 = row1.querySelector("td").textContent;
    let title2 = row2.querySelector("td").textContent;

    return title1.localeCompare(title2);
  }
}
