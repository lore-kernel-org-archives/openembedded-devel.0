Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64A2CC43327
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 14:14:27 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36075.1782483266588726356
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2026 07:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=XkAqkzwc;
 spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout07.t-online.de (Postfix) with SMTP id CA3D4ECFA;
	Fri, 26 Jun 2026 16:14:24 +0200 (CEST)
Received: from [192.168.178.63] ([79.219.237.60]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wd7K0-3S733I0; Fri, 26 Jun 2026 16:14:20 +0200
Date: Fri, 26 Jun 2026 16:14:15 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH 1/2] flatpak: update 1.17.6 -> 12.18.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <RVS8HT.A0LVXYDL091D2@t-online.de>
In-Reply-To: <CAMKF1som+Et4zPsiW5X=qNYEUU2NoOr4_4TJZke0LzvVDKd9+A@mail.gmail.com>
References: <20260624163903.3376268-1-f_l_k@t-online.de>
	<CAMKF1som+Et4zPsiW5X=qNYEUU2NoOr4_4TJZke0LzvVDKd9+A@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Ad/sM2UIFJ3JnMUV25bE"
X-TOI-EXPURGATEID: 150726::1782483260-B67FBFDE-BA5B0489/0/0 CLEAN NORMAL
X-TOI-MSGID: bbef1fc9-dfbe-4d64-8b85-027f4ac04414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1782483264; i=f_l_k@t-online.de;
	bh=FctepclkLpzjeDzhJIVKp61wrxU29OqH8tN0Zk3aLJM=;
	h=Date:From:Subject:To:Cc:In-Reply-To:References;
	b=XkAqkzwcqxksnn00U+njzFVAZ/Yzys4hmMcGV+oP1wy+isJPP0O8RpYdCuwVBkMwA
	 9ZI4xQzmdkhS7VVu4SBLNqy2JAuOUuxrq0eKMI/QCxFmMDvS516068PV3HmIQs04hv
	 e7FeaNbYt13Ye0xyv+pUj//AbghkvaHyiahzg2hHkc5JpgjxMwz74+gscJwQJ9J2p3
	 Xs9RoTODtvXjuChFiZHkBp1tbgW3czJiDBhmWYZc+zCgIP5/VusFTIhoT+e1t19zJj
	 3EkBMB1HDFXlbH+O6+qNshegvZdkO+W8xqugbDsohIcy/CEr5yUxlq3Rqy2UR0X0zc
	 QzIgrVDzUucww==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Jun 2026 14:14:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127797

--=-Ad/sM2UIFJ3JnMUV25bE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Sorry

