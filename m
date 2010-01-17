Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1NWUV7-0001ie-Fx for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 13:45:08 +0100
Received: from f053033218.adsl.alicedsl.de ([78.53.33.218]
	helo=[192.168.178.25])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1NWUSz-0002Rd-Cf for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 12:42:53 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.00.1001170426100.4163@localhost>
References: <alpine.LFD.2.00.1001170426100.4163@localhost>
Date: Sun, 17 Jan 2010 13:42:52 +0100
Message-ID: <1263732172.3210.24.camel@mattotaupa.wohnung.familie-menzel.net>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [OT] Git: show commits belonging to renamed/moved files (was: why qpealarmclockapplet-1.0.9/missing-files.tar.gz in OE repo?)
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
X-List-Received-Date: Sun, 17 Jan 2010 12:45:08 -0000
X-Groupsio-MsgNum: 15793
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-S6hSMB8mtnWESDQ0msCT"

--=-S6hSMB8mtnWESDQ0msCT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 17.01.2010, 04:29 -0500 schrieb Robert P. J. Day:
> $ git log recipes/qpealarmclock/qpealarmclockapplet-1.0.9/missing-files.t=
ar.gz
> commit 709c4d66e0b107ca606941b988bad717c0b45d9b
> Author: Denys Dmytriyenko <denis@denix.org>
> Date:   Tue Mar 17 14:32:59 2009 -0400
>=20
>     rename packages/ to recipes/ per earlier agreement
>=20
>     See links below for more details:
>     http://thread.gmane.org/gmane.comp.handhelds.openembedded/21326
>     http://thread.gmane.org/gmane.comp.handhelds.openembedded/21816
>=20
>     Signed-off-by: Denys Dmytriyenko <denis@denix.org>
>     ... snip ...

Just for your information.

        $ git help log
        [=E2=80=A6]
               --follow
                   Continue listing the history of a file beyond
        renames.
        [=E2=80=A6]


Thanks,

Paul

--=-S6hSMB8mtnWESDQ0msCT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktTBcsACgkQPX1aK2wOHVjNfwCePviNm1kq4ff39DXWppfh7dsa
MDIAnRBHX6IGp0S3CDFkAWBiR+cy2mlm
=8/lv
-----END PGP SIGNATURE-----

--=-S6hSMB8mtnWESDQ0msCT--
