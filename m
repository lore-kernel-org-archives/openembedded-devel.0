Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q9Y7n-0006IC-Nn for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2011 09:35:12 +0200
Received: from f053043024.adsl.alicedsl.de ([78.53.43.24]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q9Y5t-0001tA-DB for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2011 07:33:01 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <BANLkTimGgmPt2sp69FmDZutgOZoEqwsQzA@mail.gmail.com>
References: <4DA392CC.4010401@balister.org>
	<BANLkTimGgmPt2sp69FmDZutgOZoEqwsQzA@mail.gmail.com>
Date: Tue, 12 Apr 2011 09:32:46 +0200
Message-ID: <1302593566.4323.10.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: Upstreaming patches
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
X-List-Received-Date: Tue, 12 Apr 2011 07:35:54 -0000
X-Groupsio-MsgNum: 31123
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-QhBRNMcE3TAf9CPQCHLa"

--=-QhBRNMcE3TAf9CPQCHLa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 12.04.2011, 09:29 +0930 schrieb Graham Gower:
> On 12 April 2011 09:16, Philip Balister <philip@balister.org> wrote:
> > Saul Wold asked me about upstreaming some of the patches in OE. Apparen=
tly,
> > Intel has some people who can look at submitting some of our patches
> > upstream.

That is great. It is indeed very time consuming to find out the correct
place to send patches and register at the ticketing/bug tracking system
or =E2=80=93 most of the time =E2=80=93 subscribe to the corresponding mail=
ing list.

> > The question is, what do we do about attribution? The problem is that i=
s not
> > simple for many cases working out who created the patch. Rather than sp=
end
> > time chasing through the revision history, it would be simpler to send =
the
> > patches upstream mentioning the source as derived from OE.
> >
> > My thoughts are no reasonable OE contributor would object to someone el=
se
> > upstreaming their patches :), but I thought I should ask people what th=
ey
> > thought.
> >
> > Obviously, if there is a complex patch the situation is different, but =
I
> > suspect most of the easy patches do not fall into this category.
> >
> > Comments?

> Sounds good. I think omission of attribution if no original author can
> be identified is fine. Its more important that the work not be lost.

In my opinion at least a

        git log --follow recipe/path/to/patch/file.patch

should be tried. Additionally to make things maybe easier it could be
searched for patches with a patch header [1] and track their status.

> Please note that many patches submitted upstream have already been
> ignored by upstream.

Hopefully those patches have a patch header and the report can be
updated easily.


Thanks,

Paul


[1] http://openembedded.org/index.php/Push_patches_upstream

--=-QhBRNMcE3TAf9CPQCHLa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2kABcACgkQPX1aK2wOHVh7SwCeKD1pNsOc4LDBM2dbEEBnhBCw
C/EAn3b9FCrcZ3u0ojbQD17oSvx4Gidu
=tYBL
-----END PGP SIGNATURE-----

--=-QhBRNMcE3TAf9CPQCHLa--
