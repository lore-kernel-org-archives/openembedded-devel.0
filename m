Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0686373169
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Apr 2016 08:59:01 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id zm5so108305285pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Apr 2016 01:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=efVPLrn5dx936RmIgMyMqM8t8kXqkyvVT41JWEcpMxU=;
	b=IDNfQvS4ypsGLrO/fvVnyZsJfQiwyh3y7P9Zgl1Z+Y7R3M6WHR+5YTVvqQOzC81Dyl
	kYaRidTTncoguV4KOa+arhClKZoMDOhe0m+TM/C1Qwz65Mwox9g1AopuVrHAhcbXGn7N
	m4ShRXgs6q+KbuwHKVl0nVywIldigbJ1ykkE2iTGjEDQdZS/y4tnY2pmyd904MlRNgcL
	9Q5VE6neZECadAqKvorsGBpIlhCSEd+5L48x2byuj6hnHByMAlS/3Mlq5cQhINPOyC/c
	H9hJVCiIXi+p64nNTqwvZfh6lQGihe9r9nCo72bNtIhmip5dXLuGp20nfTyoYtWG4w0C
	xrtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=efVPLrn5dx936RmIgMyMqM8t8kXqkyvVT41JWEcpMxU=;
	b=IRDdxw6WY/VLYLyhjJaSres0s5Ev9mVOHECk/b+O82j7cLqQB02/bCvnZ3tqWNtJCM
	bLRQqamFtaIufzPRYFUN8nsmNlb9p83uFIkH2b6hiQUZMuKGiV4/b7aqUQ1tpK1Tyjrx
	gQ18gNKFlwLedmsOG7RwENIlNHhPvBPv0OhcbW/nFcpGHBXRIB+bObCLoga7qqKH/zk7
	GJUNGKbTvwqR4dL6tsAYc9NUMA9vjafMtSuVqWjwRLB+lEyWX4WoLM8Hu2P7XJJKJN6+
	vDVpG0zUb9AM6WFd5viAoReHN4hEiq3ajFLLNlDsRghDNaCj9pcMtRnVjQkuqEK/9ujk
	TiOQ==
X-Gm-Message-State: AD7BkJLcrPAQdEP4ZUSxZHv/jTRpm5HezWcTaKduE5O9Qeb9nZNmx8A52lhd4Tl9jCSCiw==
X-Received: by 10.66.122.100 with SMTP id lr4mr36049210pab.99.1459587542510;
	Sat, 02 Apr 2016 01:59:02 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:1156:ef7c:5e3a:2bb9?
	([2601:646:8800:5a9a:1156:ef7c:5e3a:2bb9])
	by smtp.gmail.com with ESMTPSA id
	uw2sm16395868pac.10.2016.04.02.01.59.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Apr 2016 01:59:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP71Wjweh17pbzsvA0EA9i4nZe+bWEJYSPZp3yhV90FLyh8L0g@mail.gmail.com>
Date: Sat, 2 Apr 2016 01:58:56 -0700
Message-Id: <D0CD05A6-D086-4851-8826-657800C91CB5@gmail.com>
References: <CAP71WjzNNeYY2pA5-YxtXFZJ01iPR=dgORMoYfCgWDPAA7_RsA@mail.gmail.com>
	<1BA327FE-7861-41A7-AB53-A5DBB8EF3FEA@gmail.com>
	<CAP71Wjweh17pbzsvA0EA9i4nZe+bWEJYSPZp3yhV90FLyh8L0g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: openbox themes
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
X-List-Received-Date: Sat, 02 Apr 2016 08:59:02 -0000
X-Groupsio-MsgNum: 60801
Content-Type: multipart/signed;
	boundary="Apple-Mail=_1C1EA907-B09B-476B-BEBD-1F79C7DC8514";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_1C1EA907-B09B-476B-BEBD-1F79C7DC8514
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Apr 1, 2016, at 5:53 AM, Nicolas Dechesne =
<nicolas.dechesne@linaro.org> wrote:
>=20
> On Wed, Mar 30, 2016 at 8:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>> Do you have XDG_DATA_DIRS variable set to include /usr/share, try =
something like
>>=20
>> export XDG_DATA_DIRS=3D$XDG_DATA_DIRS:/usr/share
>>=20
>> before launching openbox, if that works then may be you should add it =
to /etc/profile
>> via a post processing hook or some such.
>=20
> that doesn't change anything. without any openbox-theme installed , it
> fails to start. I can briefly see the mouse pointer on the screen,
> before it dies.

Looking at source code it seems it needs the themes to be installed =
since it configures
to a fallback theme which is clearlooks in case a theme is not set in =
config. So
adding a RDEPENDS_${PN} on the package providing themes seems the right =
fix here.

--Apple-Mail=_1C1EA907-B09B-476B-BEBD-1F79C7DC8514
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb/idUACgkQuwUzVZGdMxQoawCcDgRZi0BnvmJuaU6kkV9QFTR7
FkIAnj12cgBXAwsi1rzgRCoMuaLSw4FT
=zIu2
-----END PGP SIGNATURE-----

--Apple-Mail=_1C1EA907-B09B-476B-BEBD-1F79C7DC8514--
