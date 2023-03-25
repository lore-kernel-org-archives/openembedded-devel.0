Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9BF7C6FD1C
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 15:19:32 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.23847.1679757565114179887
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 08:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout09.t-online.de (Postfix) with SMTP id 34F921EE60
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 16:19:23 +0100 (CET)
Received: from [192.168.178.83] ([84.154.174.49]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pg5fr-1oD3M80; Sat, 25 Mar 2023 16:19:19 +0100
Date: Sat, 25 Mar 2023 16:19:14 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-gnome][PATCHv2] gedit: update 43.2 -> 44.2
To: openembedded-devel@lists.openembedded.org
Message-Id: <2813SR.QWWUH1QC7SQ73@t-online.de>
In-Reply-To: <20230325151818.6769-1-f_l_k@t-online.de>
References: <20230325151818.6769-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-KT8QGldVrxuGIRbn4h42"
X-TOI-EXPURGATEID: 150726::1679757559-16092CF2-A63D0634/0/0 CLEAN NORMAL
X-TOI-MSGID: 7c963d90-f3f7-486f-9ee1-812a2b935e64
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 15:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101750

--=-KT8QGldVrxuGIRbn4h42
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

added 'signed-off by' line

Am Sa, 25. M=E4r 2023 um 16:18:18 +0100 schrieb Markus Volk=20
<f_l_k@t-online.de>:
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  meta-gnome/recipes-gnome/gedit/{gedit_43.2.bb =3D> gedit_44.2.bb} | 2=20
> +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-gnome/recipes-gnome/gedit/{gedit_43.2.bb =3D>=20
> gedit_44.2.bb} (91%)
>=20
> diff --git a/meta-gnome/recipes-gnome/gedit/gedit_43.2.bb=20
> b/meta-gnome/recipes-gnome/gedit/gedit_44.2.bb
> similarity index 91%
> rename from meta-gnome/recipes-gnome/gedit/gedit_43.2.bb
> rename to meta-gnome/recipes-gnome/gedit/gedit_44.2.bb
> index 1c1803d5e..34c782297 100644
> --- a/meta-gnome/recipes-gnome/gedit/gedit_43.2.bb
> +++ b/meta-gnome/recipes-gnome/gedit/gedit_44.2.bb
> @@ -21,7 +21,7 @@ inherit gnomebase gsettings itstool gnome-help=20
> gobject-introspection gtk-doc val
>  def gnome_verdir(v):
>      return oe.utils.trim_version(v, 1)
>=20
> -SRC_URI[archive.sha256sum] =3D=20
> "f950d2d35c594bb6c8dbc9f5440cad7788ca0a8688e2b07846f83de9a4e3fc25"
> +SRC_URI[archive.sha256sum] =3D=20
> "3bbb1b3775d4c277daf54aaab44b0eb83a4eb1f09f0391800041c9e56893ec11"
>=20
>  # gobject-introspection is mandatory and cannot be configured
>  REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
> --
> 2.34.1
>=20


--=-KT8QGldVrxuGIRbn4h42
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>added 'signed-off by' line</div></=
div><div id=3D"geary-quote" dir=3D"auto"><br>Am Sa, 25. M=E4r 2023 um 16:18=
:18 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote typ=
e=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">Si=
gned-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-o=
nline.de</a>&gt;
---
 meta-gnome/recipes-gnome/gedit/{gedit_43.2.bb =3D&gt; gedit_44.2.bb} | 2 +=
-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gedit/{gedit_43.2.bb =3D&gt; gedit_44.2.bb=
} (91%)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_43.2.bb b/meta-gnome/reci=
pes-gnome/gedit/gedit_44.2.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gedit/gedit_43.2.bb
rename to meta-gnome/recipes-gnome/gedit/gedit_44.2.bb
index 1c1803d5e..34c782297 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_43.2.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_44.2.bb
@@ -21,7 +21,7 @@ inherit gnomebase gsettings itstool gnome-help gobject-in=
trospection gtk-doc val
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
=20
-SRC_URI[archive.sha256sum] =3D "f950d2d35c594bb6c8dbc9f5440cad7788ca0a8688=
e2b07846f83de9a4e3fc25"
+SRC_URI[archive.sha256sum] =3D "3bbb1b3775d4c277daf54aaab44b0eb83a4eb1f09f=
0391800041c9e56893ec11"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
<div>--=20
</div>2.34.1

</div></blockquote></div>
--=-KT8QGldVrxuGIRbn4h42--


