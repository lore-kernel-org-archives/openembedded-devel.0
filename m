Received: from mail-pb0-f51.google.com ([209.85.160.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TlgUh-0006PV-Ji
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Dec 2012 14:49:09 +0100
Received: by mail-pb0-f51.google.com with SMTP id ro12so2000383pbb.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Dec 2012 05:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=+IBeRXtMqL3uXMXRqv0rGC41VMtpqS1l4aDmpy/9euQ=;
	b=kgh0QpHDEThWVnCz4otlEr8vFlbe+iBMcZdSMqG9EceRuh/Nf38vXlB9FVznROezPB
	XxskOnemOzZtM6GvgSmS5MAndOdr+oGVWAwE5bDfEUojMAFbfO62cveiGKSUjIb3a+dG
	kY+CvulasjXCJczM+9y4TwTkSKhT6VzjfO0sTteHObW0ZrMufzVPcu6HGdpKmcY78CHy
	hvCQJOAsHHDx0NzcBjZPlHT6sj/v21fU00rY22UJvxJo6Yg3LRCsRDU5xSXBotOVd3jY
	q6TZ80vpmttxdrS2Dh1unqqdDZl0qgNC8k6KfrbeVLxPJ+2SipqkJVBGoimD0DudblE5
	On8g==
X-Received: by 10.66.75.162 with SMTP id d2mr27586344paw.27.1356010458390;
	Thu, 20 Dec 2012 05:34:18 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id yi9sm5062053pbc.39.2012.12.20.05.34.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Dec 2012 05:34:17 -0800 (PST)
Date: Thu, 20 Dec 2012 14:34:16 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121220133416.GL14543@jama.palm1.palmone.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [meta-java] patches on patchwork
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
X-List-Received-Date: Thu, 20 Dec 2012 13:49:09 -0000
X-Groupsio-MsgNum: 42282
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y+Z5jE7Arku/2GrR"
Content-Disposition: inline

--Y+Z5jE7Arku/2GrR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, can you check and update patches in meta-java bundle?
http://patches.openembedded.org/bundle/jama/meta-java/?archive=3Dboth

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Y+Z5jE7Arku/2GrR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDTE9gACgkQN1Ujt2V2gByGcQCgtc1Y9QiBdb6nnhJ/k0Z4oP6+
p4YAn1c9i1Bs4KUyWhyHq/4uOTpmF89J
=7MRx
-----END PGP SIGNATURE-----

--Y+Z5jE7Arku/2GrR--
