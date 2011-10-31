Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1RKujd-0007kW-8S for openembedded-devel@lists.openembedded.org;
	Mon, 31 Oct 2011 17:29:17 +0100
Received: from f053038082.adsl.alicedsl.de ([78.53.38.82]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1RKudn-0001km-Br for openembedded-devel@lists.openembedded.org;
	Mon, 31 Oct 2011 16:23:15 +0000
Message-ID: <1320078181.3621.2.camel@mattotaupa>
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Oct 2011 17:23:01 +0100
In-Reply-To: <201110310955.28626.paul.eggleton@linux.intel.com>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
	<3bcd2fb9e853253747293c584109ab394ba3fd4e.1319884094.git.Martin.Jansa@gmail.com>
	<1319891607.3756.18.camel@mattotaupa>
	<201110310955.28626.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.0.3-2 
Mime-Version: 1.0
Subject: Re: [meta-efl][meta-oe 05/12] id3lib: Import from openembedded classic
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
X-List-Received-Date: Mon, 31 Oct 2011 16:29:17 -0000
X-Groupsio-MsgNum: 35118
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature"; 
	boundary="=-mzJn56k24+PmPtQBtBQo"

--=-mzJn56k24+PmPtQBtBQo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Montag, den 31.10.2011, 09:55 +0000 schrieb Paul Eggleton:
> On Saturday 29 October 2011 13:33:27 Paul Menzel wrote:
> > > +LIC_FILES_CHKSUM =3D "files://COPYING;md5=3D3bf50002aefd002f49e7bb85=
4063f7e7"=20
> > > +PR =3D "r0"
> >=20
> > According to Koen these are going away.
>=20
> Well, Koen might reject PR =3D "r0" in meta-oe, that's fine; however=20
> LIC_FILES_CHKSUM is mandatory or the recipe will not build, and I don't t=
hink=20
> that will be changing any time soon. I have considered if it would be=20
> desirable/possible to eliminate it for recipes that don't install any fil=
es=20
> (e.g. tasks), so far I haven't done any work on that. For normal recipes =
it is=20
> required however.

I meant =C2=BBthis is=C2=AB instead of =C2=BBthese are=C2=AB. (Or did I mea=
n these
occurrences of `PR`.)I am sorry for the confusion.


Thanks,

Paul

--=-mzJn56k24+PmPtQBtBQo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk6uy2UACgkQPX1aK2wOHVh5+gCfYJ5ItwiKkgogrUIVosmKYWpo
vCcAnA540dirXa5W5qvhA1DitAvMUGk9
=aP6i
-----END PGP SIGNATURE-----

--=-mzJn56k24+PmPtQBtBQo--
