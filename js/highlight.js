  document.addEventListener("DOMContentLoaded", function(event) {
    var codeBlocks = Array.prototype.slice.call(document.getElementsByTagName('pre'))
    codeBlocks.forEach(function(block, index) {
      hljs.highlightBlock(block);
    });
  });