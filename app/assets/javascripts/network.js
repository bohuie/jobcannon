function Friendexpand(){
    var current = d3.select(this);
    current.moveToFront();
    if(current.select("rect").attr("width") == 100){
      var info = nodes[current.select("text").text()]
      //Fade all other nodes
      svg.selectAll(".node").transition()
          .style("opacity", "0.75");
      current.transition()
        .style("opacity", "1");
      //Increase size of photo
      current
        .select("image").transition()
          .attr('width', 50)
          .attr('height', 50);
      //Increase size of node to hold information
      current
        .selectAll("rect").transition()
          .attr("width", function(d){
            if(parseFloat(d3.select(this).attr("width"))>50){
              return 260+parseFloat(d3.select(this).attr("width"))
            }else{
              return 52
            }
          })
          .attr("height", function(d){
            if(parseFloat(d3.select(this).attr("width"))>50){
              return 140+parseFloat(d3.select(this).attr("height"))
            }else{
              return 52
            }
          })
          .style("fill", function(d){
            if(d3.select(this).style("fill").indexOf("rgba(0, 0, 0, 0)") > -1){
              return "rgba(0, 0, 0, 0)";
            }else{
              return selectedcolor;
            }
          });
      //Position text to display relevent information
      current.select("text")
        .text("")
        .attr("clip-path", "url(#clip2)")
        .attr("x", 20)
        .append("tspan")
          .attr("dy", 4)
          .text(info.name)
          .attr("class", "profilenametext");
      current.select("text")
        .append("tspan")
          .attr("dy", 17)
          .attr("x", 20)
          .text(info.email);
      current.select("text")
        .append("tspan")
          .attr("dy", 17)
          .attr("x", 20)
          .text(info.experiences[0].title + " at " + info.experiences[0].company_name);
      current.append("foreignObject")
        .attr("x", -30) /*the position of the text (left to right)*/
        .attr("y", 66) /*the position of the text (Up and Down)*/
        .attr("width", 80)
        .attr("height", 72)
        .attr("id", "id"+info.id)
        .append("xhtml:body")
        .append("p")
          .attr("class", "profilecontenttext")
          .text(function(d){
            var result = "";
            var x;
            for(x in d.skills){
              result += d.skills[x].label+", ";
            }
            result = result.substring(0, result.length-2);
            if(result == "")
              result = "None added"
            return result;
          })
          .style("background", selectedcolor);
      current.append("foreignObject")
        .attr("x", -30) /*the position of the text (left to right)*/
        .attr("y", 48) /*the position of the text (Up and Down)*/
        .attr("width", 80)
        .attr("height", 18)
        .attr("id", "id"+info.id)
        .append("xhtml:body")
        .append("p")
          .attr("class", "profiletagtext")
          .text("Skills")
          .style("background", selectedcolor);
      current.append("foreignObject")
        .attr("x", 50) /*the position of the text (left to right)*/
        .attr("y", 66) /*the position of the text (Up and Down)*/
        .attr("width", 80)
        .attr("height", 72)
        .attr("id", "id"+info.id)
        .append("xhtml:body")
        .append("p")
          .attr("class", "profilecontenttext")
          .text(function(d){
            var result = "";
            var x;
            for(x in d.interests){
              result += d.interests[x].label+", ";
            }
            result = result.substring(0, result.length-2);
            if(result == "")
              result = "None added"
            return result;
          })
          .style("background", selectedcolor);
      current.append("foreignObject")
        .attr("x", 50) /*the position of the text (left to right)*/
        .attr("y", 48) /*the position of the text (Up and Down)*/
        .attr("width", 80)
        .attr("height", 18)
        .attr("id", "id"+info.id)
        .append("xhtml:body")
        .append("p")
          .attr("class", "profiletagtext")
          .text("Interests")
          .style("background", selectedcolor);
       current.append("foreignObject")
        .attr("x", 130) /*the position of the text (left to right)*/
        .attr("y", 66) /*the position of the text (Up and Down)*/
        .attr("width", 110)
        .attr("height", 72)
        .attr("id", "id"+info.id)
        .append("xhtml:body")
        .append("p")
          .attr("class", "profilecontenttext")
          .html(function(d){
            var result = "";
            var x;
            for(x in d.experiences){
            	if(d.experiences[x].current == false)
              		result += "- " + d.experiences[x].title+" at " + d.experiences[x].company_name + "<br>";
            }
            result = result.substring(0, result.length-2);
            if(result == "")
              result = "None added"
          	console.log(result)
            return result;
          })
          .style("background", selectedcolor);
      current.append("foreignObject")
        .attr("x", 130) /*the position of the text (left to right)*/
        .attr("y", 48) /*the position of the text (Up and Down)*/
        .attr("width", 110)
        .attr("height", 18)
        .attr("id", "id"+info.id)
        .append("xhtml:body")
        .append("p")
          .attr("class", "profiletagtext")
          .text("Past Jobs")
          .style("background", selectedcolor);
      current.append("foreignObject")
        .attr("x", 240) /*the position of the text (left to right)*/
        .attr("y", 66) /*the position of the text (Up and Down)*/
        .attr("width", 80)
        .attr("height", 60)
        .attr("id", "id"+info.id)
        .append("xhtml:body")
        .append("p")
          .attr("class", "profilecontenttext")
          .text(function(d){
            var result = "";
            var x;
            for(x in d.following){
              result += d.following[x].fname+", ";
            }
            result = result.substring(0, result.length-2);
            if(result == "")
              result = "None added"
            return result;
          })
          .style("background", selectedcolor);
      current.append("foreignObject")
        .attr("x", 240) /*the position of the text (left to right)*/
        .attr("y", 48) /*the position of the text (Up and Down)*/
        .attr("width", 80)
        .attr("height", 18)
        .attr("id", "id"+info.id)
        .append("xhtml:body")
        .append("p")
          .attr("class", "profiletagtext")
          .text("Following")
          .style("background", selectedcolor);
      current.append("foreignObject")
        .attr("x", 230) /*the position of the text (left to right)*/
        .attr("y", 126) /*the position of the text (Up and Down)*/
        .attr("width", 80)
        .attr("height", 18)
        .attr("id", "id"+info.id)
        .append("xhtml:body")
        .append("a")
          .attr("href", "/profile/8")
          .append("p")
            .attr("class", "profiletagtext")
            .text("Full Profile")
            .style("background", selectedcolor);
    }else{
      var info = nodes[current.select("text").select("tspan").text()]
      //Re-color all nodes
      svg.selectAll(".node").transition()
        .style("opacity", "1");
      //Revert image border
      current
        .selectAll("rect").transition()
          .attr("width", 25)
          .attr("height", 25);
      //Revert image size
      current
        .select("image").transition()
          .attr('width', 23)
          .attr('height', 23);
      //Revert container size
      current
        .selectAll("rect").transition()
          .attr("width", function(d){
            if(parseFloat(d3.select(this).attr("width"))>60){
              return -260+parseFloat(d3.select(this).attr("width"))
            }else{
              return 25
            }
          })
          .attr("height", function(d){
            if(parseFloat(d3.select(this).attr("width"))>60){
              return -140+parseFloat(d3.select(this).attr("height"))
            }else{
              return 25
            }
          })
          .style("fill", function(d){
            if(d3.select(this).style("fill").indexOf("rgba(0, 0, 0, 0)") > -1){
              return "rgba(0, 0, 0, 0)";
            }else{
              return color;
            }
          });
      //Revert Text
      current.select("text")
        .attr("x", -5)
        .attr("y", 0)
        .attr("clip-path", "url(#clip1)")
        .text(function(d) { return d.name; });
      //Remove all extra information
      var id  = '#id'+info.id
      d3.selectAll(id).remove();
      }
  }
