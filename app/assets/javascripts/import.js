$(document).ready(function() {
  var sub_avg_factor           =  $("#import").data("sub_avg_factor");
  var sub_learning_preferences =  $("#import").data("import");
  var sub_factors              =  $("#import").data("sub_factors");
  window.chart = new Highcharts.Chart({
                
    chart: {
      renderTo: 'import',//import
      polar: true,
      type: 'line'
    },
      
    title: {
      text: 'Most Important' //sub_title
    },
    
    pane: {
      size: '60%'
    },
    
    xAxis: {
      categories: sub_factors,
      tickmarkPlacement: 'on',
      lineWidth: 0
    },
        
    yAxis: {
      gridLineInterpolation: 'polygon',
      lineWidth: 0,
      min: 0
    },
      
    tooltip: {
        shared: true
    },
    
    legend: {
      align: 'bottom',
      verticalAlign: 'top',
      y: 40,
      layout: 'vertical'
    },
      
    series: [{
      name: 'Avg Score',
      data: sub_avg_factor,
      pointPlacement: 'on'
    }, {
      name: 'Class Preferences Score',
      data: sub_learning_preferences, 
      pointPlacement: 'on'
    }]
  });
});