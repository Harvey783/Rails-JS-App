$(document).on("turbolinks:load", function() {
  $(document).on("click", ".projects-index", function(e) {
    e.preventDefault();
    getProjectsIndex();
  });
});
///////////////////////////////////////

var projectColumn = function() {
  let output = `<div class="projects">`;
  return output;
};

function ProjectIndex(project) {
  this.id = project.id;
  this.name = project.name;
}

ProjectIndex.prototype.projectLink = function() {
  let output = `<a href="/projects/${this.id}"
  class="js-projects-show"
  id="project-${this.id}">
  ${this.name}</a>`;
  return output;
};

ProjectIndex.prototype.projectName = function() {
  let output = `<h4> ${this.projectLink()} </h4>`;
  return output;
};

// AJAX //////////////////
const getProjectsIndex = function() {
  $.get("/projects.json").done(function(data) {
    const projects = data.sort(function(a, b) {
      return a - b;
    });

    let projectsIndex = projectColumn();

    $.each(projects, function(index, value) {
      let projectIndex = new ProjectIndex(value);
      projectsIndex += projectIndex.projectName();
    });

    projectsIndex += "</div>";
    $(".projects-main").html(projectsIndex);
  });
};

// AJAX ACTIVITIES LOAD
$(document).on("turbolinks:load", function() {
  $(function() {
    $("a.load_activities").on("click", function(e) {
      $.ajax({
        method: "GET",
        url: this.href
      }).success(function(response) {
        $("div.activities").html(response);
      });
      e.preventDefault();
    });
  });
});

// AJAX PROJECT POST

$(function() {
  $("#new_project").on("submit", function(event) {
    event.preventDefault();

    var values = $(this).serialize();

    var posting = $.post("/projects", values);

    posting.done(function(data) {
      var project = new ProjectIndex(data);
      $(".projects").append(project.projectLink());
    });
  });
});