function Businessexpand(){
    var current = d3.select(this);
    current.moveToFront();
    if(current.select("rect").attr("width") == 100){
      var info = busnodes[current.select("text").text()]
      //Fade all other nodes
      bussvg.selectAll(".node").transition()
          .style("opacity", "0.75");
      current.transition()
        .style("opacity", "1");
      //Increase size of photo
      current
        .select("image").transition()
          .attr('width', 50)
          .attr('height', 50);
      //Increase size of node to hold information
      current
        .selectAll("rect").transition()
          .attr("width", function(d){
            if(parseFloat(d3.select(this).attr("width"))>50){
              return 260+parseFloat(d3.select(this).attr("width"))
            }else{
              return 52
            }
          })
          .attr("height", function(d){
            if(parseFloat(d3.select(this).attr("width"))>50){
              return 140+parseFloat(d3.select(this).attr("height"))
            }else{
              return 52
            }
          })
          .style("fill", function(d){
            if(d3.select(this).style("fill").indexOf("rgba(0, 0, 0, 0)") > -1){
              return "rgba(0, 0, 0, 0)";
            }else{
              return selectedcolor;
            }
          });
      if(info.company){
      	console.log("its a company")
      	current.select("text")
	        .text("")
	        .attr("clip-path", "url(#clip2)")
	        .attr("x", 20)
	        .append("tspan")
	          .attr("dy", 4)
	          .text(info.name)
	          .attr("class", "profilenametext");
      }
      else{
	      //Position text to display relevent information
	      current.select("text")
	        .text("")
	        .attr("clip-path", "url(#clip2)")
	        .attr("x", 20)
	        .append("tspan")
	          .attr("dy", 4)
	          .text(info.name)
	          .attr("class", "profilenametext");
	      current.select("text")
	        .append("tspan")
	          .attr("dy", 17)
	          .attr("x", 20)
	          .text(info.email);
	      current.select("text")
	        .append("tspan")
	          .attr("dy", 17)
	          .attr("x", 20)
	          .text(info.experiences[0].title + " at " + info.experiences[0].company_name);
	      current.append("foreignObject")
	        .attr("x", -30) /*the position of the text (left to right)*/
	        .attr("y", 66) /*the position of the text (Up and Down)*/
	        .attr("width", 80)
	        .attr("height", 72)
	        .attr("id", "id"+info.id)
	        .append("xhtml:body")
	        .append("p")
	          .attr("class", "profilecontenttext")
	          .text(function(d){
	            var result = "";
	            var x;
	            for(x in d.skills){
	              result += d.skills[x].label+", ";
	            }
	            result = result.substring(0, result.length-2);
	            if(result == "")
	              result = "None added"
	            return result;
	          })
	          .style("background", selectedcolor);
	      current.append("foreignObject")
	        .attr("x", -30) /*the position of the text (left to right)*/
	        .attr("y", 48) /*the position of the text (Up and Down)*/
	        .attr("width", 80)
	        .attr("height", 18)
	        .attr("id", "id"+info.id)
	        .append("xhtml:body")
	        .append("p")
	          .attr("class", "profiletagtext")
	          .text("Skills")
	          .style("background", selectedcolor);
	      current.append("foreignObject")
	        .attr("x", 50) /*the position of the text (left to right)*/
	        .attr("y", 66) /*the position of the text (Up and Down)*/
	        .attr("width", 80)
	        .attr("height", 72)
	        .attr("id", "id"+info.id)
	        .append("xhtml:body")
	        .append("p")
	          .attr("class", "profilecontenttext")
	          .text(function(d){
	            var result = "";
	            var x;
	            for(x in d.interests){
	              result += d.interests[x].label+", ";
	            }
	            result = result.substring(0, result.length-2);
	            if(result == "")
	              result = "None added"
	            return result;
	          })
	          .style("background", selectedcolor);
	      current.append("foreignObject")
	        .attr("x", 50) /*the position of the text (left to right)*/
	        .attr("y", 48) /*the position of the text (Up and Down)*/
	        .attr("width", 80)
	        .attr("height", 18)
	        .attr("id", "id"+info.id)
	        .append("xhtml:body")
	        .append("p")
	          .attr("class", "profiletagtext")
	          .text("Interests")
	          .style("background", selectedcolor);
	       current.append("foreignObject")
	        .attr("x", 130) /*the position of the text (left to right)*/
	        .attr("y", 66) /*the position of the text (Up and Down)*/
	        .attr("width", 110)
	        .attr("height", 72)
	        .attr("id", "id"+info.id)
	        .append("xhtml:body")
	        .append("p")
	          .attr("class", "profilecontenttext")
	          .html(function(d){
	            var result = "";
	            var x;
	            for(x in d.experiences){
	            	if(d.experiences[x].current == false)
	              		result += "- " + d.experiences[x].title+" at " + d.experiences[x].company_name + "<br>";
	            }
	            result = result.substring(0, result.length-2);
	            if(result == "")
	              result = "None added"
	          	console.log(result)
	            return result;
	          })
	          .style("background", selectedcolor);
	      current.append("foreignObject")
	        .attr("x", 130) /*the position of the text (left to right)*/
	        .attr("y", 48) /*the position of the text (Up and Down)*/
	        .attr("width", 110)
	        .attr("height", 18)
	        .attr("id", "id"+info.id)
	        .append("xhtml:body")
	        .append("p")
	          .attr("class", "profiletagtext")
	          .text("Past Jobs")
	          .style("background", selectedcolor);
	      current.append("foreignObject")
	        .attr("x", 240) /*the position of the text (left to right)*/
	        .attr("y", 66) /*the position of the text (Up and Down)*/
	        .attr("width", 80)
	        .attr("height", 60)
	        .attr("id", "id"+info.id)
	        .append("xhtml:body")
	        .append("p")
	          .attr("class", "profilecontenttext")
	          .text(function(d){
	            var result = "";
	            var x;
	            for(x in d.following){
	              result += d.following[x].fname+", ";
	            }
	            result = result.substring(0, result.length-2);
	            if(result == "")
	              result = "None added"
	            return result;
	          })
	          .style("background", selectedcolor);
	      current.append("foreignObject")
	        .attr("x", 240) /*the position of the text (left to right)*/
	        .attr("y", 48) /*the position of the text (Up and Down)*/
	        .attr("width", 80)
	        .attr("height", 18)
	        .attr("id", "id"+info.id)
	        .append("xhtml:body")
	        .append("p")
	          .attr("class", "profiletagtext")
	          .text("Following")
	          .style("background", selectedcolor);
	      current.append("foreignObject")
	        .attr("x", 230) /*the position of the text (left to right)*/
	        .attr("y", 126) /*the position of the text (Up and Down)*/
	        .attr("width", 80)
	        .attr("height", 18)
	        .attr("id", "id"+info.id)
	        .append("xhtml:body")
	        .append("a")
	          .attr("href", "/profile/8")
	          .append("p")
	            .attr("class", "profiletagtext")
	            .text("Full Profile")
	            .style("background", selectedcolor);
	    }
    }else{
      var info = busnodes[current.select("text").select("tspan").text()]
      if(info.company){console.log("still a company")}
      //Re-color all nodes
      bussvg.selectAll(".node").transition()
        .style("opacity", "1");
      //Revert image border
      current
        .selectAll("rect").transition()
          .attr("width", 25)
          .attr("height", 25);
      //Revert image size
      current
        .select("image").transition()
          .attr('width', 23)
          .attr('height', 23);
      //Revert container size
      current
        .selectAll("rect").transition()
          .attr("width", function(d){
            if(parseFloat(d3.select(this).attr("width"))>60){
              return -260+parseFloat(d3.select(this).attr("width"))
            }else{
              return 25
            }
          })
          .attr("height", function(d){
            if(parseFloat(d3.select(this).attr("width"))>60){
              return -140+parseFloat(d3.select(this).attr("height"))
            }else{
              return 25
            }
          })
          .style("fill", function(d){
            if(d3.select(this).style("fill").indexOf("rgba(0, 0, 0, 0)") > -1){
              return "rgba(0, 0, 0, 0)";
            }else{
              return color;
            }
          });
      //Revert Text
      current.select("text")
        .attr("x", -5)
        .attr("y", 0)
        .attr("clip-path", "url(#clip1)")
        .text(function(d) { return d.name; });
      //Remove all extra information
      var id  = '#id'+info.id
      d3.selectAll(id).remove();
      }
  }