Am Do, 25. Jun 2026 um 18:55:11 -07:00:00 schrieb Khem Raj=20
<raj.khem@gmail.com>:
> this patch comes out mal-formed, please resend a working version.
>=20
> On Wed, Jun 24, 2026 at 9:39=E2=80=AFAM Markus Volk via=20
> lists.openembedded.org <http://lists.openembedded.org/>=20
> <f_l_k=3Dt-online.de@lists.openembedded.org=20
> <mailto:t-online.de@lists.openembedded.org>> wrote:
>> Changes in 1.18.0
>>  ~~~~~~~~~~~~~~~~~
>>  Released: 2026-06-08
>>=20
>>  Enhancements:
>>=20
>>  * Improve error handling and printed output of=20
>> `flatpak-coredumpctl` (#6649,
>>    #6680)
>>=20
>>  * Support the AMD vendor specific compute interface (`/dev/kfd`)=20
>> via the DRI
>>    device permission (#6648)
>>=20
>>  * Improve the output of `flatpak update` with failure causes (#6657)
>>=20
>>  * Improve startup time for fish shell integration (#6635)
>>=20
>>  * Translation updates: =E2=80=8Ezh_CN (#6671)
>>=20
>>  Bug fixes:
>>=20
>>  * Fix building when HAVE_LIBSYSTEMD but not USE_SYSTEM_HELPER is=20
>> defined (#6652)
>>=20
>>  * Ignore system bus failures in parental controls check (#6663)
>>=20
>>  * Fix some return values and replace deprecated `GTimeVal` with
>>    `g_get_real_time()` (#6646)
>>=20
>>  * Suppress an unused-result warning in the tests (#6655)
>>=20
>>  Changes in 1.17.7
>>  ~~~~~~~~~~~~~~~~~~
>>  Released: 2026-05-06
>>=20
>>  Enhancements:
>>=20
>>  * Add the new permission conditionals `has-usb-device` and=20
>> `has-usb-portal` to
>>    allow apps to drop --device=3Dall and --device=3Dusb permissions=20
>> (#6560)
>>=20
>>  * Always send the `Flatpak-Upgrade-From` header when updating=20
>> instead of
>>    freshly installing, to improve the quality of statistics (#6626)
>>=20
>>  * Improve how the absence of the system repo is handled (#6621)
>>=20
>>  * Changes to repos are now more atomic which helps to avoid them=20
>> being in an
>>    invalid state. This could be observed when importing the GPG key=20
>> failed,
>>    because the system clock was wrong. (#6547)
>>=20
>>  * A function to report the age of the configuration was added to=20
>> libflatpak,
>>    which will help GNOME Software to prevent unnecessary work (#6532)
>>=20
>>  * Improvements to the build system (#6614, #6610)
>>=20
>>  * Improve various tests (#6604, #6606, #6619, #6617, #6605, #6625)
>>=20
>>  * Translation updates: tr (#6629), =E2=80=8Ezh_CN (#6630)
>>=20
>>  Bug fixes:
>>=20
>>  * Fix a regression in handling of the fallback-x11 permission,=20
>> which was
>>    affecting overrides from Flatseal (#6632)
>>=20
>>  * Fix a memory leak in the Flatpak portal (#6613)
>>=20
>>  * Install SELinux configuration files to the right directory (#6622)
>>=20
>>  * Silence wrong `lseek()` errors when creating sub-sandboxes (#6609)
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   .../flatpak/{flatpak_1.17.6.bb <http://flatpak_1.17.6.bb/> =3D>=20
>> flatpak_1.18.0.bb <http://flatpak_1.18.0.bb/>}            | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>   rename meta-oe/recipes-extended/flatpak/{flatpak_1.17.6.bb=20
>> <http://flatpak_1.17.6.bb/> =3D> flatpak_1.18.0.bb=20
>> <http://flatpak_1.18.0.bb/>} (98%)
>>=20
>>  diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.17.6.bb=20
>> <http://flatpak_1.17.6.bb/>=20
>> b/meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb=20
>> <http://flatpak_1.18.0.bb/>
>>  similarity index 98%
>>  rename from meta-oe/recipes-extended/flatpak/flatpak_1.17.6.bb=20
>> <http://flatpak_1.17.6.bb/>
>>  rename to meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb=20
>> <http://flatpak_1.18.0.bb/>
>>  index 1512b7239f..879455f63c 100644
>>  --- a/meta-oe/recipes-extended/flatpak/flatpak_1.17.6.bb=20
>> <http://flatpak_1.17.6.bb/>
>>  +++ b/meta-oe/recipes-extended/flatpak/flatpak_1.18.0.bb=20
>> <http://flatpak_1.18.0.bb/>
>>  @@ -8,7 +8,7 @@ SRC_URI =3D " \
>>       file://0001-flatpak-pc-add-pc_sysrootdir.patch \
>>   "
>>=20
>>  -SRCREV =3D "9b21874f1a175a9b7c79175a221fa043e202ca73"
>>  +SRCREV =3D "5de2b58bdafde88515d9d6b9189bd1cfd3b88c46"
>>=20
>>=20
>>   inherit meson pkgconfig gettext systemd gtk-doc=20
>> gobject-introspection python3native mime features_check useradd
>>  --
>>  2.54.0
>>=20
>>=20
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#127720):=20
>> <https://lists.openembedded.org/g/openembedded-devel/message/127720>
>>  Mute This Topic:=20
>> <https://lists.openembedded.org/mt/119960031/1997914>
>>  Group Owner: openembedded-devel+owner@lists.openembedded.org=20
>> <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>>  Unsubscribe:=20
>> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
>> [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20


--=-Ad/sM2UIFJ3JnMUV25bE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Sorry</div></div><div id=3D"geary-=
quote" dir=3D"auto"><br>Am Do, 25. Jun 2026 um 18:55:11 -07:00:00 schrieb K=
hem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type=3D"cite"><div dir=
=3D"ltr">this patch comes out mal-formed, please resend a working version.<=
/div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Jun 24, 2026 at 9:39=E2=80=AFAM Markus Volk vi=
a <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;=
f_l_k=3D<a href=3D"mailto:t-online.de@lists.openembedded.org">t-online.de@l=
ists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Changes in 1.18.0<br>
~~~~~~~~~~~~~~~~~<br>
Released: 2026-06-08<br>
<br>
Enhancements:<br>
<br>
* Improve error handling and printed output of `flatpak-coredumpctl` (#6649=
,<br>
&nbsp; #6680)<br>
<br>
* Support the AMD vendor specific compute interface (`/dev/kfd`) via the DR=
I<br>
&nbsp; device permission (#6648)<br>
<br>
* Improve the output of `flatpak update` with failure causes (#6657)<br>
<br>
* Improve startup time for fish shell integration (#6635)<br>
<br>
* Translation updates: =E2=80=8Ezh_CN (#6671)<br>
<br>
Bug fixes:<br>
<br>
* Fix building when HAVE_LIBSYSTEMD but not USE_SYSTEM_HELPER is defined (#=
6652)<br>
<br>
* Ignore system bus failures in parental controls check (#6663)<br>
<br>
* Fix some return values and replace deprecated `GTimeVal` with<br>
&nbsp; `g_get_real_time()` (#6646)<br>
<br>
* Suppress an unused-result warning in the tests (#6655)<br>
<br>
Changes in 1.17.7<br>
~~~~~~~~~~~~~~~~~~<br>
Released: 2026-05-06<br>
<br>
Enhancements:<br>
<br>
* Add the new permission conditionals `has-usb-device` and `has-usb-portal`=
 to<br>
&nbsp; allow apps to drop --device=3Dall and --device=3Dusb permissions (#6=
560)<br>
<br>
* Always send the `Flatpak-Upgrade-From` header when updating instead of<br=
>
&nbsp; freshly installing, to improve the quality of statistics (#6626)<br>
<br>
* Improve how the absence of the system repo is handled (#6621)<br>
<br>
* Changes to repos are now more atomic which helps to avoid them being in a=
n<br>
&nbsp; invalid state. This could be observed when importing the GPG key fai=
led,<br>
&nbsp; because the system clock was wrong. (#6547)<br>
<br>
* A function to report the age of the configuration was added to libflatpak=
,<br>
&nbsp; which will help GNOME Software to prevent unnecessary work (#6532)<b=
r>
<br>
* Improvements to the build system (#6614, #6610)<br>
<br>
* Improve various tests (#6604, #6606, #6619, #6617, #6605, #6625)<br>
<br>
* Translation updates: tr (#6629), =E2=80=8Ezh_CN (#6630)<br>
<br>
Bug fixes:<br>
<br>
* Fix a regression in handling of the fallback-x11 permission, which was<br=
>
&nbsp; affecting overrides from Flatseal (#6632)<br>
<br>
* Fix a memory leak in the Flatpak portal (#6613)<br>
<br>
* Install SELinux configuration files to the right directory (#6622)<br>
<br>
* Silence wrong `lseek()` errors when creating sub-sandboxes (#6609)<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
&nbsp;.../flatpak/{<a href=3D"http://flatpak_1.17.6.bb" rel=3D"noreferrer" =
target=3D"_blank">flatpak_1.17.6.bb</a> =3D&gt; <a href=3D"http://flatpak_1=
.18.0.bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.18.0.bb</a>}&nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
&nbsp;rename meta-oe/recipes-extended/flatpak/{<a href=3D"http://flatpak_1.=
17.6.bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.17.6.bb</a> =3D&gt;=
 <a href=3D"http://flatpak_1.18.0.bb" rel=3D"noreferrer" target=3D"_blank">=
flatpak_1.18.0.bb</a>} (98%)<br>
<br>
diff --git a/meta-oe/recipes-extended/flatpak/<a href=3D"http://flatpak_1.1=
7.6.bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.17.6.bb</a> b/meta-o=
e/recipes-extended/flatpak/<a href=3D"http://flatpak_1.18.0.bb" rel=3D"nore=
ferrer" target=3D"_blank">flatpak_1.18.0.bb</a><br>
similarity index 98%<br>
rename from meta-oe/recipes-extended/flatpak/<a href=3D"http://flatpak_1.17=
.6.bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.17.6.bb</a><br>
rename to meta-oe/recipes-extended/flatpak/<a href=3D"http://flatpak_1.18.0=
.bb" rel=3D"noreferrer" target=3D"_blank">flatpak_1.18.0.bb</a><br>
index 1512b7239f..879455f63c 100644<br>
--- a/meta-oe/recipes-extended/flatpak/<a href=3D"http://flatpak_1.17.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">flatpak_1.17.6.bb</a><br>
+++ b/meta-oe/recipes-extended/flatpak/<a href=3D"http://flatpak_1.18.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">flatpak_1.18.0.bb</a><br>
@@ -8,7 +8,7 @@ SRC_URI =3D " \<br>
&nbsp; &nbsp; &nbsp;file://0001-flatpak-pc-add-pc_sysrootdir.patch \<br>
&nbsp;"<br>
<br>
-SRCREV =3D "9b21874f1a175a9b7c79175a221fa043e202ca73"<br>
+SRCREV =3D "5de2b58bdafde88515d9d6b9189bd1cfd3b88c46"<br>
<br>
<br>
&nbsp;inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection=
 python3native mime features_check useradd<br>
-- <br>
2.54.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#127720): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/127720" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/127720</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119960031/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119960031/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div>
--=-Ad/sM2UIFJ3JnMUV25bE--


