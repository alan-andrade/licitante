# Licitante

This is a web application that fetches requests for bids from the
Mexican Federal Government sites and translates it into a customizable
feeds. (i.e. Some sort of tweetdeck)

The main feature consists of letting the user filter the requests, add
alerts add bring a better usability experience.

Right now we're focused only on [CompraNet][
https://compranet.funcionpublica.gob.mx/]


## Challenge

Compranet doesn't have any public API, so we need to crawl the web site
in order to get the records.

The site has record sorting features which uses forms that are triggered
by some JS code. This brings more difficulty to the table, but not
imposible.

The links href of any <a> is built on the fly using a JS function. So
the real href is not in the element, we need to sneek into the onClick
attributes and build the link ourselves.


The site sets cookies in order to keep track of the session, so the
first query will return a 401 along with Set-Cookie headers.


## First stage

Develop an adapter that transparently fetches records.

i.e.

  Compranet.find 12345

  # => CompranetRecord (title: '5tons Bus', id: 12345)....


  Compranet.find(:all)

  # => [ CompranetRecord, ... ]


  Compranet.find(:all).sort("Adquisiciones")

  # => [ CR(type: 'adquisiciones'),...]


## Contributing

* Clone repo
* Submit your pull request

No hard requirements at the moment.
