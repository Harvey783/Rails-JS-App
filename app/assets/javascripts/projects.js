function ProjectIndex(project) {
  this.id = project.id;
  this.name = project.name;
};



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
