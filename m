Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 78C057453F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Mar 2018 16:35:32 +0000 (UTC)
Received: by mail-yb0-f195.google.com with SMTP id z5-v6so3854517ybo.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Mar 2018 09:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8Zuk4VLQSswTYATTN2LcL1l7FKgj9rc01bhJkhbtNWM=;
	b=crPBZoRppFAUFcA2EPWVLzsgWU1pgGK1mvCndLRtm2A5da6O0m3NmyingpMyrb+OQ1
	e7kSr4svJMzFm5z8xZ3r9IpIRAftrg1xpnX4QNY+s66VN0s4MsYUoeMXFdkqQexNNLSS
	8lSQ77NsO+5X128X4jJ8hr23qlEhvcfg65NWVD85vhXFMmm7+0SGirzan72zm+ghUgHP
	2Kxo8PIQRFAzZ9vcF1b8xYSOt3pk4VxM3Mqge6HEm/0O+3ki6FP8gm2ZNuU1ZfF5gos3
	UXPYCTFrB+DD7rUY3Q6UhNSfPtpT4tKyn7xCcupn2+Z+Gzae7po75lYlq3D+YfIcpYzS
	tyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8Zuk4VLQSswTYATTN2LcL1l7FKgj9rc01bhJkhbtNWM=;
	b=DYjiuW6Ei78FKEmV/FcqATd3xiOvTESuOmQepW5AeRWEpSeXGvotLMAbajtuvzM9kY
	StQYa2CISFyw3yyXy5K6YqaZKH/P9ENmIFVrBq1ghc4SpJsrCvvwX0BJp/b+lKCJErDQ
	PhBTD+P8um2WRi1GjH/8lxh1KeL9bajVtbSDnBZ6ySHj0jLCpWeTgc9K84RRZChVQz4S
	I9MqTSp++/yrGqIDj1BDlrY/14/MYVC8s8g3ewMos7/f6RpK6px1OgfZx7P/pGbuOAhl
	8SCrZuQZxguOmrStE3WGO6QkHRvkfpwyHqRaOkkOqVBP9iBfq8i8LZ8R+bdHkNYDR4sD
	bWLA==
X-Gm-Message-State: ALQs6tAkMU0U9c2eTvqII+pUJk88fS0/15/Cz2Wxtvwby0K36bxYdFQ+
	PwHDllPbPEKShZmySsQqj39Y8IjfEqtMv+mnobc=
X-Google-Smtp-Source: AIpwx4//YlnnT7PxzxX4qWw7QgJ5FAFIyakwX56sZQbsr3TLi6hZfz8pGElSihqSn/KG3zvJ2/maJRuXibLvvfT2iQg=
X-Received: by 2002:a25:8c3:: with SMTP id
	186-v6mr1792170ybi.145.1522514133060; 
	Sat, 31 Mar 2018 09:35:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Sat, 31 Mar 2018 09:35:32
	-0700 (PDT)
In-Reply-To: <91c71f28-b996-526e-2de1-fa7df027666c@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
	<20180330133151.25882-18-schnitzeltony@gmail.com>
	<91c71f28-b996-526e-2de1-fa7df027666c@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 31 Mar 2018 18:35:32 +0200
Message-ID: <CALbNGRRArdi-jjERvD5y+VHyhE8JF3jtmpYuyp_xGafnu3a9dg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 17/39] gtkmm3: add initial 3.22.2
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
X-List-Received-Date: Sat, 31 Mar 2018 16:35:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 31, 2018 at 6:02 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 03/30/2018 06:31 AM, Andreas M=C3=BCller wrote:
>> This is gtk3 version of gtkmm. There are no cnflicts with gtkmm for gtk2=
.
>
> This fails with:
>
>  | checking for epoxy >=3D 1.2... no
>     | configure: error: Package requirements (epoxy >=3D 1.2) were not me=
t:
>     |
>     | No package 'epoxy' found
>
> Seen with world build on arm64
>
> - armin
>
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>> ---
>>  meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>  create mode 100644 meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb
>>
>> diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb b/meta-oe/recip=
es-gnome/gtk+/gtkmm3_3.22.2.bb
>> new file mode 100644
>> index 000000000..e4bd27e58
>> --- /dev/null
>> +++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.22.2.bb
>> @@ -0,0 +1,22 @@
>> +SUMMARY =3D "C++ bindings for the GTK+ toolkit V3"
>> +HOMEPAGE =3D "http://www.gtkmm.org/"
>> +SECTION =3D "libs"
>> +
>> +LICENSE =3D "LGPLv2.1 & GPLv2"
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364=
516c \
>> +                    file://COPYING.tools;md5=3D751419260aa954499f7abaab=
aa882bbe"
>> +
>> +DEPENDS =3D "atkmm pangomm glibmm gtk+3 cairomm"
>> +
>> +BPN =3D "gtkmm"
>> +
>> +inherit gnomebase distro_features_check
>> +
>> +REQUIRED_DISTRO_FEATURES =3D "x11"
>> +
>> +SRC_URI[archive.md5sum] =3D "883e9046768b3a5afc8e365988823e77"
>> +SRC_URI[archive.sha256sum] =3D "91afd98a31519536f5f397c2d79696e3d53143b=
80b75778521ca7b48cb280090"
>> +
>> +EXTRA_OECONF =3D " --disable-documentation "
>> +
>> +FILES_${PN}-dev +=3D "${libdir}/*/include ${libdir}/*/proc/m4"
>
Ahh - OK

Have opengl in my DISTRO features so gtk3 gets libepoxy - will send out V2

Andreas

