Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LpXZM-0006bR-39
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 02:47:42 +0200
Received: (qmail invoked by alias); 03 Apr 2009 00:45:08 -0000
Received: from f053009085.adsl.alicedsl.de (EHLO [192.168.4.110]) [78.53.9.85]
	by mail.gmx.net (mp037) with SMTP; 03 Apr 2009 02:45:08 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19AqOlVA/JAgAmB2Dnugi81z1QW/BXXsNPk9XpssV
	Uw6wFennxpOOLZ
Message-ID: <49D55C18.5020301@gmx.net>
Date: Fri, 03 Apr 2009 02:45:12 +0200
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, lxgmail@foxmail.com
References: <tencent_4DD8B58F5C313E372BDDC735@qq.com>
In-Reply-To: <tencent_4DD8B58F5C313E372BDDC735@qq.com>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.53
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: theBohemian@gmx.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] seekhelp OE!
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
X-List-Received-Date: Fri, 03 Apr 2009 00:47:42 -0000
X-Groupsio-MsgNum: 9029
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigA8A49073750C535166253059"

--------------enigA8A49073750C535166253059
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi =E5=B0=8F=E5=88=9A,

=E5=B0=8F=E5=88=9A schrieb:
> OE obtain to this website has been=20
> http://ewi546.ewi.utwente.nl/OE/OE.db.bz2=20
> why not download it.  Which website can download OE.db.bz2 ?

What you are trying to download is a monotone database. Monotone is not
used for OpenEmbedded. It was used until last year. Since half a year
OpenEmbedded uses 'git'.

All you want to know is written down here:
http://wiki.openembedded.net/index.php/Getting_started

Regards
Robert

>=20
> I would like to ask anyone who has encountered the same problem and I
> thanks:
>=20
> lxg@ubuntu:~/travis-dev-kit$ bitbake travis-db1200-2.6
> NOTE: Handling BitBake files: | (0011/6646) [ 0 %]ERROR: Error Method a=
lready seen: get_kernelmajorversion in' linux_modules.bbclass' now in 'li=
nux-kernel-base.bbclass'
> ERROR: Error Method already seen: linux_module_packages in' linux_modul=
es.bbclass' now in 'linux-kernel-base.bbclass'
> NOTE: Handling BitBake files: - (0557/6646) [ 8 %]ERROR: Error Method a=
lready seen: get_devtable_list in' image_ipk.bbclass' now in 'image.bbcla=
ss'
> NOTE: Handling BitBake files: | (6646/6646) [100 %]
> BB_VERSION        =3D "1.8.10"
> METADATA_BRANCH   =3D ""
> METADATA_REVISION =3D ""
> TARGET_ARCH       =3D "mipsel"
> TARGET_OS         =3D "linux-uclibc"
> MACHINE           =3D "db1200"
> DISTRO            =3D "travis-uclibc"
> DISTRO_VERSION    =3D ""
>=20
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of org.openembedded.dev/packages/shasum/shasum-native.bb d=
o_unpack failed
> ERROR: Task 20 (org.openembedded.dev/packages/shasum/shasum-native.bb, =
do_unpack) failed
> NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rer=
un and 1 failed.
> ERROR: 'org.openembedded.dev/packages/shasum/shasum-native.bb' failed
> lxg@ubuntu:~/travis-dev-kit$
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commit=
s
>=20



--------------enigA8A49073750C535166253059
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAknVXBsACgkQG9cfwmwwEtrdWACfdbAFDDF9qD0gA4xkMlhnIl+q
0PEAn0YDu1TGrPxOzQl8tSqsqOdPCNq0
=aq/y
-----END PGP SIGNATURE-----

--------------enigA8A49073750C535166253059--
