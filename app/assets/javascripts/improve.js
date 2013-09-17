$(document).ready(function() {
  var sub_avg_factor           =  $("#improve").data("sub_avg_factor");
  var sub_learning_preferences =  $("#improve").data("improve");
  var sub_factors              =  $("#improve").data("sub_factors");
  window.chart = new Highcharts.Chart({
                
    chart: {
      renderTo: 'improve', //improve
      polar: true,
      type: 'line'
    },
      
    title: {
      text: 'Needs Improvement' //sub_title
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