$(function () {
  if($('#most-important').length > 0) {
    var thinking_count = $('#most-important').data("thinking");
    var interactions_count = $('#most-important').data("interactions");
    var expectations_count = $('#most-important').data("expectations");
    var willing_count = $('#most-important').data("willing");
    var discipline_count = $('#most-important').data("discipline");
    var direction_count = $('#most-important').data("direction");
    window.chart = new Highcharts.Chart({
                
        chart: {
            renderTo: 'most-important',
            polar: true,
            type: 'line'
        },
        
        title: {
            text: 'Most Important',
            x: -115
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
            align: 'right',
            verticalAlign: 'top',
            y: 100,
            layout: 'vertical'
        },
        
        series: [{
            name: 'Average Scores by Factor',
            data: [thinking_count, interactions_count, direction_count, expectations_count, discipline_count, willing_count],
            pointPlacement: 'on'
        }, {
            name: 'Aggregated Learning Preferences',
            data: [5, 5, 5, 5, 5, 5],
            pointPlacement: 'on'
        }]
    
    });
  }
});