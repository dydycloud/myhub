# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
app = angular.module('MyHub', ['ngRoute',"ngResource"])

app.config ($routeProvider) ->
	$routeProvider
		.when('/projects', {templateUrl: "angular/views/projects.html.erb", controller: 'projectsCtrl'})
		.when('/projects/:id', {templateUrl: "angular/views/projects.html.erb", controller: 'projectCtrl'})
		.when('/contact', {templateUrl: "angular/views/contact.html.erb", controller: 'contactCtrl'})

app.factory "Project", ($resource) ->
	$resource("/projects/:id.json", {id: "@id"},{method:'GET', isArray:true},{ update: {method: "PUT"}})

@projectsCtrl = ($scope, Project, $routeParams) ->
	$scope.projects = Project.query()
	$scope.id_parm = $routeParams.id
	$scope.alert = window.alert.bind(window);

@projectCtrl = ($scope, Project, $routeParams) ->
	$scope.project = Project.get({id: $routeParams.id})

@contactCtrl = ($scope, $routeParams) ->
	$scope.contact = "Wah Gwon jedï this is contact !!"