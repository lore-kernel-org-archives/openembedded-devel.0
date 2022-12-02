Return-Path: <tomasz.zyjewski@3mdeb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79DDC4167B
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 10:05:00 +0000 (UTC)
Subject: Re: ['meta-python][PATCH V2' 2/2] python3-uefi-firmware: add recipe for version 1.9
To: openembedded-devel@lists.openembedded.org
From: "tomzy" <tomasz.zyjewski@3mdeb.com>
X-Originating-Location: Warsaw, Mazovia, PL (84.10.27.202)
X-Originating-Platform: Linux Firefox 107
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 02 Dec 2022 02:04:54 -0800
References: <e1f4faea-d440-c548-9fe5-529651d05fdc@bootlin.com>
In-Reply-To: <e1f4faea-d440-c548-9fe5-529651d05fdc@bootlin.com>
Message-ID: <4965.1669975494771605239@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="CyIUnnh5rRWGyffmZaFc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Dec 2022 10:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99913

--CyIUnnh5rRWGyffmZaFc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 2, 2022 at 10:56 AM, Michael Opdenacker wrote:

>=20
> Hi Tomasz

Hi

>=20
> Thanks for the patches!
>=20
> On 12/1/22 09:24, tomzy wrote:
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
>=20
> However, if I apply your patch through "git am", the author of the
> commit will be:
> tomzy <tomasz.zyjewski@3mdeb.com>
> instead of
> Tomasz =C5=BByjewski <tomasz.zyjewski@3mdeb.com>
>=20
> Because of this issue, the maintainer has to manually fix this field
> when accepting your patch. Worse, if he doesn't catch this, that's
> harder to fix afterwards.

I was not aware of this issue. I must have missed it in guidelines. Sorry f=
or that!
>=20
>=20
> You should be able to fix this by running:
> git config --global sendemail.from "tomasz.zyjewski@3mdeb.com"
>=20
> This should add a "From" field to the sent patch which "git am" should
> be able to match with your name.
> See
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#S=
ending_using_git-send-email
>=20
>=20
> Could you try to send an update (don't hesitate to send a private one to
> me first)?

Thank you, I will try that. Should I use `michael.opdenacker@bootlin.com` ?

>=20
>=20
> Thanks in advance
> Michael.
>=20
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

--CyIUnnh5rRWGyffmZaFc
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 2, 2022 at 10:56 AM, Michael Opdenacker wrote:<br />
<blockquote>Hi Tomasz</blockquote>
Hi<br />
<blockquote>Thanks for the patches!<br /><br />On 12/1/22 09:24, tomzy wrot=
e:<br />
<blockquote>Install uefi-firmware-parser tool<br /><br />The UEFI firmware =
parseer is a simple module and set of scripts for<br />parsing, extracting,=
 and recreating UEFI firmware volumes.<br /><br />Signed-off-by: Tomasz =C5=
=BByjewski &lt;tomasz.zyjewski@3mdeb.com&gt;<br />---<br />.../python/pytho=
n3-uefi-firmware_1.9.bb | 17 +++++++++++++++++<br />1 file changed, 17 inse=
rtions(+)<br />create mode 100644 meta-python/recipes-devtools/python/pytho=
n3-uefi-firmware_1.9.bb</blockquote>
However, if I apply your patch through "git am", the author of the <br />co=
mmit will be:<br />tomzy &lt;tomasz.zyjewski@3mdeb.com&gt;<br />instead of<=
br />Tomasz =C5=BByjewski &lt;tomasz.zyjewski@3mdeb.com&gt;<br /><br />Beca=
use of this issue, the maintainer has to manually fix this field <br />when=
 accepting your patch. Worse, if he doesn't catch this, that's <br />harder=
 to fix afterwards.</blockquote>
I was not aware of this issue. I must have missed it in guidelines. Sorry f=
or that!
<blockquote>You should be able to fix this by running:<br />git config --gl=
obal sendemail.from "tomasz.zyjewski@3mdeb.com"<br /><br />This should add =
a "From" field to the sent patch which "git am" should <br />be able to mat=
ch with your name.<br />See <br /><a href=3D"https://www.openembedded.org/w=
iki/How_to_submit_a_patch_to_OpenEmbedded#Sending_using_git-send-email" tar=
get=3D"_blank" rel=3D"noopener">https://www.openembedded.org/wiki/How_to_su=
bmit_a_patch_to_OpenEmbedded#Sending_using_git-send-email</a><br /><br />Co=
uld you try to send an update (don't hesitate to send a private one to <br =
/>me first)?</blockquote>
Thank you, I will try that. Should I use `michael.opdenacker@bootlin.com` ?=
<br />
<blockquote><br />Thanks in advance<br />Michael.<br /><br />-- <br />Micha=
el Opdenacker, Bootlin<br />Embedded Linux and Kernel engineering<br /><a h=
ref=3D"https://bootlin.com" target=3D"_blank" rel=3D"noopener">https://boot=
lin.com</a></blockquote>

--CyIUnnh5rRWGyffmZaFc--

