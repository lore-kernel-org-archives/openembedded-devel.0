Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id C0BFD77EA6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 08:28:27 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id x23so30554532wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 01:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ytRezi19J0sA6EXOPNk0mB0GHx+w6cT3DSf7oKQgnxM=;
	b=iqVC6bR3mqgJea2YRedYZ31/TFYSP+TpP6vtbTz0tX5fyitp1vb0NWVMl++NCFct+H
	8Mfbk8Rjq3qNKUbzWSb0tP4xCrjJ9rqLaSTr0ZpFc+Kw8yxpSu+zfTLoDWAihRgsxkXl
	uImTdY1kPX4gwj40Wh1tEGdEdK9uHt2CIV919gBronANCEMzCSIoVnvW+3dPxzTyeN2r
	kwyQrRoANPdfJ/R5QYLB4Ak0X2tisilIBshGi+t/xE4lsj1TGQEOY7GY+AR2h9xAB8T8
	N1prD2sztX6OvbOqnYW6ylwt5+pM8VMvQh+hW+6FsWwtpe8NHKHrHV9lsIKcR2i4D29u
	li9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ytRezi19J0sA6EXOPNk0mB0GHx+w6cT3DSf7oKQgnxM=;
	b=B0laAAMOv7oK4WuhhxhQT9FA0NuzRWcoUSXHnGbvc5h546ZWymYz6BL2Fj9oZ04f96
	xI38QMTl0iyNiyEKhxDFEUQo6fRFWhG3KMfjn8IkFurl/EXDxzFK0hUYeT+R0D3DFQMf
	/H7/eNjYgpJ++rvnkp/5I7dVd2ttdweVtL5IZNPOco32+nElC1RWn2x473o0yvXIJHuT
	U64oE0vEisO2fzQCMazibOD7ZBD/TxongW6SNezlRkn2U90mn7VqA2IvJSdAN95U9WWm
	tAzUkS18R7cfcwbNv2JQz04ZE8IG+kGmnIfHj1vSOomB+B03NexJpa3pXFBrECB94byP
	asLg==
X-Gm-Message-State: AIVw111PDSrR4LBhLdoW2l5bc19seUEQahr4ziR6XZqKl3o5MkTL8112
	BIX3IhAp/ArYa0AsneVR1ZInYcGMgA==
X-Received: by 10.223.136.11 with SMTP id d11mr8829387wrd.73.1499761708426;
	Tue, 11 Jul 2017 01:28:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.63.69 with HTTP; Tue, 11 Jul 2017 01:28:27 -0700 (PDT)
In-Reply-To: <CA+chaQeFbZrhDVUbRZN4Bu35UjNrVheoLq+viXdEvUUrYyJJ5Q@mail.gmail.com>
References: <20170706093039.30435-1-johannes.pointner@br-automation.com>
	<CAD4b0_LYeFonQzv7bqTZxO=vq0fwcHtEw49ZDL_vDuki-UXH4w@mail.gmail.com>
	<CAHvQdo3L34KbWREUuVAn+SqrSo6Q3UMwCvSKiX=4Va6s9htFQw@mail.gmail.com>
	<CA+chaQeFbZrhDVUbRZN4Bu35UjNrVheoLq+viXdEvUUrYyJJ5Q@mail.gmail.com>
From: Johannes Pointner <h4nn35.work@gmail.com>
Date: Tue, 11 Jul 2017 10:28:27 +0200
Message-ID: <CAHvQdo04jut3Jj9tydQUh5j9t8jXCAMhp6+qq+fJ0WfEA_ec+A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libtinyxml2: upgrade to 5.0.1
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
X-List-Received-Date: Tue, 11 Jul 2017 08:28:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thx Martin,
this does the trick.
I'll send a v2

2017-07-11 9:06 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
> Just FILES_${PN}-dev +=3D "${libdir}/cmake/" should be enough.
>
> On Tue, Jul 11, 2017 at 8:24 AM, Johannes Pointner <h4nn35.work@gmail.com=
>
> wrote:
>>
>> 2017-07-11 8:13 GMT+02:00 Maciej Borz=C4=99cki <maciej.borzecki@rndity.c=
om>:
>> > On Thu, Jul 6, 2017 at 11:30 AM, Johannes Pointner
>> > <johannes.pointner@br-automation.com> wrote:
>> >> Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com=
>
>> >> ---
>> >>  .../{libtinyxml2_4.0.1.bb =3D> libtinyxml2_5.0.1.bb}          | 13
>> >> ++++++++++++-
>> >>  1 file changed, 12 insertions(+), 1 deletion(-)
>> >>  rename meta-oe/recipes-support/libtinyxml2/{libtinyxml2_4.0.1.bb =3D=
>
>> >> libtinyxml2_5.0.1.bb} (63%)
>> >>
>> >> diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_4.0.1.bb
>> >> b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
>> >> similarity index 63%
>> >> rename from meta-oe/recipes-support/libtinyxml2/libtinyxml2_4.0.1.bb
>> >> rename to meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
>> >> index 3a6659815..edf836814 100644
>> >> --- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_4.0.1.bb
>> >> +++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_5.0.1.bb
>> >> @@ -6,10 +6,21 @@ LIC_FILES_CHKSUM =3D
>> >> "file://tinyxml2.cpp;endline=3D22;md5=3Dc19221dbd8a66ad3090462af4
>> >>
>> >>  SRC_URI =3D "git://github.com/leethomason/tinyxml2.git"
>> >>
>> >> -SRCREV =3D "74d44acb176f8510abf28ee0a70961eb26631988"
>> >> +SRCREV =3D "37bc3aca429f0164adf68c23444540b4a24b5778"
>> >>
>> >>  S =3D "${WORKDIR}/git"
>> >>
>> >>  inherit cmake
>> >>
>> >> +FILES_${PN} =3D " \
>> >> +    ${libdir}/lib*${SOLIBS} \
>> >> +    ${includedir}/* \
>> >
>> > pretty sure whatever is in ${includedir} it should be a part of -dev
>> > package.
>> You are right.
>> But this would still leave us with this rule:
>> FILES_${PN}-dev =3D " \
>>     ${includedir}/* \
>>     ${libdir}/lib*${SOLIBSDEV} \
>>     ${libdir}/cmake/* \
>>     ${libdir}/pkgconfig/* \
>>     "
>> Is this OK?
>> >
>> >> +    "
>> >> +
>> >> +FILES_${PN}-dev =3D " \
>> >> +    ${libdir}/lib*${SOLIBSDEV} \
>> >> +    ${libdir}/cmake/* \
>> >> +    ${libdir}/pkgconfig/* \
>> >> +    "
>> >> +
>> >>  BBCLASSEXTEND =3D "native"
>> >> --
>> >> 2.13.2
>> >>
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> >
>> >
>> > --
>> > Maciej Borzecki
>> > RnDity
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

