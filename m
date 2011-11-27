Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RUkAE-0000NW-PI for openembedded-devel@lists.openembedded.org;
	Sun, 27 Nov 2011 20:13:22 +0100
Received: from f053040091.adsl.alicedsl.de ([78.53.40.91]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RUk47-0001L6-Az for openembedded-devel@lists.openembedded.org;
	Sun, 27 Nov 2011 19:07:03 +0000
Message-ID: <1322420806.7998.50.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Nov 2011 20:06:46 +0100
In-Reply-To: <1414964.lPpRFmgCOe@helios>
References: <CA+M6bX=PYZ+2vb32ZmT3SirqHdKpCtD90QqtHhQiWSp38f1kVA@mail.gmail.com>
	<15202278.8Gdc2a6et6@helios> <1322419119.7998.43.camel@mattotaupa>
	<1414964.lPpRFmgCOe@helios>
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
X-List-Received-Date: Sun, 27 Nov 2011 19:13:22 -0000
X-Groupsio-MsgNum: 35657
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-onYKdvhYreTsF+W3bxld"

--=-onYKdvhYreTsF+W3bxld
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 27.11.2011, 18:56 +0000 schrieb Paul Eggleton:
> On Sunday 27 November 2011 19:38:39 Paul Menzel wrote:
> > Only Koen brought up the idea of the pull model. By itself, ikiwiki als=
o
> > allows Web edits [1].
>=20
> Yes but what benefit do we get by changing the system? Only that the back=
end=20
> changes to git? Given that MediaWiki is familiar to many (thanks to Wikip=
edia)=20
> I would be hesitant to replace it with anything less widely understood.

Everything is in one place. And developers are not familiar with
MediaWiki or most of the time hate it to not be able to use their
favorite editor and to use a Web interface.

Maybe a survey should be held. It is work in the beginning but would pay
back in the end since this infrastructure should be used for a while. Or
we just try it out.

> > Additionally, you have not addressed the point that reality shows, that
> > not a lot of people write documentation and use it. The best way to
> > =E2=80=9Cenforce=E2=80=9D this is to add documentation with the corresp=
onding change.
>=20
> I'm not sure I understand what you mean here. If you're suggesting that w=
e=20
> will be able to force people to write changes for the documentation toget=
her=20
> with their changes to the code, I think there are two problems with this:=
=20
>   (1) it assumes that we already have complete documentation for the curr=
ent=20
> state of the code;

Then people could update that part in one go or should at least add a
TODO somewhere.

>   (2) given that writing meaningful commit messages is a challenge for ma=
ny=20
> contributors, you're going to have a very difficult time getting people t=
o write=20
> documentation for their changes as well.

That is our choice to make. Either we want good documentation. Then we
have to make this a requirement and contributors have to deal with that
but will get help from the list too. Or we do not enforce this and
probably the documentation will be lacking.


Thanks,

Paul

--=-onYKdvhYreTsF+W3bxld
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk7SikYACgkQPX1aK2wOHVhFRQCfe8v+mY06hpqaNcYfsTCuBc/7
TwMAn0FdHSh6jPkOt/v+Zs9zxY4rdMt1
=jC2S
-----END PGP SIGNATURE-----

--=-onYKdvhYreTsF+W3bxld--
