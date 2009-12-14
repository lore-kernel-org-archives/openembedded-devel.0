Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NKGNw-000134-UB for openembedded-devel@lists.openembedded.org;
	Mon, 14 Dec 2009 20:15:12 +0100
Received: from g225083029.adsl.alicedsl.de ([92.225.83.29]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NKGMH-0006H4-IH for openembedded-devel@lists.openembedded.org;
	Mon, 14 Dec 2009 19:13:25 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1260719131.3110.26.camel@mattotaupa.wohnung.familie-menzel.net>
References: <1260618520.3373.23.camel@mattotaupa.wohnung.familie-menzel.net>
	<20091212173311.GA3730@rhein.zuhause.netz>
	<1260711980.3110.21.camel@mattotaupa.wohnung.familie-menzel.net>
	<20091213141849.GG17995@ibawizard.net>
	<1260719131.3110.26.camel@mattotaupa.wohnung.familie-menzel.net>
Date: Mon, 14 Dec 2009 20:13:32 +0100
Message-ID: <1260818012.9310.9.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: package VDR for OE
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
X-List-Received-Date: Mon, 14 Dec 2009 19:15:12 -0000
X-Groupsio-MsgNum: 15059
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-wnBh9867+XAW/xJbUZNC"

--=-wnBh9867+XAW/xJbUZNC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 13.12.2009, 16:45 +0100 schrieb Paul Menzel:
> Am Sonntag, den 13.12.2009, 15:18 +0100 schrieb Petr =C5=A0tetiar:
> > Paul Menzel <paulepanter@users.sourceforge.net> [2009-12-13 14:46:20]:

[=E2=80=A6]

> > > Furthermore is there a better way for upstream to set things up so th=
at
> > > no patching is needed? Or is autotools needed for this?
>=20
> I am still asking if upstream could change something to make the
> Makefile cross compilable by default.

[=E2=80=A6]

Could someone advise me on how to get VDR included officially into OE?
Had someone time already to test the recipe?

Something does not seem right yet.=20

        [=E2=80=A6]
        NOTE: Running task 810 of 831 (ID: 230, /srv/oe/openembedded/recipe=
s/vdr/vdr_1.7.10.bb, do_package)
        cp: cannot stat `/srv/oe/angstrom-dev/work/armv7a-angstrom-linux-gn=
ueabi/vdr-1.7.10-r0/image/*': No such file or directory
        NOTE: Running task 811 of 831 (ID: 235, /srv/oe/openembedded/recipe=
s/vdr/vdr_1.7.10.bb, do_package_write_ipk)
        NOTE: Running task 812 of 831 (ID: 228, /srv/oe/openembedded/recipe=
s/vdr/vdr_1.7.10.bb, do_qa_staging)
        NOTE: Running task 813 of 831 (ID: 6, /srv/oe/openembedded/recipes/=
softdevice/vdr-softdevice_0.5.0.bb, do_configure)
        Packaged contents of vdr-dbg into /srv/oe/angstrom-dev/deploy/glibc=
/ipk/armv7a/vdr-dbg_1.7.10-r0.5_armv7a.ipk
        NOTE: Not creating empty archive for vdr-1.7.10-r0.5
        NOTE: Not creating empty archive for vdr-doc-1.7.10-r0.5
        [=E2=80=A6]

I cannot find `vdr-1.7.10-r0.5_armv7a.ipk` which is probably related to
the above information. I find it strange because there are no other
errors beforehand. Could someone point out the error to me?


Thanks,

Paul

--=-wnBh9867+XAW/xJbUZNC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAksmjlsACgkQPX1aK2wOHVjAXwCePDQzSLr9RIKyDfwQykBgvz0n
fS0An3FRF7q44m9ZklcAzgBvGM0o9Vm/
=CYpU
-----END PGP SIGNATURE-----

--=-wnBh9867+XAW/xJbUZNC--
