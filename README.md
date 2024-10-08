# Theme Maker for Print(Notes) app

[![GitHub](https://img.shields.io/github/license/RoBoT095/printnotes_theme_maker)](https://github.com/RoBoT095/printnotes_theme_maker/blob/main/LICENSE)

Make themes from this webpage and import string into the [Print(Notes)](https://github.com/RoBoT095/printnotes) app for your own custom look!

**Note**: Still need to add feature to the app itself.

<details open>
<summary>Images</summary>

<p>
    <img src="https://github.com/RoBoT095/printnotes_theme_maker/blob/main/images/Desktop-img1.png?raw=true" alt="desktop-img1" width=400 />
    <img src="https://github.com/RoBoT095/printnotes_theme_maker/blob/main/images/Desktop-img2.png?raw=true" alt="desktop-img2" width=400 />
    <img src="https://github.com/RoBoT095/printnotes_theme_maker/blob/main/images/Desktop-img3.png?raw=true" alt="desktop-img3" width=310 />
    <img src="https://github.com/RoBoT095/printnotes_theme_maker/blob/main/images/Mobile-img1.png?raw=true" alt="mobile-img1" width=200 />
    <img src="https://github.com/RoBoT095/printnotes_theme_maker/blob/main/images/Mobile-img2.png?raw=true" alt="mobile-img2" width=200 />
</p>

</details>

## How to run a flutter website using Node.js

**You need [flutter](https://flutter.dev) and [node.js](https://nodejs.org/) installed to run this.**

---

1. After building the website with `flutter build web`, lets move to a new folder, so it's easier to work in, lets call it `theme-maker-website`
2. Inside your new folder create another folder called `public-flutter`, this is where you will paste the flutter website you just built which you can find in "_printnotes_theme_maker/build/web/_"
3. While still in `theme-maker-website` open a terminal and run `npm init -y` to initialize node project
4. Website will be run with express, so now run `npm install express` to install it
5. Now we create a file which will run our website, lets call it `app.js` (you can create by running `touch app.js` from terminal)
6. As a start, paste this into app.js:

```js
const express = require("express");
const path = require("path");
const app = express();
const port = 8000;

app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use(express.static(path.join(__dirname, "public-flutter")));

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
```

7. Now you can run `node app.js` to start the app, if you haven't changed port, website can be viewed from <a href='http://localhost:8000'>http://localhost:8000</a>
