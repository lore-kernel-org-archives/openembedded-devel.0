Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.68)
	(envelope-from <theBohemian@gmx.net>) id 1JA3Mq-0004Zs-8v
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2008 14:10:46 +0100
Received: (qmail invoked by alias); 02 Jan 2008 13:04:16 -0000
Received: from e178116039.adsl.alicedsl.de (EHLO [192.168.4.101])
	[85.178.116.39]
	by mail.gmx.net (mp005) with SMTP; 02 Jan 2008 14:04:16 +0100
X-Authenticated: #17532834
X-Provags-ID: V01U2FsdGVkX1+aDEVx78GaMKoltueqjpGQolvEnQr6PQWW83xzIj
	ECk+JtGV3V5PTX
Message-ID: <477B8BCC.5080300@gmx.net>
Date: Wed, 02 Jan 2008 14:04:12 +0100
From: Robert Schuster <theBohemian@gmx.net>
User-Agent: Mozilla-Thunderbird 2.0.0.6 (X11/20071009)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Enigmail-Version: 0.95.0
X-Y-GMX-Trusted: 0
Subject: custom debian package names and fully customized package names
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Jan 2008 13:10:52 -0000
X-Groupsio-MsgNum: 3782
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="------------enigF5D07BB9BBB1BFFAA179AA86"

--------------enigF5D07BB9BBB1BFFAA179AA86
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
I have found a simple solution for allowing one to customize the Debian
package names:

http://bugs.openembedded.org/show_bug.cgi?id=3D3383

Please have a look at it and tell me whether you want it like this.

This patch is primarily meant to make custom python code to fix wrong
guessing of the Debian renamer unnecessary.

I have another patch that allows fully customized package names. This
efforts may be useless from a distro building POV but is IMHO vital for
all those who want to use OE to build packages for a non-OE distro.

http://bugs.openembedded.org/show_bug.cgi?id=3D3590

Comments on both enhancements are welcomed!

Regards
Robert


--------------enigF5D07BB9BBB1BFFAA179AA86
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHe4vPG9cfwmwwEtoRCEaGAJ42PXL3/BcQOwZToZbx7/iT7YZNhgCbBeQo
z/3hmwQ2GOrl3hTf+t7ka9M=
=Gc8e
-----END PGP SIGNATURE-----

--------------enigF5D07BB9BBB1BFFAA179AA86--
