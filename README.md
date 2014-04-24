**SKActivityStatusBar - iOS Control**

SKActivityStatusBar is an iOS Control that displays an activity wheel and a status text replaying the default iOS Status Bar which gives the user instant access to whats happening in the background.

**How to use in your project**

1. Include the SKActivityStatusBar.h and SKActivityStatusBar.m. 
2. Create an SKActivityStatusBar Object.

    `   SKActivityStatusBar *activityStatusBar;`

    `     activityStatusBar = [SKActivityStatusBar sharedActivityStatusBar];`

3. Show ActivityStatus Bar when needed using the below method.
   You can specify the status to be displayed in text.

   `        [activityStatusBar showActivityStatusBarWithStatus:<Status String>];
   `

4. Hide ActivityStatus Bar using the below method.

   `    [activityStatusBar hideActivityStatusBar];
   `

**How it appears on iPad and iPhone**

![On Devices](https://raw.githubusercontent.com/KarthikS29/SKActivityStatusBar/master/SKActivityStatusBar.png)

**Limitations**

* Works only for Portrait Mode. (Landscape Mode will be supported in next version)
* No Dynamic change of status text.

***

**Lincense**

Open Source MIT - http://opensource.org/licenses/MIT

The MIT License (MIT)

Copyright (c) 2014 Karthik Sankar

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

***

**Contact Me**

Suggestions are welcome

skarthikdev@gmail.com

