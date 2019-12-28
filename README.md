<h1 align="center">Spendz</h1>

## Introduction
<p>A web application for tracking a users' spending, built with Ruby and Sinatra.</p>

## Project brief

<p>Build an app that allows a user to track their spending.</p>

### MVP
<ul>
  <li>The app should allow the user to create, edit and delete merchants, e.g. Tesco, Amazon, ScotRail</li>
  <li>The app should allow the user to create, edit and delete tags for their spending, e.g. groceries, entertainment, transport</li>
  <li>The user should be able to assign tags and merchants to a transaction, as well as an amount spent on each transaction.</li>
  <li>The app should display all the transactions a user has made in a single view, with each transaction’s amount, merchant and tag, and a total for all transactions.</li>
</ul>

### Inspired by:
<p>Monzo, MoneyDashboard, lots of mobile/online banking apps</p>

### Possible Extensions
<ul>
  <li>Transactions should have a timestamp, and the user should be able to view transactions sorted by the time they took place.</li>
  <li>The user should be able to supply a budget, and the app should alert the user somehow when when they are nearing this budget or have gone over it.</li>
  <li>The user should be able to filter their view of transactions, for example, to view all transactions in a given month, or view all spending on groceries.</li>
</ul>

## Technologies used
<p>This application was built using the following technologies:</p>
<ul>
  <li>Ruby (data and object modelling)</li>
  <li>Sinatra (web application framework)</li>
  <li>PostgreSQL (data storage)</li>
  <li>HTML & CSS (front-end styling)</li>
  <li>Atom (text editor)</li>
</ul>

## Running instructions
<ol>
  <li>Ensure that Ruby and PostgreSQL are installed locally.</li>
  <li>Install the following Ruby gems:
    <ul>
      <li>'sinatra'</li>
      <li>'sinatra-contrib'</li>
      <li>'pg'
    </ul>
  </li>
  <li>Clone or download the repo.</li>
  <li>In the project root, run the following instructions in the command-line terminal:
    <ol>
      <li>'createdb spending_tracker'</li>
      <li>'psql -d spending_tracker -f db/spending_tracker.sql'</li>
      <li>'ruby db/seeds.rb'</li>
    </ol>
  </li>
  <li>Run the following command in the command-line to start the web server:
    <ul>
      <li>'ruby controller.rb'</li>
    </ul>
  </li>
  <li>Open Chrome and navigate to <strong>'localhost:4567'</strong> to run the application</li>
  <li>To exit the application, type <strong>Crtl-C</strong> in the command line</li>
</ol>
