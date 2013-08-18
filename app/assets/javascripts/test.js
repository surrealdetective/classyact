$(document).ready(function() {
  if($('#test').length > 0) {
    var avg_class_scores = $('#best-performing').data("avg_class_scores")
    var meta_performing_count = $('#best-performing').data("meta_performing_scores")
    // debugger
    window.chart = new Highcharts.Chart({
                
        chart: {
            renderTo: 'test',
            polar: true,
            type: 'line'
        },
        
        title: {
            text: 'Best Performing'
        },
        
        pane: {
            size: '80%'
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
            shared: true,
            valuePrefix: '$'
        },
        
        legend: {
            align: 'bottom',
            verticalAlign: 'top',
            y: 100,
            layout: 'vertical'
        },
        
        series: [{
            name: 'Average Scores by Factor',
            data: avg_class_scores,
            pointPlacement: 'on'
        }, {
            name: 'Aggregated Learning Preferences',
            data: meta_performing_count,
            pointPlacement: 'on'
        }]
    
    });
  }
});