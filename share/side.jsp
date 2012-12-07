<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
			<div id ="aside">
				<div id = person_information>
					<h1>| <%out.print((String) session.getAttribute("Sname"));%> |</h1><br>
					Thank you visiting our homepage!
				</div>
				<aside id="category">
					<div id='cssmenu'>
						<ul>
								<li><a href='Learning.jsp'><span>All</span></a></li>
						   <li><a href='Language_class.jsp'><span>Language</span></a></li>
						   <li><a href='Sociaty_class.jsp'><span>Society</span></a></li>
						   <li><a href='Science_class.jsp'><span>Science</span></a></li>
						   <li><a href='Skill_class.jsp'><span>Technology</span></a></li>
						   <li><a href='Art_class.jsp'><span>Art</span></a></li>
						   <li><a href='Music_class.jsp'><span>Music</span></a></li>
						</ul>
					</di>
				</aside>
				<aside id ="learning_aside">
					<section class="buttons">
						<label for="first">Best Class</label>
					</section>
					<div class="tab_item">
						<ul>
							<li class="item"><a href="#">
								<div class="thumbnail">
									<img src = "./images/piano.png"/>
								</div>
								<div class="description">
									<strong> piano Gift </strong>
									<p> 2012-11-05</p>
								</div>
							</a></li>
							<li class="item"><a href="#">
								<div class="thumbnail">
									<img src = "./images/book.png"/>
								</div>
								<div class="description">
									<strong> Book Gift </strong>
									<p> 2012-11-06</p>
								</div>
							</a></li>
							<li class="item"><a href="#">
								<div class="thumbnail">
									<img src = "./images/science.png"/>
								</div>
								<div class="description">
									<strong> Science Gift </strong>
									<p> 2012-11-07</p>
								</div>
							</a></li>
						</ul>
					</div>
				</aside>
				<aside id ="volunteer">
					<section class="buttons">
						<label for="first"> Best Volunteer</label>
					</section>
					<div class="tab_item">
						<ul>
							<li class="item"><a href="#">
								<div class="thumbnail">
									<img src = "./images/piano.png"/>
								</div>
								<div class="description">
									<strong> piano Gift </strong>
									<p> 2012-11-05</p>
								</div>
							</a></li>
							<li class="item"><a href="#">
								<div class="thumbnail">
									<img src = "./images/book.png"/>
								</div>
								<div class="description">
									<strong> Book Gift </strong>
									<p> 2012-11-06</p>
								</div>
							</a></li>
							<li class="item"><a href="#">
								<div class="thumbnail">
									<img src = "./images/science.png"/>
								</div>
								<div class="description">
									<strong> Science Gift </strong>
									<p> 2012-11-07</p>
								</div>
							</a></li>
						</ul>
					</div>
				</aside>
</div>