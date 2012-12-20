Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TlgQs-0006Av-Gu
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 14:45:07 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so1520095dak.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 05:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=WbkJ0kKwapW6EC1aa/PiGi44bNUBegYnIMAlVMfR42M=;
	b=0u/I717QW3FfrN4MkEiV66Cl/fkxs1eCVLrDqHFZJZrmYJcfdaSw+C+er/ov5r6sxM
	1j+saxmxs0BK2PPHQbB/YKqxAgeRRsV+eiuEdaMnfOqufKKK0FY9RGM+2z4wpUK7pkZJ
	Q/TKd9REq/at3wWP+IGT5/hLc12SzXIzDHgHK2m95BZqm4j/S2EBTaGOF/srM1RXCfJy
	1CX/EjYM9SYa1e5/8V91wDUfV8WfDlYabIfeZkTc/SpYWyLidiLxoTmkxsneZTcH6bDe
	tHBjpIafXFOylsjVielLULI11pEFT7D9Sp/nrJykd6iE2XL5Vyqh9ZV5Stk5rI+IHNXM
	Z09Q==
X-Received: by 10.68.189.233 with SMTP id gl9mr29027369pbc.166.1356010221414; 
	Thu, 20 Dec 2012 05:30:21 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id zv10sm5046351pbc.76.2012.12.20.05.30.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 05:30:20 -0800 (PST)
Date: Thu, 20 Dec 2012 14:30:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121220133018.GJ14543@jama.palm1.palmone.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Joe MacDonald <joe.macdonald@windriver.com>
Subject: [meta-networking] patches on patchwork
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
X-List-Received-Date: Thu, 20 Dec 2012 13:45:07 -0000
X-Groupsio-MsgNum: 42280
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cDtQGJ/EJIRf/Cpq"
Content-Disposition: inline

--cDtQGJ/EJIRf/Cpq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, can you check and update patches in meta-networking bundle?
http://patches.openembedded.org/bundle/jama/meta-networking/?archive=3Dboth

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cDtQGJ/EJIRf/Cpq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDTEuoACgkQN1Ujt2V2gBwKxQCgsueuknL9+QkM5NUUDMrZGRw/
lPUAnRQ6KluP8WCid1M4TpamPkt0HGOS
=J5Df
-----END PGP SIGNATURE-----

--cDtQGJ/EJIRf/Cpq--
