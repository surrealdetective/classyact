$(document).ready(function() {
  if($('#needs-improvement').length > 0) {
    var avg_class_scores = $('#needs-improvement').data("avg_class_scores")
    var meta_improvement_count = $('#needs-improvement').data("meta_improvement_scores")
    // debugger
    window.chart = new Highcharts.Chart({
                
        chart: {
            renderTo: 'needs-improvement',
            polar: true,
            type: 'line'
        },
        
        title: {
            text: 'Needs Improvement'
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
            data: meta_improvement_count,
            pointPlacement: 'on'
        }]
    
    });
  }
});