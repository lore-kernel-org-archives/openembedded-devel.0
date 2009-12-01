Received: from hapkido.dreamhost.com ([66.33.216.122] ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1NFO4J-0003kH-Vf
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Dec 2009 09:26:47 +0100
Received: from homiemail-a22.g.dreamhost.com (caiajhbdccah.dreamhost.com
	[208.97.132.207])
	by hapkido.dreamhost.com (Postfix) with ESMTP id 223D217B3EB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2009 00:25:10 -0800 (PST)
Received: from [192.168.1.154] (unknown [195.190.181.110])
	by homiemail-a22.g.dreamhost.com (Postfix) with ESMTPA id 930BE1A8061
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Dec 2009 00:25:07 -0800 (PST)
Message-ID: <4B14D2E1.6050506@SSpaeth.de>
Date: Tue, 01 Dec 2009 09:25:05 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B14BAD9.2060402@fqingenieria.es>
	<20091201072521.GA11505@denix.org>
In-Reply-To: <20091201072521.GA11505@denix.org>
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 66.33.216.122
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Recipes relation tree
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
X-List-Received-Date: Tue, 01 Dec 2009 08:26:47 -0000
X-Groupsio-MsgNum: 14753
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigE15DE67527D46C4A726F70BB"

--------------enigE15DE67527D46C4A726F70BB
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Denys Dmytriyenko wrote:
> Have you looked at -g option of bitbake?
>=20
>   -g, --graphviz        emit the dependency trees of the specified pack=
ages in
>                         the dot syntax

A related question. This generates depends.dot just fine, but I found a
reference to rdepends.dot in some manual. I would be very much
interested in an RDEPENDS tree, is there a way to get this?

spaetz


--------------enigE15DE67527D46C4A726F70BB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAksU0uIACgkQVYX1jMgnoGK0xgCgh9kOjkyytqNgkE/UG9fGegME
tWkAn3B9e6qKk67J+Py/dYcOtic6OshI
=eO00
-----END PGP SIGNATURE-----

--------------enigE15DE67527D46C4A726F70BB--
