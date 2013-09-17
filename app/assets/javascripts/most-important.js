$(document).ready(function() {
  if($('#most-important').length > 0) {
    var avg_class_scores = $('#most-important').data("avg_class_scores")
    var meta_important_count = $('#most-important').data("meta_important_scores")
    // debugger
    window.chart = new Highcharts.Chart({
                
        chart: {
            renderTo: 'most-important',
            polar: true,
            type: 'line'
        },
        
        title: {
            text: 'Most Important'
        },
        
        pane: {
            size: '61%'
        },
        
        xAxis: {
            categories: ['Thinking', 'Interactions', 'Self-Direction', 'Self-Expectations', 
                    'Self-Discipine', 'Willing'],
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
            data: avg_class_scores,
            pointPlacement: 'on',
        }, {
            name: 'Class Preferences Score',
            data: meta_important_count,
            pointPlacement: 'on'
        }]
    
    });
  }
});