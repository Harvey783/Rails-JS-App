function ProjectIndex(project) {
  this.id = project.id;
  this.name = project.name;
};

ProjectIndex.prototype.projectLink = function(link) {
  let output =
  `<a href="/projects/${this.id}"
  class="js-projects-show"
  id="project-${this.id}">
  ${link}</a>`;
  return output;
}

var projectColumn = function() {
  let output =
  `<div class="projects">`;
  return output;
}

ProjectIndex.prototype.projectName = function() {
  let output =
  `<h4> ${this.projectLink(this.name)} </h4>`;
  return output;
}



$(function(){
  $("a.load_activities").on("click", function(e){
    $.ajax({
      method: "GET",
      url: this.href
    }).success(function(response){
      $("div.activities").html(response)
    });
        e.preventDefault();
      })
    })
