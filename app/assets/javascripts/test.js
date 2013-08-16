$(function () { 
  var thinking_count = $('#most-important').data("thinking");
  $('#test').highcharts({
    chart: {
      type: 'bar'
    },
    title: {
      text: 'Fruit Consumption'
    },
    xAxis: {
      categories: ['Apples', 'Bananas', 'Oranges']
    },
    yAxis: {
      title: {
        text: 'Fruit eaten'
      }
    },
    series: [{
      name: 'Jane',
      data: [thinking_count , 1, 4]
    }, {
      name: 'John',
      data: [5, 7, 3]
    }]
  });
});