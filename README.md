# Project 3 - *Parsetagram*

**Parsetagram** 

Time spent: ** ~ +20 ** hours spent in total

## User Stories

The following **required** functionality is complete:

- [X] User can sign up to create a new account using Parse authentication
- [X] User can log in and log out of his or her account
- [X] The current signed in user is persisted across app restarts
- [X] User can take a photo, add a caption, and post it to "Instagram"
- [X] User can view the last 20 posts submitted to "Instagram"
- [X] User can pull to refresh the last 20 posts submitted to "Instagram"
- [X] User can load more posts once he or she reaches the bottom of the feed using infinite scrolling.
- [X] User can tap a post to view post details, including timestamp and caption.
- [X] User can use a tab bar to switch between all "Instagram" posts and posts published only by the user.


The following **optional** features are implemented:

- [X] Show the username and creation time for each post 
- [X] After the user submits a new post, show a progress HUD while the post is being uploaded to Parse
- [ ] User Profiles
- [ ] User can comment on a post and see all comments for each post in the post details screen.
- [ ] User can like a post and see number of likes for each post in the post details screen.
- [ ] Run your app on your phone and use the camera to take the photo

The following **additional** features are implemented:

- [X] Made passwords be secured (turn into dots)
- [X] Added sign up screen up to create new username 

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. Best ways to implement collection views
2. How to costumize UI elements on the different controllers to be pleasing for the user

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<blockquote class="imgur-embed-pub" lang="en" data-id="DsrBF0M"><a href="//imgur.com/DsrBF0M">View post on imgur.com</a></blockquote><script async src="//s.imgur.com/min/embed.js" charset="utf-8"></script>
<img src='http://imgur.com/DsrBF0M.gif' width='50' alt='Video Walkthrough' />
[img]http://i.imgur.com/DsrBF0M.gif[/img]

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

1. implementing the infinite scroll.
2. Fetching data from the Parse Server correctly and manipulating it in the desired ways.

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

1. parsetagram logo:https://www.graphicsprings.com/start-your-logo
2. login screen image:https://artinstantanea.files.wordpress.com/2014/07/image-axd.jpg
3. feed logo: http://iconmonstr.com/rss-feed-4/?png
4. profile logo: http://iconmonstr.com/user-29/?png
5. upload logo: http://iconmonstr.com/photo-camera-8/?png
6. persist login code done in appDelegate: http://stackoverflow.com/questions/30592521/opening-view-controller-from-app-delegate-using-swift
7. upload image button: http://iconmonstr.com/photo-camera-9/?png
8. preview image: https://www.google.com/#q=swift+choose+image+to+upload

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library
- [Parse]
- [ParseUI]
- [MBProgressHUD]
- [PhotoUI]

## License

Copyright [yyyy] [name of copyright owner]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
