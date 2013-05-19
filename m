Received: from mail-pd0-f173.google.com ([209.85.192.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UdybB-00073G-7v
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 May 2013 10:04:14 +0200
Received: by mail-pd0-f173.google.com with SMTP id v10so4527062pde.18
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 May 2013 00:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=FzCpl2maLYMR2J5mjNfX6KvuZq8nujCjUEZf09HycNk=;
	b=Fpofu/XRRtJqqaPlsFCfKnQPOG5eQ6xBhAEEo84fdbVIuPNVwTHw/qWTe9eWhO2IKd
	+IbgnRSoLO3GR0aaQZMLUX8ngiwyCjljwMPb1J5GJDb4hEiZkCPVHF7r6x6hXjj8AYhP
	kbYDIe9HLWSrY29qXsEzryTXIh0ae29n6WNSHHWN15Qhbr1znasvdHFmV0YkCKUvPsX+
	nw9UwiIPHQhT0K9pSf7JW0GuKG9jpURQpS/qUdSGz7xD0PfKFsF1gZ5tVdSDA9cqGh1i
	72Zao1MLVYfrJpgwFVprkZyRj40GQ94JgBdAZuLBjvnLkLlu0kxe2CNGp8TtGlABq56K
	nndw==
X-Received: by 10.66.163.99 with SMTP id yh3mr55441060pab.22.1368949550205;
	Sun, 19 May 2013 00:45:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	wt5sm18739315pbc.38.2013.05.19.00.45.47 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 19 May 2013 00:45:49 -0700 (PDT)
Date: Sun, 19 May 2013 09:45:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130519074539.GB3196@jama>
References: <1368895167-6841-1-git-send-email-raj.khem@gmail.com>
	<CALbNGRTG44omNit6qx-7EmTLXJGN_HJytYGtsqL_z2pHepOnrA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTG44omNit6qx-7EmTLXJGN_HJytYGtsqL_z2pHepOnrA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Subject: Re: [meta-browser][PATCH] libxi: Match the bbappend to OE-Core
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
X-List-Received-Date: Sun, 19 May 2013 08:04:37 -0000
X-Groupsio-MsgNum: 44771
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline

--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 18, 2013 at 07:35:33PM +0200, Andreas M=FCller wrote:
> Martin sent same already - for unknown reasons it did not make it into
> patchwork [1]
>=20
> Andreas
>=20
> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-May/0455=
97.html

It didn't make it into patchwork, because I've used -M and rename-only
patches are not picked by patchwork :/

Eric, can you please update status on patches in meta-browser bundle=20
and when you're there also in danny?, dylan is empty now.

http://patches.openembedded.org/bundle/jama/meta-browser/?archive=3Dboth
http://patches.openembedded.org/bundle/jama/danny/?archive=3Dboth

http://patches.openembedded.org/bundle/jama/dylan/?archive=3Dboth

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGYgyMACgkQN1Ujt2V2gBxrhACeMQXHVUEtxL1Jrt+y/VLFdMYw
7jYAoLH3vn2/k9OTApbyDuORzKfyqTC5
=p+MF
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--
