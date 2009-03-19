Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <theBohemian@gmx.net>) id 1LkPyu-00081o-U6
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 22:40:53 +0100
Received: (qmail invoked by alias); 19 Mar 2009 21:39:51 -0000
Received: from f053000052.adsl.alicedsl.de (EHLO [192.168.4.110]) [78.53.0.52]
	by mail.gmx.net (mp015) with SMTP; 19 Mar 2009 22:39:51 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX18MLA108ngM8IbrcCemC/dEStyRHZqZSAsZUtRgC7
	RGsK1z92UnnL94
Message-ID: <49C2BC74.3090204@gmx.net>
Date: Thu, 19 Mar 2009 22:43:16 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.19 (X11/20090103)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49C2BAEA.8050205@gmx.net>
In-Reply-To: <49C2BAEA.8050205@gmx.net>
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.67
Subject: Re: RFC: extension of policy on removing recipes
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
X-List-Received-Date: Thu, 19 Mar 2009 21:40:53 -0000
X-Groupsio-MsgNum: 8572
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigD1BBFD608A48F69804E2CD3C"

--------------enigD1BBFD608A48F69804E2CD3C
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
this is not directly related to the topic. I just want to demonstrate
what the removal of automake-native 1.10 causes here:

/bin/sh: /home/rob/oe/beagle/tmp/staging/x86_64-linux/usr/bin/mkdir: No
such file or directory

The problem is that there is no mkdir in STAGING_BINDIR_NATIVE. :( No
idea, why automake thinks it must be there. Ideas?

Regards
Robert


--------------enigD1BBFD608A48F69804E2CD3C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEAREIAAYFAknCvHQACgkQG9cfwmwwEtr7lwCgnS+IyDcNWK6w0r4hNOMG2wbl
OCMAn3b297SWvoqBWoz1Tkk5btGYarT/
=KYVv
-----END PGP SIGNATURE-----

--------------enigD1BBFD608A48F69804E2CD3C--
