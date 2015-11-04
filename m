Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 406E860125
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 01:26:22 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so35082511pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Nov 2015 17:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=Sd6tqtJLxVtvNeHbW4CKkhDg7QlMjstefkclRF5KEYI=;
	b=TxKRYXaH71nm3KKwVIdf5oLh6qPIQo0NDK5GIPc1i3GkkeNhzdDqd0i5H3rv/GAQtf
	inrSaDdDwFqNAagM+wGYsSeWJ1k1o1uqdVVSroUUEphiRLrOZdFHGiOQQlJwPrI7JtWk
	Xj6MiD2rGvoy2w7v5/1ev311oyf5rHE9aZ5A/uEoWvN9K1yDUIGzClYMN0NnbZvN96aj
	QDo2l/w7xifcQMoqeGQRwIPMrEEh6Z+DT4Kz7+HOB4Zk2aB5TAhUAV4q/06kAuDJ2auH
	6Q+AOvXbcmbqC9IFsHY0bJp7/gmEAEkFTJcfnWYxzZ6nNaeLs/cFkW9t02jNXmZ+V3nZ
	m/bQ==
X-Received: by 10.66.218.129 with SMTP id pg1mr37642013pac.156.1446600382923; 
	Tue, 03 Nov 2015 17:26:22 -0800 (PST)
Received: from ?IPv6:2601:646:8601:4580:a12d:1fd7:dae:dd5c?
	([2601:646:8601:4580:a12d:1fd7:dae:dd5c])
	by smtp.gmail.com with ESMTPSA id
	yq2sm31779208pbb.39.2015.11.03.17.26.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Nov 2015 17:26:21 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3106\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CADseiPkMQaDUwMWP5V67XW0=0sW3i5TfYk72eZ8OafdM2dO9Ww@mail.gmail.com>
Date: Tue, 3 Nov 2015 17:26:17 -0800
Message-Id: <A3B887A5-3F5D-4B23-AAC2-A2F1EF8D3D6C@gmail.com>
References: <CADseiPkMQaDUwMWP5V67XW0=0sW3i5TfYk72eZ8OafdM2dO9Ww@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3106)
Subject: Re: [meta-browser] chromium libffmpeg
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
X-List-Received-Date: Wed, 04 Nov 2015 01:26:23 -0000
X-Groupsio-MsgNum: 58274
Content-Type: multipart/signed;
	boundary="Apple-Mail=_929CA7AC-C3A0-4EB2-A4B7-E753304DBE75";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_929CA7AC-C3A0-4EB2-A4B7-E753304DBE75
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Nov 3, 2015, at 5:12 PM, Ian Coolidge <ian@boundarydevices.com> =
wrote:
>=20
> Hello,
>=20
> In the chromium recipe, there is a package chromium-codecs-ffmpeg =
which
> puts libffmpegsumo.so in /usr/lib/chromium/. However, it only seems to =
work
> when placed in /usr/bin/chromium/.
>=20
> Is there a flag I can pass to chromium to look in /usr/lib/chromium/ =
for
> that library? What step am I missing here?
>=20

can you check the chromium script and see if it needs the lib path to be =
specified there ?

> Thanks!
> -Ian Coolidge
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_929CA7AC-C3A0-4EB2-A4B7-E753304DBE75
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlY5Xr0ACgkQuwUzVZGdMxSMoQCfWQNo6eg6TKoFvtUziyArUpJe
eHgAniusQU7MyNrhkCE6BzV7ml05sgT1
=TnQQ
-----END PGP SIGNATURE-----

--Apple-Mail=_929CA7AC-C3A0-4EB2-A4B7-E753304DBE75--
