Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id C12E265D7B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 17:49:41 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id ib6so2640541vcb.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 10:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PPMVSZADhq/d0PlcG9ENi9Wx310aiHuTK4oBQkFLU50=;
	b=0NDiee0/7h6xIH/Y572h66OG15rsAxMBsC3u6eUFdP9nbuk2DUxUM3R5bnzzPg23S9
	AywSvPZ7jr9t/AVsp6rn/lsvsA0UIVQjf91iqJnfnu2sQngC2/yK3WQEYVc1a3lNtuKg
	fenvpcaRfqfnx05e/NLVM4az4aHgBFwmS/e+sRsnrDgDDcdz8Ei6QgOcnjDI10n6kZqU
	5ln9myRFAglCBxquwUNAEAM/kkTktrP86hbirxdxraRyVOUYVoMv+nw/ayOZP8a16r5g
	0YDkR/vTgyKQ/QofCwLp0WpNG5xAXl7ch5yQvWA8yzOxTsVUwdWHP6B0s1t0LH0qGSQ+
	OP9Q==
X-Received: by 10.220.179.197 with SMTP id br5mr44885vcb.80.1398880182226;
	Wed, 30 Apr 2014 10:49:42 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q3sm32946541veh.8.2014.04.30.10.49.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Apr 2014 10:49:41 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Apr 2014 19:49:56 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140430174956.GO2486@jama>
References: <1398876295-19178-1-git-send-email-Martin.Jansa@gmail.com>
	<5361347D.1040001@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <5361347D.1040001@opendreambox.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-systemd][PATCH] lighttpd: rename .bbappend to match with any version
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
X-List-Received-Date: Wed, 30 Apr 2014 17:49:42 -0000
X-Groupsio-MsgNum: 49617
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="69hkJlzLli1+5obl"
Content-Disposition: inline

--69hkJlzLli1+5obl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2014 at 07:35:57PM +0200, Andreas Oberritter wrote:
> Hi Martin,
>=20
> On 30.04.2014 18:44, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../lighttpd/{lighttpd_1.4.33.bbappend =3D> lighttpd_1.4.35.bbappend} =
      | 0
>=20
> this contradicts the subject.

Ah right sorry, forgot to finish amend before send-email.

> Regards,
> Andreas
>=20
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename meta-systemd/oe-core/recipes-extended/lighttpd/{lighttpd_1.4.33=
=2Ebbappend =3D> lighttpd_1.4.35.bbappend} (100%)
> >=20
> > diff --git a/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.=
4.33.bbappend b/meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4=
=2E35.bbappend
> > similarity index 100%
> > rename from meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4=
=2E33.bbappend
> > rename to meta-systemd/oe-core/recipes-extended/lighttpd/lighttpd_1.4.3=
5.bbappend
> >=20
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--69hkJlzLli1+5obl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNhN8QACgkQN1Ujt2V2gBx5qwCfZIN0r7TlWKX5AbAHC8wqBCFK
ggwAoKc6qcovl8lN2WS7B01v+uda5FOW
=fYIC
-----END PGP SIGNATURE-----

--69hkJlzLli1+5obl--
