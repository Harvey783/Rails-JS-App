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
  attachSortListener();
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

function attachSortListener() {
  $("#js-button").click(function(e) {
    let url = `/projects/${this.dataset.id}.json`;
    $.ajax({
      method: "GET",
      url: url
    }).success(function(response) {
      response.activities.sort(function(a, b) {
        var nameA = a.name.toUpperCase();
        var nameB = b.name.toUpperCase();
        if (nameA < nameB) {
          return -1;
        }
        if (nameA > nameB) {
          return 1;
        }
        return 0;
      });
      $("div.activities").html("");
      response.activities.forEach(function(x) {
        $("div.activities").append(`<p>${x.name}</p>`);
      });
    });
  });
}

// PROJECT POST

$(function() {
  $("#new_project").submit(function(event) {
    event.preventDefault();
    // event listener to prevent form submission

    var values = $(this).serialize();
    // take form data and serialize

    var posting = $.post("/projects", values);
    // retrieve data via $.post and pass it the URL and values
    // specify what happens once AJAX request is done
    posting.done(function(data) {
      var project = new ProjectIndex(data);
      $(".projects").append(project.projectName());
    });
  });
});
