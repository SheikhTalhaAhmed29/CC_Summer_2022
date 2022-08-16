## The Language Selected: ##

Selected language is Mini-C that has a syntax similar to C.

## Languagae Specification: ##

Mini C is a simple language C-like programming language which is used for coding and can be designed for implementation purpose for education (basically it is a software through which we can learn compilation).Mini-C is simple and easy to use.Selected language is exactly not a replica of what is specified in the document as we had to tweak it according to our needs because of several reasons. One being that some specifications and samples were not of C language explicitly.

### Identifiers: 

Contiguous sequence of characters is called as identifiers. Containing. [A-Za=z0-9]*

### Keywords: ###

Keywords are not recognized as identifiers. Some keywords are: False, None, True, and, break, class, continue, def, del, elif, else, for, global, if, import, in, is, lambda, return, try, while etc.

### Operators: 

Operators in Language // % < > <= >= == != = ( ) [ ] ->

### Delimiters: 

A delimiter (also known as separator) is a sequence of one or more characters used to specify the boundary between separate, independent regions in plain text or other data streams. E.g , ; : . etc.

## Example Code 
```
void bubbleSort(int array[], int size) {

  // loop to access each array element
  for (int step = 0; step < size - 1; ++step) {
      
    // loop to compare array elements
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

```
