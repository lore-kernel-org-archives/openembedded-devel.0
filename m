Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id BD2986F590
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 22:22:40 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id rp16so4109273pbb.31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Mar 2014 15:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:message-id:mime-version:subject:date:references
	:to:in-reply-to;
	bh=bsLUJpTj9c5NSizrMPTiPm5XMdPhoZgPVtiuu6O28Lw=;
	b=wu7XsD6fx4xupfs2dRQV8SvzdAa9UZzY4wydfalhkkdnIZa3knYlwdV5A0TIMk/e2d
	XZlyetZfJo9jcHBvEbrf/TiJga5PSfs50NScQIhwO/RkEWVtoJR0/AHpD0wEZbl69zf6
	XUCyiGW7iLF8KTu5eLrSRvlVoLr3G3w1J62NywWpfe3b1vJN6C/ZOv4SIItX4RQQZFVJ
	jbhgnh6QEeP0vetC5T+4a/EUEmseFda52YKOVgoBdCeOgH0iRaK42QIKluPqn0zYcdKG
	jnm7+AmuoXsIrbe/eI5eqCZ40MDgBk8lxJxsb5upfaVJaHyWDuhU8joV4CaDL3jirFtx
	00zg==
X-Received: by 10.68.185.1 with SMTP id ey1mr17105594pbc.33.1394922161932;
	Sat, 15 Mar 2014 15:22:41 -0700 (PDT)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id ha2sm29141022pbb.8.2014.03.15.15.22.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 15 Mar 2014 15:22:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <4435B502-2EA5-46A3-90C5-5C16E73E659F@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Date: Sat, 15 Mar 2014 15:22:37 -0700
References: <1394919160-28076-1-git-send-email-raj.khem@gmail.com>
	<CA+chaQdaNjbJn=a_VWgv-3MXbETzb=JhXbo+9uDw4vxRt-MQ8Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CA+chaQdaNjbJn=a_VWgv-3MXbETzb=JhXbo+9uDw4vxRt-MQ8Q@mail.gmail.com>
X-Mailer: Apple Mail (2.1874)
Subject: Re: [meta-systemd][PATCH] dhcp, util-linux: User wildcard in bbappend names
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Mar 2014 22:22:45 -0000
X-Groupsio-MsgNum: 48704
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DCA9A57A-084A-4435-980F-AC4A23EB3FE6";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DCA9A57A-084A-4435-980F-AC4A23EB3FE6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On Mar 15, 2014, at 3:18 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> see already merged commits:
>=20
> =
http://git.openembedded.org/meta-openembedded/commit/?id=3D5b8498b53dcdf2e=
d797cbd2049dd3856ef17e2ff
> =
http://git.openembedded.org/meta-openembedded/commit/?id=3Dc78731c0859d79b=
115d47e2bfcd977086d25fc64
>=20

ah thanks


--Apple-Mail=_DCA9A57A-084A-4435-980F-AC4A23EB3FE6
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMk0q4ACgkQuwUzVZGdMxTgIgCfVD1DlunBxjlUyn6j+8ys7SYT
AeEAn36pQwCkdFeDb7DvYoVTGlUnhTF1
=PVGc
-----END PGP SIGNATURE-----

--Apple-Mail=_DCA9A57A-084A-4435-980F-AC4A23EB3FE6--
