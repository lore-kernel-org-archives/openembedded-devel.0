Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 40470731D6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 16:50:38 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id c133so41002952wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 09:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Zn+xcngpgiIiR4at+7tsLelapfm/dq9uw22QaGaPG+k=;
	b=Uq/AVmS7wdhYPjVUe4HH3S9MDlhukY+FNWiZcbn045juDyn3I0/GjnhB6qmJNIsA/o
	jk5k4Liyvwy/H3JHr7JoHXFHddVEck6pqeHC5NuxrpYZeFAKfg+/qGGNi13Mt0rUFjkN
	AIVuB4kE7YXTUWLxyRflJ3OzyJggh85gWB3ePO3XSFy8x666+dmPP//QjS1ZT960zHu0
	gwJeqARN6C0/5JlwP33e6/q2C3QGPPTr6YjrR8NgVhOk8kF0PShOKW0bhqFZz7e25v7B
	x7CdOQznkEjQF7u9i0ae4TpyPxSiOMpGbG63N2uAEVcC0sS2qxYOGo9lhi1nqT1/+MZb
	22RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Zn+xcngpgiIiR4at+7tsLelapfm/dq9uw22QaGaPG+k=;
	b=ZCzBrBbE2mbLLM4xo2GzOf7hPmm8Kt8A4IiMz2Xkc+w20Eks/CH5JRRV7xQCC+k+MZ
	dq37BRgFlrF1rWZQcvoAhPIxqv9qtIZ66HpsnH0zMSOlqcQRfIKXNvv/8UIc/gBQXbDH
	npTLosgCYRbvNY/+XYAGM3POB2WHRUPCZLZUSh0XWxnCEMHrCTfdziiCgqAn9XTpDepf
	iuSEHaQjM/FbnmVIiziaDpuCkG1DcQqFhAOnq66PWznBIX69+g1gp8RjnHPAkvBsgEUX
	C78+uZoyVcSCtuOlXm3zygWNKEpGJWpBa0LMAvvp3nJbpvU95YxmYUwveYgxkzOZIRYq
	HWSg==
X-Gm-Message-State: AE9vXwMvlyE8zGcXPimwh0tw65Oo+kEXVAYZOF8ckVh31siE9Q1I3jcUrBu9euBiCozw3A==
X-Received: by 10.194.2.7 with SMTP id 7mr11321486wjq.45.1472662239006;
	Wed, 31 Aug 2016 09:50:39 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id ka5sm46382wjb.7.2016.08.31.09.50.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 31 Aug 2016 09:50:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 31 Aug 2016 18:50:38 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160831165038.3gjnyiiquu64qacr@jama>
References: <1471957341-26005-1-git-send-email-mubinusm@xilinx.com>
MIME-Version: 1.0
In-Reply-To: <1471957341-26005-1-git-send-email-mubinusm@xilinx.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: manjukum@xilinx.com, Mubin Sayyed <mubinusm@xilinx.com>
Subject: Re: [meta-oe] [PATCH 0/3] Added cpu benchmarks
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
X-List-Received-Date: Wed, 31 Aug 2016 16:50:39 -0000
X-Groupsio-MsgNum: 62909
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ejjbc5l3hkezbq2t"
Content-Disposition: inline

--ejjbc5l3hkezbq2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 23, 2016 at 06:32:18PM +0530, Mubin Sayyed wrote:
> Added recipes for cpu benchmarks dhrystone,whetstone and linpack.

Please use 4 spaces for indentation instead of tabs.

>=20
> Mubin Sayyed (3):
>   benchmarks:Added recipe for whetstone benchmarks
>   benchmarks:Added recipe for dhrystone
>   benchmarks:Added recipe for linpack
>=20
>  .../recipes-benchmark/dhrystone/dhrystone_2.1.bb   | 22 ++++++++++++++++=
++++++
>  meta-oe/recipes-benchmark/linpack/linpack_1.0.bb   | 22 ++++++++++++++++=
++++++
>  .../recipes-benchmark/whetstone/whetstone_1.0.bb   | 22 ++++++++++++++++=
++++++
>  3 files changed, 66 insertions(+)
>  create mode 100644 meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
>  create mode 100644 meta-oe/recipes-benchmark/linpack/linpack_1.0.bb
>  create mode 100644 meta-oe/recipes-benchmark/whetstone/whetstone_1.0.bb
>=20
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ejjbc5l3hkezbq2t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfHCt4ACgkQN1Ujt2V2gBzoWACeIOzo6fzOkxhzux2KUKYMqACH
bRkAn1ejDI6ICrFQBULU1JupC+eXRSZW
=n1vT
-----END PGP SIGNATURE-----

--ejjbc5l3hkezbq2t--
