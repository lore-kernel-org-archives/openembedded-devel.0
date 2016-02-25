Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 325EC77311
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 18:26:16 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c200so5050197wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 10:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PxwsXeI8sPigkqvHuI5FiS+3DvOGpNg87RlhojeaWc0=;
	b=KtX0mc5bvYVFairx24l1NNpV7fUFUz9iKM6/M99+6A3WA7UqS3R9556Pg9iHLWi7ko
	T4my9Zu3YHo+qwNAGMhiOIknxvpbrUtrQ4n+v/d6nOPRTm38GxN9AbG2v/wMbdCngZMt
	xRXBAvbAHnGO/SwR63C+4lfWJrYw/eKqYlL3esz9dUpOSCcVN2nfaSFrxicGXmJTxEKe
	gAXU9MOlehTKUTARYCYBb5nVZouqqk2iSYtkhHnGQ+DYsQU2TvXYCglJquyOXFhcHGfx
	3tKX1fgXQgpEAnI2clR4iRJd+ylz+YuhJl5RVr4sronJ+CF0SZY9p/sXwyC2vxi923GI
	AftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=PxwsXeI8sPigkqvHuI5FiS+3DvOGpNg87RlhojeaWc0=;
	b=Xfc9xO4m3+KWRzYwaqeSuzS02mvwdAeeGLms9U1auCzFFwHIWgAn4FUvWHQ8Y5jA9m
	MNjXIN0z2Q1TKsUNU2E32+YXJQmD2KNxfqlZcDSGsxj2OcBtF0rsSxPGNgoqn9TOnSbO
	n7F8VEpd78AwZJjGBSLVjCP+PvEqe+4t0bucwPiJRJdz5iDnKYKK76g0IAK7F8OX3hhR
	ZSShqPupLnPBjp8n9Xe5vALOij8eer3gzp6s4P6VN84SJcLl0Rsj/jkCRSpsCSPMlefQ
	M68OrHxzgpZpJxjve/P1oq/Hfdw8QIvuYDWYh6aRl7wMCC8hV65kPkIzFgrcUDxTIvd4
	aqzA==
X-Gm-Message-State: AG10YORDscDpxj5HkMii0pi3feH+IsieBdCXptRf9a0lHBNbXiJj+/HIuUgwPY+uEAwJJQ==
X-Received: by 10.194.61.209 with SMTP id s17mr45784721wjr.35.1456424777031;
	Thu, 25 Feb 2016 10:26:17 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	av3sm9092599wjc.44.2016.02.25.10.26.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Feb 2016 10:26:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 25 Feb 2016 19:27:30 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160225182730.GD2565@jama>
References: <cover.1456331094.git.akuster808@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1456331094.git.akuster808@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: akuster@mvista.com
Subject: Re: [jethro][PATCH 0/3] Security pull request
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Feb 2016 18:26:17 -0000
X-Groupsio-MsgNum: 60208
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2hMgfIw2X+zgXrFs"
Content-Disposition: inline

--2hMgfIw2X+zgXrFs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 24, 2016 at 08:27:20AM -0800, Armin Kuster wrote:
> please consider these changes for jetho-next

Merged to jethro-next

>=20
> The following changes since commit dc5634968b270dde250690609f0015f881db81=
f2:
>=20
>   php: Security fix CVE-2016-1903 (2016-02-10 15:08:20 +0100)
>=20
> are available in the git repository at:
>=20
>   git://github.com/akuster/meta-openembedded akuster/jethro-next
>   https://github.com/akuster/meta-openembedded/tree/akuster/jethro-next
>=20
> Armin Kuster (2):
>   xdelta3: Security fix CVE-2014-9765
>   ntp: update 4.2.8p6
>=20
> Liu Jian (1):
>   phpmyadmin: CVE-2015-8669
>=20
>  .../ntp/{ntp_4.2.8p4.bb =3D> ntp_4.2.8p6.bb}         |   6 +-
>  .../xdelta/files/CVE-2014-9765.patch               | 311 +++++++++++++++=
++++++
>  meta-oe/recipes-support/xdelta/xdelta3_3.0.8.bb    |   1 +
>  .../phpmyadmin/phpmyadmin-CVE-2015-8669.patch      |  18 ++
>  .../recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb   |   4 +-
>  5 files changed, 336 insertions(+), 4 deletions(-)
>  rename meta-networking/recipes-support/ntp/{ntp_4.2.8p4.bb =3D> ntp_4.2.=
8p6.bb} (96%)
>  create mode 100644 meta-oe/recipes-support/xdelta/files/CVE-2014-9765.pa=
tch
>  create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpm=
yadmin-CVE-2015-8669.patch
>=20
> --=20
> 2.3.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2hMgfIw2X+zgXrFs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbPRr4ACgkQN1Ujt2V2gByVDACdGdw+j7DI6U1phVuioF2Yrinn
RjkAn10R9Im5Lrf/9eTjojZ4ChlACSxh
=rSzi
-----END PGP SIGNATURE-----

--2hMgfIw2X+zgXrFs--
