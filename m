Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 86BC660746
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 08:33:07 +0000 (UTC)
Received: by mail-ua0-f173.google.com with SMTP id k90so20650596uak.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 01:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=FuK0HXoV8ckNO43LZjjPc4B9JXTdXjc/xFjLp6GhC38=;
	b=JsPjm1wibwvitPtGBbPmCOwG2/QK3zTsDOIgSHe6CohvqBufbHSjFP7M8OuAcUJjPw
	IX+nITfUGjI/rBUTAyUrIuf/cwXap+nCx2gd8KqebZ5ic7bsVr5X5PQfbVjZ9iRTOCa7
	Ua7Hh7lJWS16OYrKapm2tnUMJomm+RsnhqPDSGDM8xSf39CCDmh1+MLF/5Zutb/rL4Fw
	BfthBB5M4maHAqyJ+RgO7iK/mJM4mn+kcGQE0SOp2asvmSEC7vBY+pKZqHKP3r6SBIqw
	WacV5gA1WlMo/wfX/Io/XwgQ22p/5b5XWCfl0vS2w4wPJZyKF2zpttLDpSGQgQoeRlNY
	i8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=FuK0HXoV8ckNO43LZjjPc4B9JXTdXjc/xFjLp6GhC38=;
	b=V0zV1bj4dseTe5pYSxQ0HL/Jp3vg+VTZtgxxOo22jAkEVCcj3nNWdeWTcA2esWF5Mg
	I1xRovNgVnBImBVLegd1l3C1TyQRoImr9paJGPI6w2VNcSSpMne44AsSsUNwHciDuzz+
	bKhujqr6uHocc772M/TYlO1U1KojWnytaYIam8RqnmLgUCZJQC9XxcA/cfravM5k+iBX
	XuqZAD4ytYIJs77Ml1R532zN2jmOG5Vy0wIakvQf93Aq0LBsvSb1uQszq3WF7sFIbf0E
	JTa0rcCPKKSIiJDoptbX+BWUH1V7tjx8aBEfgYcXiYWfkhm/l3EaznBzw1qdalpzz7EP
	5yLA==
X-Gm-Message-State: AE9vXwPudHLPYMQi289VNups7r+Az5OuL22Dv4Be+uASnS2aB9hxlgYgjimSXfQil/toVfLnHlGwVqXKCOQ37w==
X-Received: by 10.31.228.7 with SMTP id b7mr1413297vkh.30.1472545987447; Tue,
	30 Aug 2016 01:33:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Tue, 30 Aug 2016 01:33:06 -0700 (PDT)
In-Reply-To: <CA+chaQfp56r5TtypUDh3Kxhi6r3_BeV9WXqpeU1Y1dJb6QR9+g@mail.gmail.com>
References: <20160829205253.17988-1-Martin.Jansa@gmail.com>
	<CALbNGRQ=PeJhSCj7uGd2Lgkx6MPZ8numfrLezWxH12x_1fSkOQ@mail.gmail.com>
	<CA+chaQfp56r5TtypUDh3Kxhi6r3_BeV9WXqpeU1Y1dJb6QR9+g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 30 Aug 2016 10:33:06 +0200
Message-ID: <CALbNGRTWoHZ7_2cb0iNiX90WPt2QKGsMd+iNY9QvvrSXMh3FwA@mail.gmail.com>
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
X-List-Received-Date: Tue, 30 Aug 2016 08:33:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 30, 2016 at 10:28 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> The warning is right in what it says.
>
> The LICENSE variable now needs to contain all LICENSEs used in the recipe
> (all packages), see discussion on oe-core ML.
>
> On Tue, Aug 30, 2016 at 10:24 AM, Andreas M=C3=BCller <
> schnitzeltony@googlemail.com> wrote:
>
>> On Mon, Aug 29, 2016 at 10:52 PM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> > * since last changes in oe-core LICENSE variable needs to list all
>> licenses used
>> >   by individual packages otherwise bitbake warning like this is shown:
>> >   WARNING: meta-openembedded/meta-oe/recipes-devtools/geany/geany-
>> plugins_1.27.bb: LICENSE_geany-plugins-commander includes licenses
>> (GPLv3) that are not listed in LICENSE
>> >   as possible improvement you can set LICENSE to GPLv2 to all plugins
>> >   which are GPLv2-only, because now they will "inherit" both GPLv2 &
>> >   GPLv3 which sucks as described here:
>> >   https://www.mail-archive.com/openembedded-core@lists.
>> openembedded.org/msg81645.html
>> >
>> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> > ---
>> >  meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
>> b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
>> > index 9a39150..5e1e721 100644
>> > --- a/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
>> > +++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.27.bb
>> > @@ -1,7 +1,7 @@
>> >  DESCRIPTION =3D "A fast and lightweight IDE"
>> >  HOMEPAGE =3D "http://plugins.geany.org/"
>> >  # majority's default
>> > -LICENSE =3D "GPLv2"
>> > +LICENSE =3D "GPLv2 & GPLv3"
>> >
>> >  DEPENDS =3D "geany lua libxml2 libsoup-2.4 vte enchant intltool-nativ=
e
>> libassuan gpgme"
>> >
>> > --
>> > 2.9.2
>> >
>> NAK: The warning is wrong see recipe below contains
>>
>> LICENSE_${PN}-commander =3D "GPLv3"
>>
Ahh another 'design' decision I have problems with..

Andreas

