Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RUQPs-0005Ic-Aj for openembedded-devel@lists.openembedded.org;
	Sat, 26 Nov 2011 23:08:13 +0100
Received: from f053032217.adsl.alicedsl.de ([78.53.32.217]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RUQJi-0003vF-Rz for openembedded-devel@lists.openembedded.org;
	Sat, 26 Nov 2011 22:01:51 +0000
Message-ID: <1322344896.16303.49.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Nov 2011 23:01:36 +0100
In-Reply-To: <CA+M6bXnGhgrzZSuOe99ViWU=eZ5+Q+exWqWkstFJM-MCYzc6zQ@mail.gmail.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org>
	<ED3E0BCACD909541BA94A34C4A164D4C401A0AC7@post.tritech.se>
	<0C757E680E33864AB113392C7E83F910BE5242@GSX300A.mxchg.m.corp>
	<CAP9ODKrviqf=GN12Y6OKE0ajsG7v+fFWnWDHp=K1-YFzvQi-pA@mail.gmail.com>
	<1322134409.3391.21.camel@mattotaupa>
	<CAP9ODKrKN3m_V09j6+C1dL9P8yHtuck4P5jcdKv4Ua=mrP1E=Q@mail.gmail.com>
	<jalvr1$3bl$1@dough.gmane.org>
	<CAFU7RzM5-VAbs2-5qR-D6eo5+LsVQc+e3rGK6zZ5NvviSvUWig@mail.gmail.com>
	<CACW_hTY9ybnax9xHb1KV4Y25J3nNRkQqCs=TqUivcBcYOT7BkA@mail.gmail.com>
	<CA+M6bXkjViAHc6ADH+vyvikeOaLa1+V1uCX6S=d75Z18Z2oj8w@mail.gmail.com>
	<4ED0C603.9020900@telia.com>
	<CA+M6bXmsbDoFS_8etRA+RYqkP7b0x8t998Tcmn9KyKhAbEP2ew@mail.gmail.com>
	<CACW_hTZ6tkRGj938SAg4xmENwe-qRZMGpE=8-KvexQydgD-m_w@mail.gmail.com>
	<CA+M6bXnGhgrzZSuOe99ViWU=eZ5+Q+exWqWkstFJM-MCYzc6zQ@mail.gmail.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Sat, 26 Nov 2011 22:08:13 -0000
X-Groupsio-MsgNum: 35631
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-zUeU1GyWgc5CThDtax95"

--=-zUeU1GyWgc5CThDtax95
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Samstag, den 26.11.2011, 14:36 -0700 schrieb Tom Rini:
> On Sat, Nov 26, 2011 at 8:49 AM, Frans Meulenbroeks wrote:
> > 2011/11/26 Tom Rini
> >
> >> On Sat, Nov 26, 2011 at 3:57 AM, Ulf Samuelsson wrote:
> >> > On 2011-11-25 23:04, Tom Rini wrote:
> >> >>
> >> >> On Fri, Nov 25, 2011 at 12:31 AM, Frans Meulenbroeks wrote:
> >> >>
> >> >>> After all, isn't one of the purposes of OE to promote information
> >> >>> sharing,
> >> >>> cooperation and the use of openembedded technology (and not make t=
hings
> >> >>> harder).
> >> >>
> >> >> One of the points of making master read-only would be to ensure tha=
t
> >> >> changes aren't lost.
> >> >>
> >> >> Perhaps the transition needs to be:
> >> >> - master is as it is today
> >> >> - master becomes oe-core backport || master-only bugfixes only
> >> >> - master becomes read only.
> >> >>
> >> >> And we go from the first step to the second step sometime sooner
> >> >> rather than later.  The top of my head date would be before the
> >> >> paid-developers go on end of year breaks to try and make sure all t=
he
> >> >> hobbyist folks start their hacking with oe-core+etc rather than mas=
ter
> >> >> and risk getting caught later.  I'm open to arguments on why that's
> >> >> exactly backwards...
> >> >>
> >> >
> >> > Won't it be a problem for existing projects, if you cannot add fixes=
 to
> >> cope
> >> > with new host OS versions.
> >> >
> >> > At the moment, openembedded-classic does not build properly with Ubu=
ntu
> >> > 11.10 .
> >>
> >> Won't what be a problem?  Either oe-core+meta-oe+etc fails on 11.10
> >> (so, fix it there first then backport changes) or it's fine and you
> >> can either find the relevant changes there and move them or it's a
> >> oe.dev-only bug and just needs to be fixed, under my proposal (until
> >> we reach the point where everyone is OK calling it r/o).
> >>
> >> And part of this is to say that yes, existing projects external to
> >> oe.dev need to move to oe-core(+meta-oe+whatever else) (where layers
> >> should be making their life easier or again, there's problems we're
> >> unaware of and need to be made aware of) or explain why they can't
> >> ever move (and are forking the project?).
> >
> > See the message on NIOS that I just posted.
>=20
> Addressed there :)
>=20
> > Also I am not opposed to making oe classic master the place where patch=
es
> > may land before they end up in the maintenance thread, but I am strongl=
y
> > opposed to making OE classic read only on short notice (which as sugges=
ted
> > by Koen earlier).
>=20
> I believe master needs to go read-only, or at least
> backport||master-only-problems bugfix only, sooner rather than later.
>=20
> The arguments seem to be:
> - Some people or projects use master and can't move
> * So don't move, but do expect to need to either migrate to
> 2011.03-maintenance or carry more fixes locally.

This is still not understandable. I understand that you want developers
to move to OE-core and meta-oe. But trying to force people by making
master read-only is the wrong way. It just arbitrarily puts a burden on
current users. You can advertise prominently that OE-core and meta-oe
should be used. Over the time people will move and a lot of people have
expressed their willingness to move in the future.

> With my
> 2011.03-maintenance hat on, if someone says for my project to move I
> need N patches moved from master to maintenance, I'm fine reviewing
> that pull request.

I thought that was always possible in the past.

> - There's concern that $something won't be able to work with oe-core+meta=
-oe+etc
> * These are problems that either need to be fixed or assumptions that
> aren't correct.
>=20
> - Lack of recipes in meta-oe
> * The recipes people need have been moved, stuff that isn't can be
> when someone needs it.  id3lib was mentioned as an example of why
> there might be problems getting things moved to meta-oe.  I can't help
> but notice it's also been moved into meta-oe.

As Bernhard noted in this reply. OE-Core and meta-oe seriously lack
documentation. And if it is just that our Wiki currently is still based
on OE-classic. And in my experience not a lot of people put effort
behind it and just neglect it.

(New users will search for tutorials and help on the WWW and there
currently a lot is dealing with OE-classic.)


Thanks,

Paul

--=-zUeU1GyWgc5CThDtax95
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7RYcAACgkQPX1aK2wOHVh8+ACgiPpg7mSivF84T4Mi+qngxf9Z
8EwAn3/yhwn4c4N9lcDBDhxrDUlPTaeT
=3NUM
-----END PGP SIGNATURE-----

--=-zUeU1GyWgc5CThDtax95--
