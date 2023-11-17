# Progressive Overload Tracker - README

## Table of Contents

1. Overview
2. Product Spec
3. Wireframes
4. Schema

## Overview

### Description

Progressive Overload Tracker is a mobile app designed for weightlifters who want to systematically track and improve their strength training by monitoring their sets, reps, and weight progression. The app allows users to log and visualize their workout data to identify trends and ensure they are consistently challenging themselves to lift more.

### App Evaluation

- **Category:** Fitness & Strength Training
- **Mobile:** The app is essential on mobile for real-time workout data input and tracking.
- **Story:** The app helps users maintain a record of their workout sessions and highlights any progression or regression in their performance in terms of progressive overload.
- **Market:** The app is targeted at weightlifters, bodybuilders, and fitness enthusiasts who are serious about strength training and improving their lifting capabilities.
- **Habit:** Users are encouraged to log their workouts consistently to see their progress and work toward their strength goals, fostering a daily workout habit.
- **Scope:** The initial version (V1) focuses on core features, including workout logging, progress tracking, and weekly comparisons. Future iterations may expand into advanced analytics, personalized recommendations, and social sharing capabilities.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- [x] UI displays current date and workout week
- [x] User can create workouts and exercises
- [x] User can view/delete their created workouts
- [] User can compare their current week's performance with the previous week.
- [] User can set specific goals for each exercise.
- [] User can visualize their progress through graphs and charts.

**Optional Nice-to-have Stories**

- [] User receives workout reminders.
- [] User can share their achievements and progress with friends or the fitness community.
- [] User can view visualized progression data in the form of weekly, monthly, and yearly graphs to asses PR progress.
- [] User can access a comprehensive library of weightlifting exercises with detailed instructions and videos.

### 2. Screen Archetypes

- Login
  - User can log in.
- Registration
  - User can create an account.
- Home
  - User can view their workout history.
  - User can compare current and previous week's performance.
- Workout Logging
  - User can input exercise data, such as sets/reps/weight for each workout session.
- Progress Visualization
  - User can view graphs and charts of their workout progress.
- User can set goals and access account settings.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

- Home
- Workout Logging
- Progress Visualization
- Profile

**Flow Navigation** (Screen to Screen)

- Login
  - Home
  - Registration
- Registration
  - Home
- Home
  - Workout Logging (By day)
  - Profile
- Workout Logging
  - Home
- Progress Visualization
  - Home
- Profile
  - Home

## Wireframes
-  <img src="https://i.imgur.com/uzeh57e.jpg" width=600>` 

### Progress for Unit 8 (Sprint 1)

    - Structs were created for each workout and user
    - A View Controller containing a TableView and TableViewCells was created to display individual workouts
    - The View Controller's navigation title was formatted to contain the current date. In the next code sprint, the title will be changed to reflect the current week.

### Progress for Unit 9 (Sprint 2)

    - In preparation for Demo Day, additional view/navigation controllers were added to enable workout creation and editing.
    - Two navigation controllers were implemented. One leads to a workout creation page which enables the user to name a workout and the corresponding day of the split (Day 1-7) and the other leads to the corresponding workout's exercises.
    - Within this exercise view controller, users can add new exercises to the selected workout. All exercises, like the workouts, are displayed via a table view.
    - When an exercise cell is tapped, another view controller appears. While unfinished, this next page is for users to enter their performance for each individual set or the selected exercise (such as weight lifted and reps performed). Each set will also be displayed in a table view.
    - Each view controller passes part of a "Workout"  struct (via a segue) that contains nested arrays of exercises and exercise performance. After editing workout data, a save function (that is implemented within the struct) is called to encode and save all edits to UserDefaults.  
    
## Video Demo

<div>
    <a href="https://www.loom.com/share/1f558fd9cb6d425cbf68597b9ccc7803">
    </a>
    <a href="https://www.loom.com/share/1f558fd9cb6d425cbf68597b9ccc7803">
      <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/1f558fd9cb6d425cbf68597b9ccc7803-with-play.gif">
    </a>
  </div>
