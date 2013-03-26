Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UKWFi-0003xV-Dg
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Mar 2013 16:57:38 +0100
Received: by mail-pb0-f49.google.com with SMTP id um15so1065303pbc.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Mar 2013 08:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=nWCsOPqeaqdnLxwuLlSUgJrKbWW4KMiMzO9iolhEhd4=;
	b=BivMQsGZwVfuMTpdqWukvi/dbEoeMDVdc0ZH2yjYgaw55o9NRPoCIVM7o6fMvRTtC2
	21MKf9QrVqOhhXj8+KttzXmTo9CU5b7O4x/VcnuFMKNbEMHCbSvI7jXls2gblnkq+TDw
	3amoLaFFsyeHsEAUApcR9yBNZP9BSSDSO5CKmdLbl+vs+vnLRNmIYbq3emry9KRRm7fi
	yMw+hSEP9iqIKTfcIeaz5C+xPHHWe4thupOlKfWNpBmkdsTw8FShZY64v5D4XM+1iqxe
	FJ8Mj2bxQvjm1tptyqXKkLxfXKgmeIvPGlxyAuSLfVi4R285YFt6skKrnAVGgo3chGQg
	qI0g==
X-Received: by 10.66.171.232 with SMTP id ax8mr24894439pac.67.1364312433699;
	Tue, 26 Mar 2013 08:40:33 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id in5sm17913111pbc.20.2013.03.26.08.40.30
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 26 Mar 2013 08:40:32 -0700 (PDT)
Date: Tue, 26 Mar 2013 16:40:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130326154020.GG7539@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: origin/danny branch
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
X-List-Received-Date: Tue, 26 Mar 2013 15:57:47 -0000
X-Groupsio-MsgNum: 43739
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gvF4niNJ+uBMJnEh"
Content-Disposition: inline

--gvF4niNJ+uBMJnEh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Eric,

I've noticed that there is new origin/danny branch, did you push it or
someone else?

[new branch]      origin/danny -> origin/origin/danny
not sure if you have permissions to remove it.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gvF4niNJ+uBMJnEh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFRwWQACgkQN1Ujt2V2gByFuwCgg5V9ELG03kRU0i9YJPiXbVkb
BwYAoKs+bvY4PWEnkQnD3aNEnNknzDVk
=Nzbc
-----END PGP SIGNATURE-----

--gvF4niNJ+uBMJnEh--
