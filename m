Return-Path: <ticotimo@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id E26C9719B4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 03:12:11 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id e9so18875890pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 19:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:references:in-reply-to:message-id:date:to
	:content-transfer-encoding:mime-version;
	bh=L37vYBRDI/tsO+mJUZWZUHJ1Ijd9/X3RNhcDCuO5LIQ=;
	b=naO5lXA6bAzkjNjtLsWKrrRBIhsv483nqEmDuSraf9IVPu3U9jHHfhPQkvFzqvHcpE
	l6ISCzAVvyZFtfvi4XGOmCknJCaxNxHoJOa9raHJigjHHd6tD4nE4xVa9/3URch6sF1d
	zMW4dYgOMmfvK/Le7mu+TIm8n7zveEdiWoT7k/ijutOXktmLdfvmddaYbaRfVF65TQ87
	oDJbpEf4l1YmP8UtNgsquSwj4FfdnURiV/WnvPYez5/s3/OL0sfPrHQxHvdQf/AhJNUz
	V8tKIGWkmN+gu//kQNLVasTFueHU87mpN4SeGrnth+FoFeviqhqK0H5LYjyLvi7qziMp
	2yzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:references:in-reply-to:message-id
	:date:to:content-transfer-encoding:mime-version;
	bh=L37vYBRDI/tsO+mJUZWZUHJ1Ijd9/X3RNhcDCuO5LIQ=;
	b=YlWW0PyYSqUVtFeqpfyBA2d5tS8/DkYQCzbYjDbz3cR+FuOeG+CtkcJ6n9nQbonzAb
	GwOOCWERX/TbQgZJR0CeSWEhwh0intVko/R6nKI8CfXVDUiUyTvfri/9keQ1POcv9/se
	7YQll8WIhzPUzPI2ICfA06oqczE+mQJhpfMPUFdHDT+gjRfmBuI87leB30b37oFE+Gal
	45KyLaq5E43dtvHOaP+cibYXnKom83Z3Asz15Kdf23vifAZaF3CJAvkUYHCELJU51rLA
	LxWk5mI6bJyNeZpQLdnAab0j4ZZ5cebbBuO34g4ymelWX5nZeA6xsOEttvA8aDysV8Mg
	k2jQ==
X-Gm-Message-State: ABUngvfSrUARTG7B13vxVDKQJla3wr3149Z9Arg/Hs4H5+PLYU8c/qpPnCrvPyzlv9TykQ==
X-Received: by 10.99.153.26 with SMTP id d26mr14461345pge.44.1479438732596;
	Thu, 17 Nov 2016 19:12:12 -0800 (PST)
Received: from ?IPv6:2601:1c0:6000:fe8:2d49:7dcd:e965:e902?
	([2601:1c0:6000:fe8:2d49:7dcd:e965:e902])
	by smtp.gmail.com with ESMTPSA id
	64sm11788310pfu.17.2016.11.17.19.12.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Nov 2016 19:12:12 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <TicoTimo@gmail.com>
References: <alpine.LFD.2.20.1611171121160.9215@localhost.localdomain>
X-Mailer: iPad Mail (14B100)
In-Reply-To: <alpine.LFD.2.20.1611171121160.9215@localhost.localdomain>
Message-Id: <FEECB22E-689E-4052-B50E-6EC453743B8B@gmail.com>
Date: Thu, 17 Nov 2016 19:12:10 -0800
To: openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (1.0)
Subject: Re: "libtest-harness-perl_3.36.bb" ... "libtap-parsser-result-bailout-perl:
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
X-List-Received-Date: Fri, 18 Nov 2016 03:12:17 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Yes. Typo.
--Tim

> On Nov 17, 2016, at 8:24 AM, Robert P. J. Day <rpjday@crashcourse.ca> wrot=
e:
>=20
>=20
>  in meta-perl/recipes-perl/libtest/libtest-harness-perl_3.36.bb, can
> i assume this line is a typo?
>=20
>    ...
>    libtap-parsser-result-bailout-perl \
>           ^^^^^^^ ?
>=20
> if so, will submit patch.
>=20
> rday
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                        http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

