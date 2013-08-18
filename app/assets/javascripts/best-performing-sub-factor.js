$(document).ready(function() {
  if($('#thinking-import-sub').length > 0) {
    var avg_class_scores = $('#thinking-import-sub').data("avg_class_scores")
    var meta_important_count = $('#thinking-import-sub').data("meta_important_scores")
    // debugger
    window.chart = new Highcharts.Chart({
                
        chart: {
            renderTo: 'thinking-import-sub',
            polar: true,
            type: 'line'
        },
        
        title: {
            text: 'Most Important'
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
            data: avg_class_scores,
            pointPlacement: 'on',
        }, {
            name: 'Aggregated Learning Preferences',
            data: meta_important_count,
            pointPlacement: 'on'
        }]
    
    });
  }
});