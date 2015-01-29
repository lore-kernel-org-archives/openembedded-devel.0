Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 89E9C60043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jan 2015 07:38:23 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id eu11so35826269pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 23:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=t/JHqWgcsXyGQB5TpG6IWFnjMJyFn0HSIGJBPx2/JNw=;
	b=nq/1zOM497ATxcI1f2aaUpbV6fSZ9P1Adr27rt8m2GgnDsGT+VPUWEwvPK77JM0O1e
	z+iFBkjCfocNRmvqN+S6W9t2pAI7Wl7y2SqPggvhIlZq+e5ryWUuIWKkCu+m27TzIplk
	knH7u5ymBSLNOO247xoVRJMuegCV/aiOLdjnyE93qRFRt59U8zVtQX8dt2h1RHoVy26H
	QpEFpZKT8Vsr7GYuuxWzVghTLH8mXiatBJjOI8hWk18TdcleSGr+FGzugTNH3RRsyOiD
	O0wQMSCFNTlxsBTfZ2arE4yPVHVwgScs0CO1guly/CmIuKBcqSPAGuB5VZPIPWslSCIE
	gEnQ==
MIME-Version: 1.0
X-Received: by 10.66.250.134 with SMTP id zc6mr2284993pac.2.1422517105057;
	Wed, 28 Jan 2015 23:38:25 -0800 (PST)
Received: by 10.70.44.167 with HTTP; Wed, 28 Jan 2015 23:38:24 -0800 (PST)
In-Reply-To: <1422495973-20050-1-git-send-email-ashcharles@gmail.com>
References: <1422495973-20050-1-git-send-email-ashcharles@gmail.com>
Date: Thu, 29 Jan 2015 08:38:24 +0100
Message-ID: <CALbNGRT5J58yeArzBR_vr70okwbdQUZuRzO30sa6AObKg--3tg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Ash Charles <ashcharles@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] xfce4-wavelan-plugin: Specify BSD license
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Jan 2015 07:38:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 29, 2015 at 2:46 AM, Ash Charles <ashcharles@gmail.com> wrote:
> This software contains an older or slightly modified BSD license in
> its COPYING file and assigns copyright to the specific authors.  The
> code (see the wavelan_show_about function) makes it clear that a BSD
> license is intended:
>
>       "license", xfce_get_license_text (XFCE_LICENSE_TEXT_BSD),
>
> (caveat: and of course, INAL)
>
> Signed-off-by: Ash Charles <ashcharles@gmail.com>
> ---
>  meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11.bb |=
 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin=
_0.5.11.bb b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0=
.5.11.bb
> index 487a5b8..7a3335a 100644
> --- a/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11=
.bb
> +++ b/meta-xfce/recipes-panel-plugins/wavelan/xfce4-wavelan-plugin_0.5.11=
.bb
> @@ -1,6 +1,6 @@
>  SUMMARY =3D "Panel plugin displaying stats from a wireless lan interface=
"
>  HOMEPAGE =3D "http://goodies.xfce.org/projects/panel-plugins/xfce4-wavel=
an-plugin"
> -LICENSE =3D "BenediktMeurer & FlorianRivoal"
> +LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De1e5872df9c5cf1a23f16493d9104=
920"
>
>  inherit xfce-panel-plugin
> --
> 2.1.0
>
Acked-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>

