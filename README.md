This project was made open source on 11 November 2014.

This version of tripl.it uses meteor. The reason for that is the out of the box offline database, synchronization and conflict resolution.

# Install

You need to install meteor first

```
$ curl https://install.meteor.com/ | sh
```

Running the application should be enough now

```
$ meteor
```

# Page transitions

I'm going to extract this code into a package.
For now it's called Mime and allows for page transitions.

To use Mime you need to initialie it with the pages container, as an example

```
Template.layout.rendered = ->
  Mime.initialize(@find('#content-container'))
```

To change the animation you need to call the animate method

```
Mime.animate('slideRight')
```

Using iron:router you can use IronMime.go instead of Router.go and send the animation as an option

```
IronMime.go('trips.show', { _id: @id }, { animation: 'slideDown' })
```

# TODO

* Page transitions.
* Add/remove expenses animation.
* Push notifications.
