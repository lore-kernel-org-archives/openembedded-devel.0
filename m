Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6E8DF6FF91
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2016 03:46:48 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id x65so43410788pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2016 19:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=X5yCscms554pprUMqO4bdFOAoBFFRUCLUjP8r1s95UE=;
	b=UdywVsbyEIR6TisDKbLOADNisw/s3zDRm+oah2tTKMFZqCpv1XtDhYbLT3YZYgI7Rp
	ePjvLZyJUHZ9LhCReGqsjxEwCgQ7OFxHI/+lnLMv6RTCOqpvdtRwZKCmwdZ1G/jaPoua
	NLWfd3UsEl6Gr0WgB/j3MV8o81uTlZ+9Tpm7rAJ+5HzI83E6U8eraFy405me9BlLfMAy
	L/Wkm8NshG1JoJVdhmDOzGKr55cprQtul9+pxM/rNzy+GiNsp+562CVlVpKACve/KkCC
	cD9di3dzLBimEnjaJsVxBCaDW6ECXRq16d6ciXyy7UaiRJyzNSJ7Z0dXb8fHzqul7f19
	VnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=X5yCscms554pprUMqO4bdFOAoBFFRUCLUjP8r1s95UE=;
	b=ikIs7yQs4FfeSmYvg/u/VcZS7+t2xzp1TMVLiiYj6crfW/bt2+UQwL41cBrutrSNia
	ryQhNNQUxtnJopIVqsbNUxs2oEPEoqa86IuuYYsBDo1Ck6Nhw5chSkvz07Vrbe9/0Yxd
	zzh0rJBSX5MAV/3njWpNT3Ae1rPKt2o+XqEtxRd9jhONj9vrusQwZjxhwQV+qxFtPTdU
	aoZbZPqhTQeBCqTTm7VwB6Jk4i34ZjX7aecEyIzx+hDTfSCESrXN8wORDMylG/e6A/fu
	NqEsb+eJ7tIK//P3bhtirIVJCjMcLIwH+gDpgtHnXOSakFn0E4uCq4EO9rbjt02eiXFH
	jBAg==
X-Gm-Message-State: AG10YOSWuwPCUdCKaj24+C+E2NgB76NuxOwNip/46nYMqcGv9SRIZ9B09W2pAA9xhD/hxA==
X-Received: by 10.98.10.149 with SMTP id 21mr15276499pfk.75.1455853609571;
	Thu, 18 Feb 2016 19:46:49 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:cde1:d147:9ec5:6bb6?
	([2601:646:8802:5d5c:cde1:d147:9ec5:6bb6])
	by smtp.gmail.com with ESMTPSA id
	i23sm13571178pfj.68.2016.02.18.19.46.48
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Feb 2016 19:46:49 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAAPZna3WT_cz9YpCaE0iueYXCYxNd0ONRCu0=yuHLcrqUdoKaw@mail.gmail.com>
Date: Thu, 18 Feb 2016 19:46:48 -0800
Message-Id: <6E3439D2-FEE9-4286-88C5-0D7E3E2AF4B2@gmail.com>
References: <CAAPZna3WT_cz9YpCaE0iueYXCYxNd0ONRCu0=yuHLcrqUdoKaw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3112)
Subject: Re: [meta-python] Python Flask recipes
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
X-List-Received-Date: Fri, 19 Feb 2016 03:46:49 -0000
X-Groupsio-MsgNum: 60020
Content-Type: multipart/signed;
	boundary="Apple-Mail=_36223BBF-8549-4E39-96CC-1D1378E6AB96";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_36223BBF-8549-4E39-96CC-1D1378E6AB96
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 18, 2016, at 10:33 AM, Fabio Berton =
<fabio.berton@ossystems.com.br> wrote:
>=20
> Hi all!
>=20
> I noticed that a few days ago were added some python-flask recipes.
>=20
> I've been maintaining a layer with python-flask recipes, hosted here
> http://code.ossystems.com.br/gitweb?p=3Dmeta-python-flask.git;a=3Dsummar=
y
>=20
> There are recipes in meta-python-flask that were added to meta-python
> and I want to simplify maintenance and avoid duplicate recipes.
>=20
> So, do I send recipes from meta-python-flask to meta-python or we move =
all
> python-flask recipes from meta-python to meta-python-flask, using a =
layer
> only for Flask web framework?

Here is a hierarchy one can envision

1. Core python runtime support - Oe-core
2. python extended modules and infrastructure - meta-python

now if you think this framework is quite commonly used and is kind of =
core
to python world, its fine to have it in meta-python, if you think its
too specific then move the common packages to meta-python
and maintain it as a separate layer

--Apple-Mail=_36223BBF-8549-4E39-96CC-1D1378E6AB96
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlbGkCgACgkQuwUzVZGdMxT5VQCdHSfzLEEopN/mSyjzdLftO8Fi
02UAoJMx0mkAxk8zOi5Uqh4UfnLgHZT+
=u+OB
-----END PGP SIGNATURE-----

--Apple-Mail=_36223BBF-8549-4E39-96CC-1D1378E6AB96--
