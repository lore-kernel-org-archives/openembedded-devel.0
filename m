Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8551765CAC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2015 03:46:50 +0000 (UTC)
Received: by qkx62 with SMTP id 62so216519113qkx.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 20:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=yFDQkIOJIUvX0vZCacZJXOqoxXOPem4RulBF0Am9psw=;
	b=Rgm9FKOHcqOX3XGYLyQ65KnLejxdJj74AQnaxyfnXdHNIh8YQnM8FWRRI4CFmxoIKC
	bzndQ9M3Fb6mCjfMG27qgkm6WE1j852ovhDCXRW5zAld03e3aNYy88ziOu83WfP6b8UA
	1LuRqUNK2C1t0iViEFBvlXBbLMpvPRd+6uf9LQ7VnGsutaVsZRSTgaabyXuyWo7whpJF
	W+X4+49ZZbnisB0Aj04G7E1kpN9knA8WgOK1GZgsjBr3oXkd/HUhhE8b2hxySl73WoUy
	1vNhwkUbMaiyaawJU0d4E+t5eVzIdADlKZRQkJdejoWQW/ElEalSADbp2swZvME29aoG
	UOQg==
X-Received: by 10.229.63.200 with SMTP id c8mr22992446qci.19.1428983212243;
	Mon, 13 Apr 2015 20:46:52 -0700 (PDT)
Received: from [172.20.2.145] ([4.35.217.65])
	by mx.google.com with ESMTPSA id g34sm7447577qgd.0.2015.04.13.20.46.51
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 13 Apr 2015 20:46:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKpSHPyybmcGgm36-d_s88_vuzPzWqErrLknPEFFw2Mu_w@mail.gmail.com>
Date: Mon, 13 Apr 2015 23:46:52 -0400
Message-Id: <F0B85CB3-E0B0-40B8-9F1C-66DD05C826D6@gmail.com>
References: <CAD0=qkK3-x3CXStZkOVqOwfZioaLq+A9XwXehVT+HdLRzGPanw@mail.gmail.com>
	<CAEHkU3VM9sWOcBVynfQhesMXsXo5kQDabQuZLypxembQzfdePA@mail.gmail.com>
	<551C4F35.7020001@gmail.com>
	<CAEHkU3Xg=NSPw2gc1rmPLy3RD68BRNK5hczmS5e6tTE9gEBk+A@mail.gmail.com>
	<551DA5BA.3050505@gmail.com>
	<CAP9ODKqazzhOMQtsdKaGhA-1pNQOHNRQ2vvp_uXDtq+gce2gqg@mail.gmail.com>
	<551E4A44.7050708@gmail.com>
	<CAP9ODKr4Xz8_OLD+DKqZ1wxx4c0Rc6bdSDwqLecFnhZa2x5kVg@mail.gmail.com>
	<CAD0=qk+2f1qORQLQzD_r8p_VaF0+mAkVu+E=yz5-zzipf7RHXQ@mail.gmail.com>
	<CAP9ODKqgAQqCxNg=fWMC6iW1Ks3HDd4c-YroMVOgJ=doTmsWLQ@mail.gmail.com>
	<CAD0=qkKX-6afKD8H+sD+MrVp3LRspmuieJC8T=R57ktcnJauxw@mail.gmail.com>
	<CAP9ODKq_yN=M8-+Hbjk_NHyTGQ=oVEs=tEEQwkGWghR_LBHLfA@mail.gmail.com>
	<CAD0=qkJNOMx5Ubn25Ugrn3fg02cq3kLjNbeV5ZBKsfWtuUXbgA@mail.gmail.com>
	<CAP9ODKpSHPyybmcGgm36-d_s88_vuzPzWqErrLknPEFFw2Mu_w@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.2098)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] Trying to update openjdk-7 to icedtea 2.5.4 and jdk75b13
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
X-List-Received-Date: Tue, 14 Apr 2015 03:46:53 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Apr 13, 2015, at 8:27 AM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:
>=20
> Hello Sven,
>=20
> I really appreciate your work. Thanks for all the hard work on this :)
>=20
> On Mon, Apr 13, 2015 at 4:38 AM, Sven Ebenfeld =
<sven.ebenfeld@gmail.com> wrote:
>> After a week of testing these recipes, I fixed some issues in the new
>> recipes. Therefore I just submitted new versions of the patchset.
>> I removed the patches for uclibc as I'm unable to test it at the
>> moment. While trying to build it with uclibc, I always got errors =
with
>> compiling curl. Unfortunately I don't have the time to fix these
>> errors at the moment as we use glibc. If one uses uclibc, it may not
>> work atm.
>=20
> Khem, I have put those patches into master-next branch. Is it possible
> for you to take a look on the uClibC thing?
>=20

I don=E2=80=99t have uclibc setup either right now. post your errors in =
detail and may be there can be help


> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


