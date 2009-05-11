Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <thebohemian@gmx.net>) id 1M3Rr1-0001Aj-DU
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 May 2009 11:31:23 +0200
Received: (qmail invoked by alias); 11 May 2009 09:24:50 -0000
Received: from p5DDC6E93.dip.t-dialin.net (EHLO [192.168.4.51])
	[93.220.110.147]
	by mail.gmx.net (mp023) with SMTP; 11 May 2009 11:24:50 +0200
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX19oVldPqQVodqBYbeR70WxUG2TdJQu0TYvN7cj833
	0L/1tiiqDQp3Gn
Message-ID: <4A07EE70.2010408@gmx.net>
Date: Mon, 11 May 2009 11:22:56 +0200
From: Robert Schuster <thebohemian@gmx.net>
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.7
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.65
Subject: python 2.6 warning
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
X-List-Received-Date: Mon, 11 May 2009 09:31:23 -0000
X-Groupsio-MsgNum: 10155
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig2721B9FFAB1D37C6B42853BB"

--------------enig2721B9FFAB1D37C6B42853BB
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hi all,
those who are using bitbake with Python 2.6 (e.g. Ubuntu 09.04, Debian
sid) will notice this warning:

/home/rschus/oe/bitbake/lib/bb/COW.py:29: DeprecationWarning: the sets
module is deprecated
  import types, sets

Is anyone from OE in the know how to fix that properly? I know its only
a warning but imagine an OE newbie reading this .... I would like to fix
it myself but even after years of contributing to OE my Pyhton skills
are severely limited. :|

Regards
Robert


--------------enig2721B9FFAB1D37C6B42853BB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAkoH7nIACgkQG9cfwmwwEtoIIQCfaUN7iiceBjB6zsIOB4ZWuzy/
nbIAnRSKWNGWWzURfYQSKkaa8nSNUo4J
=w37K
-----END PGP SIGNATURE-----

--------------enig2721B9FFAB1D37C6B42853BB--
