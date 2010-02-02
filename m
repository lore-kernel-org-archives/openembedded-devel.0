Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NcQuu-0003oY-Lg for openembedded-devel@lists.openembedded.org;
	Tue, 02 Feb 2010 23:08:19 +0100
Received: from f053034209.adsl.alicedsl.de ([78.53.34.209]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NcQsZ-0000sO-EU for openembedded-devel@lists.openembedded.org;
	Tue, 02 Feb 2010 22:05:51 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B6828E9.6090304@balister.org>
References: <1265103507.19185.8.camel@balakrishnan-desktop>
	<4B6828E9.6090304@balister.org>
Date: Tue, 02 Feb 2010 23:05:49 +0100
Message-ID: <1265148349.29062.4.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] regulus: Adding pxa270 based machine
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
X-List-Received-Date: Tue, 02 Feb 2010 22:08:19 -0000
X-Groupsio-MsgNum: 16406
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-4jxSXe/yhLm7K45g/SZ9"

--=-4jxSXe/yhLm7K45g/SZ9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 02.02.2010, 08:30 -0500 schrieb Philip Balister:
> On 02/02/2010 04:38 AM, balakrishnan wrote:
> >         I have mailed four patches to OE dev list on last month regardi=
ng
> > "pxa270 based machine" inclusion in OE(stable/2009). Can I have status
> > of my patches?
>=20
> Can you post links or patch numbers so we can look at them in patchwork?
>=20
> http://patchwork.openembedded.org

That is another great thing about `pwclient` [1].

        $ ./pwclient search -w balister
        Patches submitted by Philip Balister <philip@balister.org>:
        ID    State        Name
        --    -----        ----
        456   Not Applicable [oe] FILESPATHPKG question
        728   Applied      [oe] u-boot_git.bb : Update recipe from .dev
        754   Not Applicable [oe,Fwd:,[Gumstix-users] Small patch to fix Di=
rectFB]
        888   Applied      [oe] sqlite3 recipe
        1431  Not Applicable [oe] Add libtool related stuff to task-native-=
sdk
        Patches submitted by Test User <balister@vt.edu>:
        ID    State        Name
        --    -----        ----

Although in our case Patchwork did not seem to have picked up J.=E2=80=99s
patches. See my reply to Holger.


Thanks,

Paul


[1] http://patchwork.openembedded.org/project/openembedded/
    (link at the bottom)

--=-4jxSXe/yhLm7K45g/SZ9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktoobcACgkQPX1aK2wOHVjdwwCfX6Ohtk6GXyIhl7DqKu6tEq1Y
QtAAn10ubo1+yU3zqw5A01ikOYvPaJAA
=YqYc
-----END PGP SIGNATURE-----

--=-4jxSXe/yhLm7K45g/SZ9--
