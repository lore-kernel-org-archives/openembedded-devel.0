Return-Path: <joe@deserted.net>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 86BAD6D001
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 16:31:35 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id h11so1299183wiv.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 09:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=zbe+R73sIFDgT6LNyyIebqB0aa/ZS5Ta7WH6H2NcHB4=;
	b=GcvUr3d2chkfPVXi1TRI1+SBZ4reyvF5lkquoCe5LHZG0kz9990IepIn8Lh8E3bVua
	buddxy40F5pebZWJWFXTZsdlN3G5Eaa9DQmo213DLtzZ6ynpC52kqX7K7DFVucVn4iXL
	CwT96ozj3WtfPAyqjaWA5YIFsTjrDl0ADRoDcNHUIQ5AgSCr7moEE6s2A2nsHvzLTPD4
	KgJFEbXIRcwBrz/TI+69cxZjRSuVhNaEFclDCbsyMSeRag5cNyio4DSZ+DpMSiaF7GEx
	VJZSpwAfEhlVaQSfT4fuheADfs4AlVbDy46aSaURaLJ1gCWZ9+t+rF+V6B+666LNUEfu
	+Mkw==
X-Gm-Message-State: ALoCoQko84B0OUlBOefSSYL5yLq3CnuvKb5u7Ox4E8jLHG5TEIT1JlU4nngD+X0MxjSliALGSOQ3
X-Received: by 10.180.182.15 with SMTP id ea15mr182615wic.16.1382113896867;
	Fri, 18 Oct 2013 09:31:36 -0700 (PDT)
Received: from deserted.net ([128.224.252.2]) by mx.google.com with ESMTPSA id
	dq11sm28519803wid.3.2013.10.18.09.31.34 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 18 Oct 2013 09:31:35 -0700 (PDT)
Date: Fri, 18 Oct 2013 12:31:31 -0400
From: Joe MacDonald <joe@deserted.net>
To: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <20131018163129.GD2456@deserted.net>
References: <1382009891-6444-2-git-send-email-obi@opendreambox.org>
	<1382010336-6779-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1382010336-6779-1-git-send-email-obi@opendreambox.org>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2 2/2] autofs: change DESCRIPTION to SUMMARY
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
X-List-Received-Date: Fri, 18 Oct 2013 16:31:36 -0000
X-Groupsio-MsgNum: 46811
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uxuisgdDHaNETlh8"
Content-Disposition: inline

--uxuisgdDHaNETlh8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged this too.  Thanks.

-J.

[[oe] [meta-networking][PATCH v2 2/2] autofs: change DESCRIPTION to SUMMARY=
] On 13.10.17 (Thu 13:45) Andreas Oberritter wrote:

> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/met=
a-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> index 905be40..f8df0ef 100644
> --- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> +++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
> @@ -1,4 +1,4 @@
> -DESCRIPTION =3D "Kernel based automounter for linux."
> +SUMMARY =3D "Kernel based automounter for linux."
>  SECTION =3D "base"
>  LICENSE =3D "GPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317=
bb3"
--=20
-Joe MacDonald.
:wq

--uxuisgdDHaNETlh8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlJhYmEACgkQwFvcllog0XyATgCcCabck/7Z1u+VYUfV0Hcgtv+Y
WDYAoJSKoTMM7BnQ74g2nLEazWEoyyzT
=Sh6S
-----END PGP SIGNATURE-----

--uxuisgdDHaNETlh8--
