Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1Kqp6M-0002hk-Uq
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Oct 2008 15:10:47 +0200
Received: (qmail invoked by alias); 17 Oct 2008 13:10:40 -0000
Received: from p579E1958.dip.t-dialin.net (EHLO [192.168.10.3]) [87.158.25.88]
	by mail.gmx.net (mp018) with SMTP; 17 Oct 2008 15:10:40 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18xX40j7+Axg+r1zGCsqBEHKrWsn2wL/tDlR01Lxf
	OmEQVHPnjEJVim
Message-ID: <48F88ECE.9010905@gmx.net>
Date: Fri, 17 Oct 2008 15:10:38 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Thunderbird 2.0.0.17 (X11/20080925)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <48F743EF.90401@gmx.net> <gd7gn3$esa$1@ger.gmane.org>
In-Reply-To: <gd7gn3$esa$1@ger.gmane.org>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.67
Subject: Re: RFC: add BPN/BP to minimize boilerplate code for *-native (and similar) variants
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
X-List-Received-Date: Fri, 17 Oct 2008 13:10:48 -0000
X-Groupsio-MsgNum: 6264
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig53AC8C48CDC40AB61B8C293A"

--------------enig53AC8C48CDC40AB61B8C293A
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Koen Kooi schrieb:
On 16-10-2008 15:38, Robert Schuster wrote:
>> Hi,
>> please have a look at this bugzilla entry and the proposed patch:
>>
>> http://bugs.openembedded.net/show_bug.cgi?id=3D4735
>=20
> Looks like it would save me from some repetetive monkey work :)
thats is what it was meant for. :)

If no one objects I would like to commit this in say a week.

Existing recipes are not affected since BPN =3D=3D PN when the package na=
me
does not have one of the known suffixes and according to grep and find,
no recipe in the repo uses a variable named BP or BPN yet.

Regards
Robert


--------------enig53AC8C48CDC40AB61B8C293A
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFI+I7PG9cfwmwwEtoRAlG2AJ0WNa6CgUYyahvKrXS1DgplN6FgdQCgjt9b
PNCigrXpsMcrEu2Vuh4hwFc=
=Ko4o
-----END PGP SIGNATURE-----

--------------enig53AC8C48CDC40AB61B8C293A--
