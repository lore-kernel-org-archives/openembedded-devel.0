Return-Path: <kelefa.sane@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12470C54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 11:14:59 +0000 (UTC)
Subject: Re: [meta-oe][PATCH] pcp: fix race condition build error
To: openembedded-devel@lists.openembedded.org
From: kelefa.sane@smile.fr
X-Originating-Location: Aixe-sur-Vienne, Nouvelle-Aquitaine, FR (176.157.204.145)
X-Originating-Platform: Linux Chrome 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 27 May 2025 04:14:52 -0700
References: <20250527095732.1491355-1-yoann.congal@smile.fr>
In-Reply-To: <20250527095732.1491355-1-yoann.congal@smile.fr>
Message-ID: <15379.1748344492262632657@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="eMCZQCk2PxmEgvbaoMyg"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 May 2025 11:14:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117635

--eMCZQCk2PxmEgvbaoMyg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: K=C3=A9l=C3=A9fa San=C3=A9 < kelefa.sane@smile.fr >

--eMCZQCk2PxmEgvbaoMyg
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div><span style=3D"color: #222222; font-family: Arial, Helvetica, sans-ser=
if; font-size: small; font-style: normal; font-variant-ligatures: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans=
: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; bac=
kground-color: #ffffff; text-decoration-thickness: initial; text-decoration=
-style: initial; text-decoration-color: initial; display: inline !important=
; float: none;">Reviewed-by: K&eacute;l&eacute;fa San&eacute; &lt;</span><a=
 style=3D"color: #1155cc; font-family: Arial, Helvetica, sans-serif; font-s=
ize: small; font-style: normal; font-variant-ligatures: normal; font-varian=
t-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-=
align: start; text-indent: 0px; text-transform: none; widows: 2; word-spaci=
ng: 0px; -webkit-text-stroke-width: 0px; white-space: normal;" href=3D"mail=
to:kelefa.sane@smile.fr" target=3D"_blank" rel=3D"noopener">kelefa.sane@smi=
le.fr</a><span style=3D"color: #222222; font-family: Arial, Helvetica, sans=
-serif; font-size: small; font-style: normal; font-variant-ligatures: norma=
l; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orp=
hans: 2; text-align: start; text-indent: 0px; text-transform: none; widows:=
 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal;=
 background-color: #ffffff; text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial; display: inline !impor=
tant; float: none;">&gt;</span></div>

--eMCZQCk2PxmEgvbaoMyg--

