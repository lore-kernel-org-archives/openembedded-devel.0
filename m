Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYRNe-0000DA-KT for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 22:49:29 +0100
Received: from g225141051.adsl.alicedsl.de ([92.225.141.51]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NYRLS-0004UO-Mf for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 21:47:10 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <6C2434209962DC46B88345CA85C334A28596C7F9D3@Courier.syntech.org>
References: <6C2434209962DC46B88345CA85C334A28596C7F9D3@Courier.syntech.org>
Date: Fri, 22 Jan 2010 22:47:08 +0100
Message-ID: <1264196828.26541.14.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Difficulties building java
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
X-List-Received-Date: Fri, 22 Jan 2010 21:49:29 -0000
X-Groupsio-MsgNum: 16043
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-bcXD2ksUH0uJrfwXsjMN"

--=-bcXD2ksUH0uJrfwXsjMN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Mark,


Am Freitag, den 22.01.2010, 15:37 -0500 schrieb Mark Butsch:

[=E2=80=A6]

> The error I am stuck at currently is:
>=20
> ERROR: Build of /home/oe/openembedded/recipes/classpath/classpath_0.98.bb=
 do_configure failed
>=20
> >From the log.do_configure file:
>=20
> checking if ecj -warn:-deprecation,serial,unusedImport works... yes
> checking if java works... configure: error: The Java compiler ecj -warn:-=
deprecation,serial,unusedIm
> port failed (see config.log, check the CLASSPATH?)
> FATAL: oe_runconf failed

I have no idea, but can find this mentioned `config.log` and look if
anything interesting is in there?


Thanks,

Paul

--=-bcXD2ksUH0uJrfwXsjMN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktaHNwACgkQPX1aK2wOHVjDNwCaAqQAa9UbVhGKAZ6qN/OByriv
Ow8An2eD4OPKB0+dAS/SucJbthcuX7gE
=dlab
-----END PGP SIGNATURE-----

--=-bcXD2ksUH0uJrfwXsjMN--
