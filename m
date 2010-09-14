Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ovc8j-000408-HJ for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 22:30:24 +0200
Received: from f053037098.adsl.alicedsl.de ([78.53.37.98]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Ovc7y-0003Gs-Fv; Tue, 14 Sep 2010 20:29:18 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTi=ay75ZtCe7g5td8tAMwHki-Hk0_FWjYSkT+KoL@mail.gmail.com>
References: <1284404613.4133.103.camel@mattotaupa>
	<AANLkTi=TNCakw39uSUHbVudgdJrxwaQPPZZHmpbO38zN@mail.gmail.com>
	<AANLkTi=ay75ZtCe7g5td8tAMwHki-Hk0_FWjYSkT+KoL@mail.gmail.com>
Date: Tue, 14 Sep 2010 22:29:15 +0200
Message-ID: <1284496155.3724.18.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: Re: [PATCH] preferred-xorg-versions-X11R7.5-latest.inc: Use Pixman 0.18.4.
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
X-List-Received-Date: Tue, 14 Sep 2010 20:30:24 -0000
X-Groupsio-MsgNum: 23576
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-kxDDGmYyT0UC9tMFyJ0W"

--=-kxDDGmYyT0UC9tMFyJ0W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 14.09.2010, 15:17 +0200 schrieb Frans Meulenbroeks:
> 2010/9/13 Khem Raj <raj.khem@gmail.com>:
> > On Mon, Sep 13, 2010 at 12:03 PM, Paul Menzel <paulepanter@users.source=
forge.net> wrote:
> >> Date: Mon, 13 Sep 2010 20:53:48 +0200
> >>
> >> Cairo 1.10.0 was added in 1d4c650b1d8dac6adee3d3d4208b81bc9b67bd3d [1]=
 and requires Pixman 0.18.4. This fixes at least the distribution Minimal w=
hich does not set the version of cairo explicitly.
> >>
> >>
> >> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3D1d=
4c650b1d8dac6adee3d3d4208b81bc9b67bd3d
> >> [2] http://cgit.freedesktop.org/cairo/commit/?id=3D8127f1f5d52bb716dbd=
70efe096894f2a542f4a9
> >>
> >> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> >
> > Acked-by: Khem Raj <raj.khem@gmail.com>
>=20
> Paul, thanks for the fix!
>=20
> Acked-by: Frans Meulenbroeks <frans.meulenbroeks@gmail.com>

Leon committed the same in f68f811ed20c32d3fb7c71fb41484ae6dd9908fc [3].

(Leon, I know it is a simple fix and it was probably easier to not apply
this patch but to change it yourself. (`pw-am.sh` [4] should have made
it easy.) But I spent some minutes to compose the commit message to
comply to the commit policy [5]. So it would have been nice if this had
been included. No, big deal though. Thanks again for fixing it in the
repository.)


Thanks,

Paul


[3] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Df68f811=
ed20c32d3fb7c71fb41484ae6dd9908fc
[4] http://cgit.openembedded.org/cgit.cgi/openembedded/tree/contrib/patchwo=
rk/pw-am.sh
[5] http://wiki.openembedded.net/index.php/Commit_Policy

--=-kxDDGmYyT0UC9tMFyJ0W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkyP2xUACgkQPX1aK2wOHVg2iQCghFegY3oDiJxTjocCp54NJMCX
0hMAoITGKs3o5/EEi8tVI+ei7fzNiI0e
=Xbhi
-----END PGP SIGNATURE-----

--=-kxDDGmYyT0UC9tMFyJ0W--
