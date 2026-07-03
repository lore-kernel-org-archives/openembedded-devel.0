Return-Path: <mail@michael-fitzmayer.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856A0C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 18:20:49 +0000 (UTC)
Received: from mailserv.regfish.com (mailserv.regfish.com [52.57.101.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98942.1783102844373518466
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Jul 2026 11:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=permanent DNS error (domain: michael-fitzmayer.de, ip: 52.57.101.90, mailfrom: mail@michael-fitzmayer.de)
Received: by mailserv.regfish.com (Postfix, from userid 706)
	id 55FA260788; Fri,  3 Jul 2026 18:20:42 +0000 (UTC)
Received: from DESKTOPB84SDL6 (ipservice-092-208-170-243.092.208.pools.vodafone-ip.de [92.208.170.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: 46272-0001)
	by mailserv.regfish.com (Postfix) with ESMTPSA id 07318606EC
	for <openembedded-devel@lists.openembedded.org>; Fri,  3 Jul 2026 18:20:41 +0000 (UTC)
From: "Michael Fitzmayer" <mail@michael-fitzmayer.de>
Cc: "'OpenEmbedded Devel List'" <openembedded-devel@lists.openembedded.org>
References: <20260703172800.480930-1-mail@michael-fitzmayer.de> <CAMKF1sqx57Qh_=gkVecREUxndur18rj-9hJy0YucXxK+-y-mPA@mail.gmail.com>
In-Reply-To: <CAMKF1sqx57Qh_=gkVecREUxndur18rj-9hJy0YucXxK+-y-mPA@mail.gmail.com>
Subject: RE: [oe] [meta-oe][PATCH] canopenterm: update to version 2.03
Date: Fri, 3 Jul 2026 20:20:41 +0200
Message-ID: <001601dd0b18$a89cec80$f9d6c580$@michael-fitzmayer.de>
X-Mailer: Microsoft Outlook 16.0
MIME-Version: 1.0
Thread-Index: AQF+7FfokNA4Mt+mdIXPnj49QaFXPAGICRNGtwwXlSA=
Content-Language: en-gb
Content-Type: multipart/signed;
	protocol="application/pgp-signature";
	micalg=pgp-sha256;
	boundary="=-=bWmghFSyqkD0j+=-="
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Jul 2026 18:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128014

This is a multipart message in MIME format.

--=-=bWmghFSyqkD0j+=-=
Content-Type: multipart/alternative;
	boundary="=-=+PwFLYANNEnWxb=-="


--=-=+PwFLYANNEnWxb=-=
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

canopenterm: the checksum differs from previous version because the copyrig=
ht year span has been updated.

=20

From: Khem Raj <raj.khem@gmail.com>=20
Sent: 03 July 2026 19:35
To: mail@michael-fitzmayer.de
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] canopenterm: update to version 2.03

=20

Please document what change in license check sums to differ

=20

	=20

--=-=+PwFLYANNEnWxb=-=
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40"><head><meta name=3DGenerator content=3D"Microso=
ft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-GB link=3Dblue vli=
nk=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span style=3D'm=
so-fareast-language:EN-US'>canopenterm: the checksum differs from previous =
version because the copyright year span has been updated.<o:p></o:p></span>=
</p><p class=3DMsoNormal><span style=3D'mso-fareast-language:EN-US'><o:p>&n=
bsp;</o:p></span></p><p class=3DMsoNormal><b><span lang=3DEN-US>From:</span=
></b><span lang=3DEN-US> Khem Raj &lt;raj.khem@gmail.com&gt; <br><b>Sent:</=
b> 03 July 2026 19:35<br><b>To:</b> mail@michael-fitzmayer.de<br><b>Cc:</b>=
 OpenEmbedded Devel List &lt;openembedded-devel@lists.openembedded.org&gt;<=
br><b>Subject:</b> Re: [oe] [meta-oe][PATCH] canopenterm: update to version=
 2.03<o:p></o:p></span></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><=
p class=3DMsoNormal>Please document what change in license check sums to di=
ffer<o:p></o:p></p></div><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><bl=
ockquote style=3D'border:none;border-left:solid #CCCCCC 1.0pt;padding:0cm 0=
cm 0cm 6.0pt;margin-left:4.8pt;margin-right:0cm'><p class=3DMsoNormal style=
=3D'margin-bottom:12.0pt'><o:p>&nbsp;</o:p></p></blockquote></div></div></b=
ody></html>

--=-=+PwFLYANNEnWxb=-=--

--=-=bWmghFSyqkD0j+=-=
Content-Type: application/pgp-signature;
	name="openpgp-digital-signature.asc"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCAAdFiEEeko8mQdaojPAePLVyfzHsirX2UkFAmpH/XEACgkQyfzHsirX
2UmQFQv/WIMinDHOQ8j2JmUb6SLf4m8b8C5mVu3LYs6R1a4ns/8jdUN9OX5GgXQ/
Z1jTEaJZYZT9EbwXkeV5HJk/6NZBdcPwgEv7tQA6RnODtVW16zYOGMjb0hm+3Uvd
bPkYFL0L6MuwuAGX7z/6HiH3I3g5UE40zc6BjVY1r0iuG9YxvXCu24j8sUG9e3oC
ZOcdBbOUiXSHojM4UU+KxXdVDbRey6RxiIqL5xH0mTZ+t6efXvMgjtwcNTsvLCFJ
kzlA0ehzqewKDaHhlAPy78pYODvdgZR8FAbmuFJZZoVgpwRuRIZIjauxZVKoserY
tKx8x4/BlX0paGpCfdMOaDEw3UpcDhQEvDWhEwE0wi6eTn7TN4Xqv2tYuVUV+QJQ
mNcCItIERLsB5RrI3+bT9qYGcj6dSgzeAFxVHM7Hdp+jGwzajIK3bReh1PKKHK+B
A6fo398FeVdZcfKE4SmSx/SG9Ev970mrDprCo62tB9gCM8gBjgOh0sBBV3oemcR8
GotxLTdj
=84Q/
-----END PGP SIGNATURE-----


--=-=bWmghFSyqkD0j+=-=--


