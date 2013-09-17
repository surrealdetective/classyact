$(document).ready(function() {
  if($('#best-performing').length > 0) {
    var avg_class_scores = $('#best-performing').data("avg_class_scores")
    var meta_performing_count = $('#best-performing').data("meta_performing_scores")
    window.chart = new Highcharts.Chart({
                
        chart: {
            renderTo: 'best-performing',
            polar: true,
            type: 'line'
        },
        
        title: {
            text: 'Best Performing'
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
            pointPlacement: 'on'
        }, {
            name: 'Class Preferences Score',
            data: meta_performing_count,
            pointPlacement: 'on'
        }]
    
    });
  }
});