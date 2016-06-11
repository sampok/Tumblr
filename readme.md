## Tumblr

The purpose of this homework is to leverage animations and gestures to create custom navigation. We're going to use the techniques from this week to implement some interactions in Tumblr.

Time spent: `5`

### Features

#### Required

- [X] Tapping on Home, Search, Account, or Trending should show the respective screen and highlight the tab bar button.
- [X] Compose button should modally present the compose screen.

#### Optional

- [X] Compose screen is faded in while the buttons animate in.
- [X] Login button should animate the login form over the view controller.
- [X] Discover bubble should bob up and down unless the SearchViewController is tapped.

#### The following **additional** features are implemented:

- [X] "Rays" around home image rotate
- [X] Discover bubble animtes in and out with a 3D effect

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Assets were a bit mixed up: Search view twice and no Activity view
2. -

### Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='tumblr.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

* Why doesn't my "rays" animation not work when you return to Home tab? ViewDidAppear and animateWithDuration get called, but it doesn't animate.