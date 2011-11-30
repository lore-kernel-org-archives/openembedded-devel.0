Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RVpH2-0008Hf-D0 for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 19:52:52 +0100
Received: from f053042009.adsl.alicedsl.de ([78.53.42.9] helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RVpAh-0006Ul-UQ for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 18:46:20 +0000
Message-ID: <1322678765.22824.13.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2011 19:46:05 +0100
In-Reply-To: <4ED6507D.4090007@ts.fujitsu.com>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
	<4ED6507D.4090007@ts.fujitsu.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: Documentation problems
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
X-List-Received-Date: Wed, 30 Nov 2011 18:52:52 -0000
X-Groupsio-MsgNum: 35766
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-B55eNAu/gPsIKDwMNf1j"

--=-B55eNAu/gPsIKDwMNf1j
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Rainer,


thank you for sharing you view.


Am Mittwoch, den 30.11.2011, 16:49 +0100 schrieb Rainer Koenig:

> Am 27.11.2011 03:40, schrieb Tom Rini:

[=E2=80=A6]

> The things that make me amused is when I read comments like
>=20
> ----8<-snip------------
> And developers are not familiar with
> MediaWiki or most of the time hate it to not be able to use their
> favorite editor and to use a Web interface.
> ----8<-snip------------
>=20
> or
>=20
> ----8<-snip---------
> Just having to edit a text file in an editor and
> commit this change is easier than working with a Web browser.
> ----8<-snip---------
>=20
> Seriously guys, if you are a developer and you are able to understand=20
> the structure in OE and what bitbake does, then you should be able to=20
> understand the Wikimedia engine as well.

=C2=BBfamiliar=C2=AB does not mean that they are not able to understand it.

> And if you want to avoid a web-editor then copy/paste the stuff to
> your favorite editor and do it there. Complaining about the tool you
> need to use sounds like a lame excuse for an software engineer.
>=20
> Of course, the Wikimedia engine offers advanced methods like categories=
=20
> to tag stuff but even that can be learned in short time. So I really=20
> doubt that the reason for not documenting is the Mediawiki engine.

Unfortunately of lot of the responds miss the point. Instead of finding
the reason why the reason for documentation is lacking it is discussed
instead of WikiMedia is feasible or not although it has been there for a
long time and it looks like it has failed. The point that documentation
making has to be as easy as possible is agreed on by everyone.

So please let us be constructive and share your comments in the sub
thread =C2=BBRe: [oe] [RFC] Documentation problems and future plans=C2=AB.

> The other problem that I see when trying to contribute: This morning I=
=20
> registered my account "rakoenig". Now, 7 hours later I'm still not able=
=20
> to edit anything and I have no idea how the process looks like to get=20
> write privileges. On the other hand, when I was doing the same in the=20
> Yocto wiki I was instantly able to write pages there.

Tom King seems to have to acknowledge each registration. Please contact
him about this.

> Now for the bugtracking thing. Yes, I think, that bugtracking is part of=
=20
> a project documentation and I would like to be able to find a bug and=20
> see a status. When you handle bugs on a mailing list I'm forced to use=
=20
> to search the archives for that bug and then I might find a thread that=
=20
> then has a lose end like
>=20
> --8<-snip------
> Will look again tomorrow. Go to bed.
> --8<-snip------
>=20
> That was the latest info on a bug when building samba and so far nobody=
=20
> knows if this bug is solved or not.

If you hit the problem probably it has not been solved. Also you can
search the commit log (`git log`) easily for changes in the Samba
recipes.

> The funny thing is that when I first asked why you changed bug tracking=
=20
> to do it with a mailing list I was adivsed do search in the archives for=
=20
> that discussion. Searching the archives revealed that a lot of bugs hit=
=20
> Bugzilla and nobody took care of them.

As Koen wrote. It was not used anymore and probably a bad thing to not
shut down the Bugzilla instance immediately.

> So, from my external point of view the decision was "Bugzilla is
> actually a mess, so lets try something else like the mailing list for
> bugtracking".

See Koen=E2=80=99s response.

The actual question is still how the developers feel. And as far as I
know nobody has missed it. It looks like an email interface is a
requisite for most of them.

> And hey, here we go... this thread is here because the wiki is out of=20
> date and we need to do...what? Switching to a new tool to confuse even=
=20
> more users? Or get the things done that need to be done?

See above and the whole thread. And suggestions on how to get things
done are very welcome.

> Just look at Yocto. From my point of view it looks much smarter because
> they have a bugtracker and post even statistics of their bugs which=20
> gives me the impression that their concern is improving qualitiy of=20
> their recipes.
>=20
> They have a good documentation that seems to get updated frequently,=20
> makes a good impression.
>=20
> They seem to have a roadmap for the future and do planned work.
>=20
> Compared to this OE (core) seems like a bunch of developers working on=
=20
> the bleeding edge of embedded Linux and don't document much because=20
> *they* understand what they are doing. Unfortunately a lot of (new)=20
> users don't understand it and would urgently need a good documentation.

One difference is that Yocto is backed by corporations paying folks for
documentation. And actually OE-core and Yocto should be pretty much
aligned.=20

> Sorry for the maybe harsh words, but I really want to show you how OE=20
> looks to somebody approaching it. And of course I would like to help=20
> improving the docs, but for that OE needs a clear documentation policy=
=20
> and a process how to do and enforce that.

I thought that was this topic of this thread the whole time. I have to
agree that it diverged into a different direction than I hoped for.


Thanks,

Paul

--=-B55eNAu/gPsIKDwMNf1j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7Wee0ACgkQPX1aK2wOHVjfCACdFwKrLgk1K1JYwe8/WJNY4fPh
TrMAn03JQifrC3jtBXbr5ztLr+FsWBPe
=LlCi
-----END PGP SIGNATURE-----

--=-B55eNAu/gPsIKDwMNf1j--
