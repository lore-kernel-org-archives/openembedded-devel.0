Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1Kiq39-0008F5-LS
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Sep 2008 14:34:27 +0200
Received: (qmail invoked by alias); 25 Sep 2008 12:30:44 -0000
Received: from p579E1A48.dip.t-dialin.net (EHLO [192.168.4.51]) [87.158.26.72]
	by mail.gmx.net (mp038) with SMTP; 25 Sep 2008 14:30:44 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18h7KNY4/0hDMnUIesXhbgE0L1Zi+Iu+flv8KIdQJ
	qTRn/DMJBg5opJ
Message-ID: <48DB845A.20108@gmx.net>
Date: Thu, 25 Sep 2008 14:30:18 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Thunderbird 2.0.0.16 (X11/20080724)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20080925105654.E495E18806C@amethyst.openembedded.net>
In-Reply-To: <20080925105654.E495E18806C@amethyst.openembedded.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.00
Subject: wrong URLs in commit logs
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
X-List-Received-Date: Thu, 25 Sep 2008 12:34:27 -0000
X-Groupsio-MsgNum: 5966
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig81F2D367F1FF06296A591AA2"

--------------enig81F2D367F1FF06296A591AA2
Content-Type: multipart/mixed;
 boundary="------------000905040008020308060407"

--------------000905040008020308060407
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,
the URLs in the commit summaries are not working. Instead of

> URL:    http://gitweb.openembedded.net//OE.dev.git/?a=3Dcommit;h=3Dd117=
d60ee4811909f912a128d66bdefc2863e8ce
It should be:
http://gitweb.openembedded.net/?p=3Dorg.openembedded.dev.git;a=3Dcommit;h=
=3Dd117d60ee4811909f912a128d66bdefc2863e8ce

And instead of:
> Diff:   http://gitweb.openembedded.net//OE.dev.git/?a=3Dcommitdiff;h=3D=
d117d60ee4811909f912a128d66bdefc2863e8ce
http://gitweb.openembedded.net/?p=3Dorg.openembedded.dev.git;a=3Dcommitdi=
ff;h=3Dd117d60ee4811909f912a128d66bdefc2863e8ce

File a bug?

Regards
Robert



--------------000905040008020308060407
Content-Type: application/pgp-signature;
 name="signature.asc"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC42IChHTlUv
TGludXgpCkNvbW1lbnQ6IFVzaW5nIEdudVBHIHdpdGggTW96aWxsYSAtIGh0dHA6Ly9lbmlnbWFp
bC5tb3pkZXYub3JnCgppRDhEQlFGSTI0Uk1HOWNmd213d0V0b1JBbWdvQUo0bk1LYzhzWVhWNG51
K3lOZHl6cFBKdEpOelVBQ2RGWXExCmVSZ0ljV2hJV0psTFFhVkQzUDdEZlVnPQo9blhBOQotLS0t
LUVORCBQR1AgU0lHTkFUVVJFLS0tLS0KCg==

--------------000905040008020308060407--

--------------enig81F2D367F1FF06296A591AA2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFI24RaG9cfwmwwEtoRAkjFAJ0VDDJ8pkxuvZLYVYxc0TwQoi792QCfUt5B
SO+x/ZkPQgPK05oj0vaWPhE=
=HAuz
-----END PGP SIGNATURE-----

--------------enig81F2D367F1FF06296A591AA2--
