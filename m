Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f181.google.com (mail-ua0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 924D7731DF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 14:59:47 +0000 (UTC)
Received: by mail-ua0-f181.google.com with SMTP id l94so93256423ual.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 07:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=Ds3DmMeSjHszTnIQZsTVmvFTHwRLl2sf9VCAPglRc1k=;
	b=Gs/kAi7D66sjyK2SBQKuD8EzQT9kY4VW5o00FmGkvIaS/ugjqsr6q+e+gPIvsFuykg
	YpppyUOZo6sXdPVF9KpnH987gUBhRyZTOirZyWrfi7h2xh/L7wjNw042zMSOinA7zN3d
	6Gr3V/CMsRVWbmo8iDEyDWWCn+IJTc4bh5pFAe9+I0F99aAz9cwmx11arqWIYbBVRzGv
	PlRkRkIwFsEMehNAPGEkbhqYr53iILmZKMD8wLfmM70psffYMauLANncGNfV6XEoHiMx
	ABazOidfcMzn8ayxdUwwMOmbEQTcTrk2IGnn63JfZ6J2z+f1J9csxuNwZ4gTZ1Sm0fQk
	Xcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=Ds3DmMeSjHszTnIQZsTVmvFTHwRLl2sf9VCAPglRc1k=;
	b=a//4Ox69TXWOVOsrbx3K1z6UUdCJIetpH/9VNCPrKd7LCfw34PSEz6C1PoIj+t7Q8U
	Fsbet3R5UfN+Z4buF4JKlwla3LV9jjgF9eKy1RyDW3dq9twlm/wrkQLNzcX7NbnIxlnF
	IfH3wsCNKUTHjLvx637rq/rXyjfdb+mpnoGu0SQ56RtZ0X4eTJpztHDZdwvfMXFfrrdf
	kF5fuFc741eViYCioySmUNgoa85V+zJJ2NcSM58/92o0Js8sCvchhxpubXeolKaxIubL
	BXewRbUJO21GlqwJEiO2oCjykyY8sQtP3tO690YjlQYYjJGBQZDw24CFsWAvAjPwzNKL
	FKGA==
X-Gm-Message-State: AE9vXwMjSxf7YE1pjWaUwIKJ1izcMH7iujulniRlHVk1eK9x0HCtCzCaF3N6JUypNsIpoPSXr1wQrR+SHoZnhA==
X-Received: by 10.31.199.67 with SMTP id x64mr5757722vkf.124.1472655587276;
	Wed, 31 Aug 2016 07:59:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Wed, 31 Aug 2016 07:59:46 -0700 (PDT)
In-Reply-To: <20160831143530.gy6guxm6rlbhhr6m@jama>
References: <20160829205253.17988-1-Martin.Jansa@gmail.com>
	<1472546366.8449.19.camel@andred.net>
	<CALbNGRSJx4MD=SekttxB7H1PjEUTgaQfCnBtXu+t-YGX9BKVLw@mail.gmail.com>
	<20160831143530.gy6guxm6rlbhhr6m@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 31 Aug 2016 16:59:46 +0200
Message-ID: <CALbNGRR1y9irePnmFUF9pE6Qk_X5T56YQTbOf16uQ4zG10jLpQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] geany-plugins: include GPLv3 in the main LICENSE
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
X-List-Received-Date: Wed, 31 Aug 2016 14:59:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 31, 2016 at 4:35 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, Aug 30, 2016 at 10:41:29AM +0200, Andreas M=C3=BCller wrote:
>> On Tue, Aug 30, 2016 at 10:39 AM, Andr=C3=A9 Draszik <git@andred.net> wr=
ote:
>> > On Mo, 2016-08-29 at 22:52 +0200, Martin Jansa wrote:
>> >> * since last changes in oe-core LICENSE variable needs to list all
>> >> licenses used
>> >>   by individual packages otherwise bitbake warning like this is shown=
:
>> >>   WARNING: meta-openembedded/meta-oe/recipes-devtools/geany/geany-
>> >> plugins_1.27.bb: LICENSE_geany-plugins-commander includes licenses (G=
PLv3)
>> >> that are not listed in LICENSE
>> >>   as possible improvement you can set LICENSE to GPLv2 to all plugins
>> >>   which are GPLv2-only, because now they will "inherit" both GPLv2 &
>> >>   GPLv3 which sucks as described here:
>> >>   https://www.mail-archive.com/openembedded-core@lists.openembedded.o=
rg/ms
>> >> g81645.html
>> >>
>> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> >> ---
>> >>  meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb | 2 +-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >> diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb b/m=
eta-
>> >> oe/recipes-devtools/geany/geany-plugins_1.27.bb
>> >> index 9a39150..5e1e721 100644
>> >> --- a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
>> >> +++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
>> >> @@ -1,7 +1,7 @@
>> >>  DESCRIPTION =3D "A fast and lightweight IDE"
>> >>  HOMEPAGE =3D "http://plugins.geany.org/"
>> >>  # majority's default
>> >
>> >      ^^^^^^^^^^
>> > To avoid confusion, it'd be good to remove this comment as well as it'=
s not
>> > only the majority of licenses anymore
>> >
>> > Cheers,
>> > Andre'
>> >
>> >
>> >> -LICENSE =3D "GPLv2"
>> >> +LICENSE =3D "GPLv2 & GPLv3"
>> >>
>> >>  DEPENDS =3D "geany lua libxml2 libsoup-2.4 vte enchant intltool-nati=
ve
>> >> libassuan gpgme"
>> >>
>> >> --
>> >> 2.9.2
>> >>
>> And probably a note that 90% of license information is wrong...
>
> There are more issues in geany-plugins:
>
> geany-plugins-1.27: geany-plugins: Files/directories were installed but n=
ot shipped in any package:
>   /usr/lib/geany/git-changebar.so
> Please set FILES such that these items are packaged. Alternatively if the=
y are unneeded, avoid installing them or delete them within do_install.
> geany-plugins: 1 installed and not shipped files. [installed-vs-shipped]
> geany-plugins-1.27: geany-plugins-scope rdepends on libvte9, but it isn't=
 a build dependency, missing vte9 in DEPENDS or PACKAGECONFIG? [build-deps]
> geany-plugins-1.27: geany-plugins-debugger rdepends on libvte9, but it is=
n't a build dependency, missing vte9 in DEPENDS or PACKAGECONFIG? [build-de=
ps]
> geany-plugins-1.27: geany-plugins-multiterm rdepends on libvte9, but it i=
sn't a build dependency, missing vte9 in DEPENDS or PACKAGECONFIG? [build-d=
eps]
>
> It would be nice if someone actually using it send some fixes.
>
> If nobody does in next week, I'll add PNBLACKLIST.
>
Heard :) I will fix it. Don't ask when - my master images are broken
as never seen before thanks to gcc-6 and cmake modifications.

Andreas

