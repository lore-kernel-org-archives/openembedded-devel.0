Received: from [82.71.204.225] (helo=cpanelsmarthost1.zen.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chris.sykes@nextstepsolutions.co.uk>)
	id 1Lu2dj-00046N-RU for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 12:46:49 +0200
Received: from [82.71.204.21] (helo=zencphosting12.zen.co.uk)
	by cpanelsmarthost1.zen.co.uk with esmtp (Exim 4.63)
	(envelope-from <chris.sykes@nextstepsolutions.co.uk>)
	id 1Lu2a5-0002i4-JR for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 10:43:01 +0000
Received: from sigsegv.plus.com ([212.159.101.170] helo=[192.168.250.101])
	by zencphosting12.zen.co.uk with esmtpa (Exim 4.69)
	(envelope-from <chris.sykes@nextstepsolutions.co.uk>)
	id 1Lu2a5-0003WY-9L for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 11:43:01 +0100
From: Chris Sykes <chris.sykes@nextstepsolutions.co.uk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <d1b08f940904150307y125d2297t93b320a3a2ffd473@mail.gmail.com>
References: <1239788125.3467.8.camel@x60.spackhandychoptubes.co.uk>
	<gs4al7$76r$1@ger.gmane.org>
	<d1b08f940904150307y125d2297t93b320a3a2ffd473@mail.gmail.com>
Organization: Next Step Solutions
Date: Wed, 15 Apr 2009 11:43:00 +0100
Message-Id: <1239792180.3467.15.camel@x60.spackhandychoptubes.co.uk>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - zencphosting12.zen.co.uk
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - nextstepsolutions.co.uk
X-SA-Exim-Connect-IP: 82.71.204.225
X-SA-Exim-Mail-From: chris.sykes@nextstepsolutions.co.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_50,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: kexec-tools-static build failue for zaurus collie
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
X-List-Received-Date: Wed, 15 Apr 2009 10:46:49 -0000
X-Groupsio-MsgNum: 9376
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-gGXZheLLuIJbLKe+oG0c"

--=-gGXZheLLuIJbLKe+oG0c
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2009-04-15 at 12:07 +0200, Andrea Adami wrote:
> Yes, problem with recent kernels (>2.6.28 ?) and klibc.
> See http://lists.linuxtogo.org/pipermail/openembedded-devel/2009-April/00=
9377.html
>=20
> As workaround you can build kexecboot against an older kernel.

Ah, many thanks for the pointers.  I had done a quick search of the
archives but was looking for kexec issues rather than klibc.

--=20
Chris Sykes

Next Step Solutions Limited
Email: chris.sykes@nextstepsolutions.co.uk
Tel: 0870 3146413

--=-gGXZheLLuIJbLKe+oG0c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iD8DBQBJ5bowRhxfZg8kHTARArAFAKDP3EuLn5Ic6tkM+ljG1EE7M2qV4wCgwv2F
RF6dxRSpDhE7sWJjRo5adWM=
=URHt
-----END PGP SIGNATURE-----

--=-gGXZheLLuIJbLKe+oG0c--
