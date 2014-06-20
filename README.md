Consecutive
===========

A pretty basic implementation to help keep track of a users streak of days where he/she has launched your app. 

The component uses NSUserDefaults to keep track of the dates. It also makes use of NSDate+Helpers category used in the PMCalendar repo here: https://github.com/kovpas/PMCalendar which is MIT Licensed.

Install:

Copy TMConsecutiveDayHelper.h and TMConsecutiveDayHelper.m into your project as well as NSDate+Helpers.h and NSDate+Helpers.m. 

Place a call to:

        [TMConsecutiveDayHelper appLaunched];

In your App Delegate's application didFinishLaunchingWithOptions: method

Then to check on your users streak you can call:

    [TMConsecutiveDayHelper streakSizeInDays];

Or Alternatively call:

    [TMConsecutiveDayHelper hasComeBackForThisExactNumberOfDaysConsecutively:5]

which returns a BOOL

There's no logic as of yet to reset the streak but it could be added quite easily. basically you're responsible for what you want to do with the info and the class just keeps track of the streak itself.

Downsides:

Because the app uses NSUserDefaults it could be gamed pretty easily, by the user changing the date on their device. The component also uses ARC so if your project is using reference counting (ie retain release) then place the compiler flag ' -fobjc-arc ' inside the TMConsecutiveDayHelper.m row under the 'Compile Sources' located within the 'Build Phases' Tab for your App/Target settings.
