var singleBarGraph = function(container, data, labels){
	var margin = {top: 20, right: 20, bottom: 30, left: 40},
    width = parseInt(d3.select(container).style('width'), 10) - margin.right - margin.left,
    height = 250 - margin.top - margin.bottom;

  var x = d3.scale.ordinal()
    .rangeRoundBands([0, width], .1);

  var y = d3.scale.linear()
    .range([height, 0]);

  var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom");

  var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left")
    .ticks(10);
  var tip = d3.tip()
    .attr('class', 'd3-tip')
    .offset([-10, 0])
    .html(function(d) {
      return "<strong>Count:</strong> <span style='color:red'>" + d + "</span>";
    })

  var svg = d3.select(container).append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

  svg.call(tip);

  x.domain(labels);
  y.domain([0, d3.max(data)]);

  svg.append("g")
    .attr("class", "x axis")
    .attr("transform", "translate(0," + height + ")")
    .call(xAxis);

  svg.append("g")
    .attr("class", "y axis")
    .call(yAxis)
  .append("text")
    .attr("transform", "rotate(-90)")
    .attr("y", 6)
    .attr("dy", ".71em")
    .style("text-anchor", "end");

  svg.selectAll(".bar")
    .data(data)
  .enter().append("rect")
    .attr("class", "bar")
    .attr("x", function(d, i) { return x(labels[i]); })
    .attr("width", x.rangeBand())
    .attr("y", function(d) { return y(d); })
    .attr("height", function(d) { return height - y(d); })
    .on('mouseover', tip.show)
    .on('mouseout', tip.hide);

  function type(d) {
    d.frequency = +d.frequency;
    return d;
  }
}

var multiBarGraph = function(container, data, labels, categories){
  var margin = {top: 20, right: 20, bottom: 30, left: 40},
    width = parseInt(d3.select(container).style('width'), 10) - margin.left - margin.right,
    height = 250 - margin.top - margin.bottom;

  var x0 = d3.scale.ordinal()
      .rangeRoundBands([0, width], .1);

  var x1 = d3.scale.ordinal();

  var y = d3.scale.linear()
      .range([height, 0]);

  var color = d3.scale.ordinal()
      .range(["red", "violet", "orange", "indigo", "yellow", "blue", "green"]);

  var xAxis = d3.svg.axis()
      .scale(x0)
      .orient("bottom");

  var yAxis = d3.svg.axis()
      .scale(y)
      .orient("left")
      .ticks(10);

  var svg = d3.select(container).append("svg")
      .attr("width", width + margin.left + margin.right)
      .attr("height", height + margin.top + margin.bottom)
    .append("g")
      .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
  
  var tip = d3.tip()
    .attr('class', 'd3-tip')
    .offset([-10, 0])
    .html(function(d) {
      return "<strong>Count:</strong> <span style='color:red'>" + d + "</span>";
    })
  svg.call(tip);

  x0.domain(labels);
  x1.domain(categories).rangeRoundBands([0, x0.rangeBand()]);
  y.domain([0, d3.max(data, function(d) { return d3.max(d, function(d) { return d; }); })]);

  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis);

  svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)

  var state = svg.selectAll(".state")
      .data(data)
    .enter().append("g")
      .attr("class", "g")
      .attr("transform", function(d, i) { return "translate(" + x0(labels[i]) + ",0)"; });

  state.selectAll("rect")
      .data(function(d) { return d; })
    .enter().append("rect")
      .attr("width", x1.rangeBand())
      .attr("x", function(d, i) { return x1(categories[i]); })
      .attr("y", function(d) { return y(d); })
      .attr("height", function(d) { return height - y(d); })
      .style("fill", function(d, i) { return color(categories[i]); })
      .on('mouseover', tip.show)
      .on('mouseout', tip.hide);  

  var legend = svg.selectAll(".legend")
      .data(categories.slice().reverse())
    .enter().append("g")
      .attr("class", "legend")
      .attr("transform", function(d, i) { return "translate(0," + i * 20 + ")"; });

  legend.append("rect")
      .attr("x", width - 18)
      .attr("width", 18)
      .attr("height", 18)
      .style("fill", color);

  legend.append("text")
      .attr("x", width - 24)
      .attr("y", 9)
      .attr("dy", ".35em")
      .style("text-anchor", "end")
      .text(function(d) { return d; });

}