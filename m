Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id A985860593
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 11:51:35 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so4742908eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Aug 2013 04:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8MQnEIlFrFnQLOGQhMjhGhhnSJ8Ea1TrEZ0JCAqx1RM=;
	b=YQlmtDTM2BxAXwSex2Oo9/dDmNPFOT/zVcnevuLSKcTqN3w/Qjohb2u9N/EA3jIGwA
	Z27Ao0HmNEsR9otfLfhHROauKUotsNKPlNjQHvndP9Pjd/DyRVCDG6UhMsz2E94p4gjn
	plrZQ7IRi1II7cJQG6ngYiHf9uEFegeyaQhPwsYMVCrAMVVcRlpSV5QM8H+By8kmtyRK
	KL/BQ0Idme4s06MwockSr/mS0xEj10Z4OtbUd9Ub2lpJou2VamZdxRZ71uaWow3h23h9
	xDGGTLkkhgYexoZZrKinVhUyo+byqNkxE7Co2keUc65q9MjoeqOS71zu4OOsBOaOp3JC
	HBQA==
X-Received: by 10.14.105.71 with SMTP id j47mr489995eeg.103.1376481095522;
	Wed, 14 Aug 2013 04:51:35 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bq1sm74502701eeb.9.2013.08.14.04.51.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 04:51:35 -0700 (PDT)
Date: Wed, 14 Aug 2013 13:52:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130814115226.GV17945@jama>
References: <cover.1376294039.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1376294039.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-perl][PATCH V2 0/3] add perl database library to create meta-perl layer
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
X-List-Received-Date: Wed, 14 Aug 2013 11:51:36 -0000
X-Groupsio-MsgNum: 45685
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="b3OyYALfe3DXUU4J"
Content-Disposition: inline

--b3OyYALfe3DXUU4J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2013 at 04:00:18PM +0800, Hongxu Jia wrote:
> Change in V2: Use 'meta-perl' instead of 'meta-cpan' to name the layer

All patches are misssing 'meta-perl/' prefix so I had to apply them
manually.

Now they are in jansa/in-test so you don't need to resend them.

>=20
> The following changes are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib hongxu/meta-perl
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dhongxu/meta-=
perl
>=20
> Hongxu Jia (3):
>   meta-perl creation
>   libdbi-perl: add version 1.628
>   libdbd-sqlite-perl: add version 1.40
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--b3OyYALfe3DXUU4J
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlILb3oACgkQN1Ujt2V2gBxMcgCfWSM64P5cWcmdYZe00g0nNWrw
hnYAoLnOhQn2bRhmnNeLtA8E2V4dOR9g
=AJ97
-----END PGP SIGNATURE-----

--b3OyYALfe3DXUU4J--