function Bothexpand(){
    var current = d3.select(this);
    current.moveToFront();
    if(current.select("rect").attr("width") == 100){
      var info = bothnodes[current.select("text").text()]
      //Fade all other nodes
      bothsvg.selectAll(".node").transition()
          .style("opacity", "0.75");
      current.transition()
        .style("opacity", "1");
      //Increase size of photo
      current
        .select("image").transition()
          .attr('width', 38)
          .attr('height', 38);
      //Increase size of node to hold information
      current
        .selectAll("rect").transition()
          .attr("width", function(d){
            if(parseFloat(d3.select(this).attr("width"))>50){
              return 150+parseFloat(d3.select(this).attr("width"))
            }else{
              return 40
            }
          })
          .attr("height", function(d){
            if(parseFloat(d3.select(this).attr("width"))>50){
              return 125+parseFloat(d3.select(this).attr("height"))
            }else{
              return 40
            }
          })
          .style("fill", function(d){
            if(d3.select(this).style("fill").indexOf("rgba(0, 0, 0, 0)") > -1){
              return "rgba(0, 0, 0, 0)";
            }else{
              return selectedcolor;
            }
          });
      //Position text to display relevent information
      current.
        select("text")
        .text("")
        .attr("clip-path", "url(#clip2)")
        .attr("x", 16)
        .append("tspan")
          .attr("dy", 4)
          .text(info.name)
          .attr("class", "profilenametext");
      current.select("text")
        .append("tspan")
          .attr("dy", 19)
          .attr("x", 16)
          .text(info.email);
      current.append("foreignObject")
        .attr("x", -30) /*the position of the text (left to right)*/
        .attr("y", 52) /*the position of the text (Up and Down)*/
        .attr("width", 80)
        .attr("height", 72)
        .attr("id", "id"+info.id)
        .append("xhtml:body")
        .append("p")
          .attr("class", "profilecontenttext")
          .text(function(d){
            var result = "";
            var x;
            for(x in d.skills){
              result += d.skills[x].label+", ";
            }
            result = result.substring(0, result.length-2);
            if(result == "")
              result = "None added"
            return result;
          })
          .style("background", selectedcolor);
      current.append("foreignObject")
        .attr("x", -30) /*the position of the text (left to right)*/
        .attr("y", 34) /*the position of the text (Up and Down)*/
        .attr("width", 80)
        .attr("height", 18)
        .attr("id", "id"+info.id)
        .append("xhtml:body")
        .append("p")
          .attr("class", "profiletagtext")
          .text("Skills")
          .style("background", selectedcolor);
      current.append("foreignObject")
        .attr("x", 50) /*the position of the text (left to right)*/
        .attr("y", 52) /*the position of the text (Up and Down)*/
        .attr("width", 80)
        .attr("height", 72)
        .attr("id", "id"+info.id)
        .append("xhtml:body")
        .append("p")
          .attr("class", "profilecontenttext")
          .text(function(d){
            var result = "";
            var x;
            for(x in d.interests){
              result += d.interests[x].label+", ";
            }
            result = result.substring(0, result.length-2);
            if(result == "")
              result = "None added"
            return result;
          })
          .style("background", selectedcolor);
      current.append("foreignObject")
        .attr("x", 50) /*the position of the text (left to right)*/
        .attr("y", 34) /*the position of the text (Up and Down)*/
        .attr("width", 80)
        .attr("height", 18)
        .attr("id", "id"+info.id)
        .append("xhtml:body")
        .append("p")
          .attr("class", "profiletagtext")
          .text("Interests")
          .style("background", selectedcolor);
      current.append("foreignObject")
        .attr("x", 130) /*the position of the text (left to right)*/
        .attr("y", 52) /*the position of the text (Up and Down)*/
        .attr("width", 80)
        .attr("height", 60)
        .attr("id", "id"+info.id)
        .append("xhtml:body")
        .append("p")
          .attr("class", "profilecontenttext")
          .text(function(d){
            var result = "";
            var x;
            for(x in d.following){
              result += d.following[x].fname+", ";
            }
            result = result.substring(0, result.length-2);
            if(result == "")
              result = "None added"
            return result;
          })
          .style("background", selectedcolor);
      current.append("foreignObject")
        .attr("x", 130) /*the position of the text (left to right)*/
        .attr("y", 34) /*the position of the text (Up and Down)*/
        .attr("width", 80)
        .attr("height", 18)
        .attr("id", "id"+info.id)
        .append("xhtml:body")
        .append("p")
          .attr("class", "profiletagtext")
          .text("Following")
          .style("background", selectedcolor);
      current.append("foreignObject")
        .attr("x", 130) /*the position of the text (left to right)*/
        .attr("y", 112) /*the position of the text (Up and Down)*/
        .attr("width", 80)
        .attr("height", 18)
        .attr("id", "id"+info.id)
        .append("xhtml:body")
        .append("a")
          .attr("href", "/profile/8")
          .append("p")
            .attr("class", "profiletagtext")
            .text("Full Profile")
            .style("background", selectedcolor);
    }else{
      var info = bothnodes[current.select("text").select("tspan").text()]
      //Re-color all nodes
      bothsvg.selectAll(".node").transition()
        .style("opacity", "1");
      //Revert image border
      current
        .selectAll("rect").transition()
          .attr("width", 25)
          .attr("height", 25);
      //Revert image size
      current
        .select("image").transition()
          .attr('width', 23)
          .attr('height', 23);
      //Revert container size
      current
        .selectAll("rect").transition()
          .attr("width", function(d){
            if(parseFloat(d3.select(this).attr("width"))>50){
              return -150+parseFloat(d3.select(this).attr("width"))
            }else{
              return 25
            }
          })
          .attr("height", function(d){
            if(parseFloat(d3.select(this).attr("width"))>50){
              return -125+parseFloat(d3.select(this).attr("height"))
            }else{
              return 25
            }
          })
          .style("fill", function(d){
            if(d3.select(this).style("fill").indexOf("rgba(0, 0, 0, 0)") > -1){
              return "rgba(0, 0, 0, 0)";
            }else{
              return color;
            }
          });
      //Revert Text
      current.select("text")
        .attr("x", -5)
        .attr("y", 0)
        .attr("clip-path", "url(#clip1)")
        .text(function(d) { return d.name; });
      //Remove all extra information
      var id  = '#id'+info.id
      d3.selectAll(id).remove();
      }
  }