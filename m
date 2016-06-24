Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id E851160088
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jun 2016 23:16:45 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id hl6so41247166pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Jun 2016 16:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=IXp+xK5UzHMRQ8vWXWlCipCKZ25KKw8KjiX43DuZ4AI=;
	b=bqW9hp4Q64lU5UyhKiqOclMpdm//iIzsqjPieC1NYku5UOuNuVHtBbHMRD5ItSuDxV
	3M1VNJKvjWanX4JkQdGSCS1v755Ll0wwVoY501nU/F5nVsUM0jT4uSkry9jW5CogPlYl
	43GKVkQ6wbuWeZzIyaSmbrNJlUSPr+wPinoxiZuf/HBLgk0S7RrTaRiDloM1dr9bTFHV
	WYlnR41ZNXJIUezE5DQpJ10OOLThLCbg+WM3jiXENPo/Ulxs7sCebe9HTs6dWMwIKeSd
	Ii2m6K7uG1OCKhg8W/EpvVScxyOHcktnaQqu7fUYJFyYnnTdYRBQUR2aEPeUL8ZYFEzi
	5/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=IXp+xK5UzHMRQ8vWXWlCipCKZ25KKw8KjiX43DuZ4AI=;
	b=kDouGoiuS0WJTrfuGtY0ZtvUESaXZXrDqKub0G2naz+hdR+8F1YtAZ1uyiC0qdm+YU
	FTZ1AKKp8Wq0erIC09V3rNk+2NOwo061J33d5Wc/b8InfYSe2RDIuNdOxPypIrxjQkQe
	HcbExpGkH7LtCw7K3nyhj3mXUTm5gO1VA8C9W5QUjE21r9vVJFkOFR4W0vDfN7zet5rT
	315YM3QbFkodlECvU3GGbVRYMCV6Z5YwU3spHAoWOxcJCqqJ5UlZWLD3AJ5YiBGDuDDn
	rxf5akDYh9F/LGIBBj0SceeJjW5MOXLc/95B3mHCacJehycBt65esM+/VlphYjZ4W3EU
	rDGA==
X-Gm-Message-State: ALyK8tKllvIUcVdptDvont88ZnS8UonxLn9lHGsE4JbYxNzDAz2zOA20n5m9kuNOnlndgw==
X-Received: by 10.66.216.202 with SMTP id os10mr11766066pac.91.1466810205929; 
	Fri, 24 Jun 2016 16:16:45 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:7d5d:d458:6a2b:7266?
	([2601:646:8882:b8c:7d5d:d458:6a2b:7266])
	by smtp.gmail.com with ESMTPSA id
	e14sm2017942pfb.89.2016.06.24.16.16.44
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Jun 2016 16:16:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <BLU168-W73DAEB90097F5A05DC7281EB2E0@phx.gbl>
Date: Fri, 24 Jun 2016 16:16:37 -0700
Message-Id: <8209EA45-A463-4DA0-A3D6-706DDD5FF0C0@gmail.com>
References: <BLU168-W73DAEB90097F5A05DC7281EB2E0@phx.gbl>
To: Sridhar Pitchai <sridhar.pitchai@outlook.com>
X-Mailer: Apple Mail (2.3124)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] go toolchain
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
X-List-Received-Date: Fri, 24 Jun 2016 23:16:46 -0000
X-Groupsio-MsgNum: 61961
Content-Type: multipart/signed;
	boundary="Apple-Mail=_305F511D-625C-43D5-864D-A3F856FABCBD";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_305F511D-625C-43D5-864D-A3F856FABCBD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1

can you try

https://github.com/kraj/oe-meta-go/commits/master =
<https://github.com/kraj/oe-meta-go/commits/master>

> On Jun 24, 2016, at 4:06 PM, Sridhar Pitchai =
<sridhar.pitchai@outlook.com> wrote:
>=20
> Hi,
> does someone have good go meta layer. I have experimented with meta-go =
and meta-golang, not able to make it work it.
>=20
> meta-go : bootstrap 1.4 works but the native go 1.5.3 not working.
>=20
> meta-golang: i am not able to make it work even with qemu x86.
>=20
> any suggestion appreciated.
>=20
> Thanks,
> Sridhar
> --
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org <mailto:yocto@yoctoproject.org>
> https://lists.yoctoproject.org/listinfo/yocto =
<https://lists.yoctoproject.org/listinfo/yocto>

--Apple-Mail=_305F511D-625C-43D5-864D-A3F856FABCBD
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldtv1kACgkQuwUzVZGdMxSfvwCbBiSHYT5a+DjjxcCQ3AVIjk3h
mo4An2pwSyK3xavpjLlcoNkmgzP3HyHU
=95KS
-----END PGP SIGNATURE-----

--Apple-Mail=_305F511D-625C-43D5-864D-A3F856FABCBD--
