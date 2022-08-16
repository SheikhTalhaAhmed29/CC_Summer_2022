void bubbleSort(int array[], int size) {

  // loop to access each element of array
  for (int step = 0; step < size - 1; ++step) {
      
    // loop to compare elements of array
    for (int i = 0; i < size - step - 1; ++i) {
      
      // compare two adjacent elements
      // change > to < to sort in descending order
      if (array[i] > array[i + 1]) {
        
        // swapping occurs if elements
        // are not in the intended order
        int temp = array[i];
        array[i] = array[i + 1];
        array[i + 1] = temp;
      }
    }
  }
}


