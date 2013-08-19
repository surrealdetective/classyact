$(document).ready(function() {
  if($('#thinking-perform-sub').length > 0) {
    var avg_sub_scores = $('#thinking-perform-sub').data("avg_sub_scores")
    var sub_thinking_perform = $('#thinking-perform-sub').data("sub_thinking_perform")
    debugger
    window.chart = new Highcharts.Chart({
                
        chart: {
            renderTo: 'thinking-perform-sub',
            polar: true,
            type: 'line'
        },
        
        title: {
            text: 'Thinking Factor: Best Performing Sub-Factors'
        },
        
        pane: {
            size: '80%'
        },
        
        xAxis: {
            categories: ['Necessary Skills', 'Talent Leverage', 'Life Decisions', 'Value-add Skills'],
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
            data: avg_sub_scores,
            pointPlacement: 'on'
        }, {
            name: 'Aggregated Learning Preferences',
            data: sub_thinking_perform, 
            pointPlacement: 'on'
        }]
    
    });
  }
});