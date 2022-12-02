Return-Path: <tomasz.zyjewski@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E73B9C4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 06:51:39 +0000 (UTC)
Subject: Re: [meta-python][PATCH V3 2/2] python3-uefi-firmware: add recipe for version 1.9
To: openembedded-devel@lists.openembedded.org
From: "tomzy" <tomasz.zyjewski@3mdeb.com>
X-Originating-Location: Warsaw, Mazovia, PL (84.10.27.202)
X-Originating-Platform: Linux Firefox 107
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 01 Dec 2022 22:51:32 -0800
References: <CAMKF1sqjESDw93VCuR82d4oMkETgK6tPVjwbJophgrHXeSPqwg@mail.gmail.com>
In-Reply-To: <CAMKF1sqjESDw93VCuR82d4oMkETgK6tPVjwbJophgrHXeSPqwg@mail.gmail.com>
Message-ID: <6562.1669963892263015789@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0tN4gqYc9MhS8HU0L612"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Dec 2022 06:51:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99910

--0tN4gqYc9MhS8HU0L612
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 1, 2022 at 07:59 PM, Khem Raj wrote:

>=20
> please rebase on top of master or master-next and resend

There it is https://lists.openembedded.org/g/openembedded-devel/message/999=
09

>=20
>=20
> On Thu, Dec 1, 2022 at 12:35 AM tomzy <tomasz.zyjewski@3mdeb.com> wrote:
>=20
>> Install uefi-firmware-parser tool
>>=20
>> The UEFI firmware parseer is a simple module and set of scripts for
>> parsing, extracting, and recreating UEFI firmware volumes.
>>=20
>> Signed-off-by: Tomasz =C5=BByjewski <tomasz.zyjewski@3mdeb.com>
>> ---
>> .../python/python3-uefi-firmware_1.9.bb | 17 +++++++++++++++++
>> 1 file changed, 17 insertions(+)
>> create mode 100644
>> meta-python/recipes-devtools/python/python3-uefi-firmware_1.9.bb
>>=20
>> diff --git
>> a/meta-python/recipes-devtools/python/python3-uefi-firmware_1.9.bb
>> b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.9.bb
>> new file mode 100644
>> index 000000000000..3837a17437b1
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python3-uefi-firmware_1.9.bb
>> @@ -0,0 +1,17 @@
>> +SUMMARY =3D "Various data structures and parsing tools for UEFI firmwar=
e."
>> +DESCRIPTION =3D "This package contains Python UEFI firmware parser tool=
.
>> The \
>> +UEFI firmware parser is a simple module and set of scripts for parsing,=
 \
>>=20
>> +extracting, and recreating UEFI firmware volumes. This includes parsing=
 \
>>=20
>> +modules for BIOS, OptionROM, Intel ME and other formats too."
>> +HOMEPAGE =3D " https://github.com/theopolis/uefi-firmware-parser"
>> +AUTHOR =3D "Teddy Reed <teddy@prosauce.org>"
>> +LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
>> +LIC_FILES_CHKSUM =3D "file://setup.py;md5=3D90fa5bae1547550f1c1993f651e=
da955"
>>=20
>> +
>> +SRC_URI =3D
>> "git://github.com/theopolis/uefi-firmware-parser;protocol=3Dhttps;branch=
=3Dmaster"
>>=20
>> +
>> +SRCREV =3D "502f1bada1ed11fdd1792646fda0bfafb8fa57fb"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +inherit setuptools3
>> --
>> 2.25.1
>>=20
>>=20
>>=20
>=20
>

--0tN4gqYc9MhS8HU0L612
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 1, 2022 at 07:59 PM, Khem Raj wrote:<br />
<blockquote>please rebase on top of master or master-next and resend</block=
quote>
There it is https://lists.openembedded.org/g/openembedded-devel/message/999=
09<br />
<blockquote><br />On Thu, Dec 1, 2022 at 12:35 AM tomzy &lt;tomasz.zyjewski=
@3mdeb.com&gt; wrote:<br />
<blockquote>Install uefi-firmware-parser tool<br /><br />The UEFI firmware =
parseer is a simple module and set of scripts for<br />parsing, extracting,=
 and recreating UEFI firmware volumes.<br /><br />Signed-off-by: Tomasz =C5=
=BByjewski &lt;tomasz.zyjewski@3mdeb.com&gt;<br />---<br />.../python/pytho=
n3-uefi-firmware_1.9.bb | 17 +++++++++++++++++<br />1 file changed, 17 inse=
rtions(+)<br />create mode 100644 meta-python/recipes-devtools/python/pytho=
n3-uefi-firmware_1.9.bb<br /><br />diff --git a/meta-python/recipes-devtool=
s/python/python3-uefi-firmware_1.9.bb b/meta-python/recipes-devtools/python=
/python3-uefi-firmware_1.9.bb<br />new file mode 100644<br />index 00000000=
0000..3837a17437b1<br />--- /dev/null<br />+++ b/meta-python/recipes-devtoo=
ls/python/python3-uefi-firmware_1.9.bb<br />@@ -0,0 +1,17 @@<br />+SUMMARY =
=3D "Various data structures and parsing tools for UEFI firmware."<br />+DE=
SCRIPTION =3D "This package contains Python UEFI firmware parser tool. The =
\<br />+UEFI firmware parser is a simple module and set of scripts for pars=
ing, \<br />+extracting, and recreating UEFI firmware volumes. This include=
s parsing \<br />+modules for BIOS, OptionROM, Intel ME and other formats t=
oo."<br />+HOMEPAGE =3D "<a href=3D"https://github.com/theopolis/uefi-firmw=
are-parser&quot;" target=3D"_blank" rel=3D"noopener">https://github.com/the=
opolis/uefi-firmware-parser"</a><br />+AUTHOR =3D "Teddy Reed &lt;teddy@pro=
sauce.org&gt;"<br />+LICENSE =3D "BSD-2-Clause &amp; BSD-3-Clause"<br />+LI=
C_FILES_CHKSUM =3D "file://setup.py;md5=3D90fa5bae1547550f1c1993f651eda955"=
<br />+<br />+SRC_URI =3D "git://github.com/theopolis/uefi-firmware-parser;=
protocol=3Dhttps;branch=3Dmaster"<br />+<br />+SRCREV =3D "502f1bada1ed11fd=
d1792646fda0bfafb8fa57fb"<br />+<br />+S =3D "${WORKDIR}/git"<br />+<br />+=
inherit setuptools3<br />--<br />2.25.1<br /><br /><br /></blockquote>
</blockquote>

--0tN4gqYc9MhS8HU0L612--

