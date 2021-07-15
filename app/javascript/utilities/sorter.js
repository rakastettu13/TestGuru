export class Sorter {
  constructor(table, cell) {
    this.table = table;
    this.rows = table.querySelectorAll("tr");
    this.cell = cell;
  }

  sortTable () {
    const sortedTable = document.createElement("table");
    const sortedRows = this.#sortRows()

    sortedTable.append(this.rows[0]);
    sortedRows.forEach((row) => {
      sortedTable.append(row);
    });

    return sortedTable;
  }

  #sortRows() {
    const sortedRows = Array.from(this.rows).slice(1, this.rows.length);

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
    const title1 = row1.querySelector("td").textContent;
    const title2 = row2.querySelector("td").textContent;

    return title1.localeCompare(title2);
  }
}
