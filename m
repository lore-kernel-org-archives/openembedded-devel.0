Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1QzaGl-0002aS-Es; Fri, 02 Sep 2011 22:23:19 +0200
Received: from f053042120.adsl.alicedsl.de ([78.53.42.120]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1QzaCB-00065E-2n; Fri, 02 Sep 2011 20:18:35 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 02 Sep 2011 22:18:23 +0200
In-Reply-To: <1314982816.5939.616.camel@rex>
References: <1314962732.3526.32.camel@mattotaupa>
	<CAP9ODKpMU3yr==7+qyBvTyW3ikoSXtZqurKwsCn3Nn_54E0k7Q@mail.gmail.com>
	<1314969543.5939.586.camel@rex> <1314976910.3526.36.camel@mattotaupa>
	<1314982816.5939.616.camel@rex>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1314994704.3526.60.camel@mattotaupa>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Please merge lists openembedded-devel and openembedded-core again.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Sep 2011 20:23:19 -0000
X-Groupsio-MsgNum: 34029
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-jLQ9laKtEe+nmSZsKgom"

--=-jLQ9laKtEe+nmSZsKgom
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 02.09.2011, 18:00 +0100 schrieb Richard Purdie:
> On Fri, 2011-09-02 at 17:21 +0200, Paul Menzel wrote:
> > Am Freitag, den 02.09.2011, 14:19 +0100 schrieb Richard Purdie:
> > > On Fri, 2011-09-02 at 10:05 -0300, Otavio Salvador wrote:
> > > > On Fri, Sep 2, 2011 at 08:25, Paul Menzel wrote:
> >=20
> > > > > it would be great if we could join the lists oe-devel and oe-core=
 again.
> > > > > As far as I know the only reason the list oe-core was created was=
 to
> > > > > discuss the initial setup and the creation of oe-core. Now that i=
t has
> > > > > been setup I do not see any reason to have two separate lists.
> > > > >
> > > > > I suggest to abandon/archive openembedded-core and use
> > > > > openembedded-devel.
> > > >=20
> > > > I fully support this merge.
> > >=20
> > > I'm not so sure rushing into this is a great idea.
> >=20
> > I interpret your answer that the merge is planned. What is the right
> > time then?
>=20
> Not planned, it has been talked about, particularly by the TSC members.

Well, and what is the current position of the TSC members?

> > > Speaking as someone who has problems trying to figure out where
> > > patches are intended for
> >=20
> > Also now you have to decide to what list to send them to. Now you just
> > add a prefix/tag as is done on oe-devel already to differentiate betwee=
n
> > oe.dev and meta-oe.
>=20
> Well, its relatively simple to decide if an email is appropriate for
> oe-core or not.

I was just talking about patches and those can easily be prefixed.

> Sure we could start asking people to use tags/prefixes but I fail to see
> the advantage of putting more email in one place when a reasonable and
> logical separate exists which actively helps people.
>=20
> > > and who tracks whether they've been applied,
> >=20
> > Well, the list is not a patch tracker. The patch queue is [1].
>=20
> For various reasons its not how I track patches for OE-Core.

It is kind of hard for me to understand your point of view, when your
answers are that short. How do you track patches? Somebody sends it to
the list and you review and apply or pull it when it is good enough.
What would change when the lists merge?

> > > I do find the split useful...
> >=20
> > Hmm, could you please elaborate?
>=20
> We all try to find ways to make our workflows more efficient and to do
> the best job we can at the things we attempt. The mailing list
> separation actively helps me notice the most important things I need to
> deal with.

How do you notice it now? Just skimming the subject line I guess?

> Now yes, I could use mail filters, I could do a variety of
> things. Even with those I believe my response to various things would be
> adversely impacted if we do merge the lists as with the best will in the
> world, people sometimes don't do things like tags/prefixes/whatever and
> its easier for anyone new to OE to get confused.

In my opinion reading oe-devel and being on IRC anyone gets confused
right now because of all the different layers and so on. It would be a
lot easier for beginners if there was just one list.

And looking at the overview for lists in our Wiki [1], oe-devel is the
list for general discussions.

Skimming through the archive of oe-core [2][3] I have the impression
that mostly developers are sending patches to the list and that user
questions are more presented to oe-devel. Therefore in my opinion you
folks would benefit from merge too by seeing what the users actually
desire or what problems they hit.

As a wrote earlier already, I have the *impression* that you lost a lot
of former OE developers during the transition and all these different
places where discussions are going on is in my opinion one reason for
this.

I hope on Monday more folks will voice their opinion to get a better
expression.


Thanks,

Paul


[1] http://openembedded.org/index.php/Mailing_lists
[2] http://lists.linuxtogo.org/pipermail/openembedded-core/2011-September/t=
hread.html
[3] http://lists.linuxtogo.org/pipermail/openembedded-core/2011-August/thre=
ad.html

--=-jLQ9laKtEe+nmSZsKgom
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk5hOg8ACgkQPX1aK2wOHVg9sQCghF6jLGnZ1KcRUtrYFDydzVrn
t3AAnAzqqGNoilJDaCgi6m2JWABth06q
=v+c5
-----END PGP SIGNATURE-----

--=-jLQ9laKtEe+nmSZsKgom--
