$(document).ready(function() {
  var sub_avg_factor           =  $("#perform").data("sub_avg_factor");
  var sub_learning_preferences =  $("#perform").data("perform");
  var sub_factors              =  $("#perform").data("sub_factors");
  window.chart = new Highcharts.Chart({
                
    chart: {
      renderTo: 'perform',//perform
      polar: true,
      type: 'line'
    },
      
    title: {
      text: 'Best Performing' //sub_title
    },
    
    pane: {
      size: '80%'
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
      y: 100,
      layout: 'vertical'
    },
      
    series: [{
      name: 'Average Scores by Factor',
      data: sub_avg_factor,
      pointPlacement: 'on'
    }, {
      name: 'Aggregated Learning Preferences',
      data: sub_learning_preferences, 
      pointPlacement: 'on'
    }]
  });
});