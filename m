Received: from relay04.stack.nl ([131.155.140.107] helo=mx1.stack.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ruud@il.fontys.nl>) id 1Nccp6-0008SL-7j
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 11:51:07 +0100
Received: by mx1.stack.nl (Postfix, from userid 65534)
	id C73B41DD636; Wed,  3 Feb 2010 11:48:33 +0100 (CET)
Received: from mail.il.fontys.nl (mail.il.fontys.nl
	[IPv6:2001:4128:1000:1000::7])
	(using TLSv1 with cipher ADH-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by mailhost.stack.nl (Postfix) with ESMTPS id A8B681DD635
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Feb 2010 11:48:31 +0100 (CET)
Received: by mail.il.fontys.nl (Postfix, from userid 1004)
	id 7D4601146F; Wed,  3 Feb 2010 11:48:31 +0100 (CET)
Received: from charm.il.fontys.nl (charm.il.fontys.nl
	[IPv6:2001:4128:1000:1000::34])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by mail.il.fontys.nl (Postfix) with ESMTPS id 7B55111453
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Feb 2010 11:48:29 +0100 (CET)
Received: by charm.il.fontys.nl (Postfix, from userid 1838)
	id 4093B412B; Wed,  3 Feb 2010 11:48:29 +0100 (CET)
Date: Wed, 3 Feb 2010 11:48:29 +0100
From: Ruud Althuizen <ruud@il.fontys.nl>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100203104829.GL17820@il.fontys.nl>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 131.155.140.107
X-SA-Exim-Mail-From: ruud@il.fontys.nl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: New machine: Embedded Artists LPC3250
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
X-List-Received-Date: Wed, 03 Feb 2010 10:51:07 -0000
X-Groupsio-MsgNum: 16421
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aznLbwQ42o7LEaqN"
Content-Disposition: inline

--aznLbwQ42o7LEaqN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

In the attached patches there is a machine config and kernel recipe for the
LPC3250 based Embedded Artists development board.

If you have any suggestions for the attached patches, please give them so I
can fix it.

--=20
Greetings,
Ruud Althuizen

--aznLbwQ42o7LEaqN
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (FreeBSD)

iEYEARECAAYFAktpVH0ACgkQkqncCMFskRVzQACfeixpy/a4VokWp55R+nEWOftv
f5UAn2ZvM4GSo3MxCmBmpq2r5IbZJiyr
=wEv8
-----END PGP SIGNATURE-----

--aznLbwQ42o7LEaqN--
