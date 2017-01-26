Return-Path: <max.oss.09@gmail.com>
Received: from mail-ot0-f194.google.com (mail-ot0-f194.google.com
	[74.125.82.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5507C772E5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 22:27:21 +0000 (UTC)
Received: by mail-ot0-f194.google.com with SMTP id 36so28996199otx.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 14:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=XYpeu6ZG5K9fqSMtJmJuLAUT/nZ5hwsP6G66xiJMNcQ=;
	b=EFcMeZ7LGQAATdOXsDdMR0CShDFcW1Dp5yPYIQdHJqLFj1DrqtJzVsVpT/GYUJFpit
	Xr09sbyosevmH4LVw6Zrj51bW9wS2ZOAEGBB0bp2rXZkyJ3NgjqVaezMZ3ePpdw6YVKR
	MjfJ16sd6G2vUEcvJB3Fx0InjBlpzcA+/t7bSUlD9INEvvuPWII4ym9ipLYcY0pOBOQP
	MwqCpNV/Hfvs9b6OB8+FddWdKrBVwYrdtYqOYnf11M9nKDcYeNuOFUNgfyIlmfVD2CFy
	nyNmYQZD4vMjUwNHFiha6ijUDROjLABt3FZok0o/bSr4D4hidwwb74B5bpYa0iNIIyBY
	5nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=XYpeu6ZG5K9fqSMtJmJuLAUT/nZ5hwsP6G66xiJMNcQ=;
	b=TtJTE2kvChYU7QeuhFcu7bEyQmox0oLL1uRnWFSXcBVIa8DehA1hNrTSkiLh4OCRn4
	dDyQEpNchTPl2szf1ys338RMwzfaTJsyfWmPx8viqlQLHQc5UaXvLIXqacqprfRSwbRf
	iosktNYYR7NOjQ2SkKW5J+YkRMXPK03BRnFxm/vv4vOYFSR81leTgnxd7RkJnP1NI7j2
	p5IIhNzKmDCwwvnQ/JDEIT31AZME1mukV3ZsASJy44A3YP9fDzxYb6DeqKDkEohfYV8K
	qnRAeZIPIPdKXHBK3j3rqEq1Gs+ekKpnrpmed6UxRb0O5lvIkoZYh6XkFc3rroLKk5TW
	SX5A==
X-Gm-Message-State: AIkVDXKM8w7Wx9fmjErvW772PoxqeQrXkR6LZqUhCFM/ghXIzgAqOsJfW2RKcLe0V0wXh/Wy//o3NSWAqVsrdg==
X-Received: by 10.157.27.3 with SMTP id l3mr2699923otl.15.1485469641468; Thu,
	26 Jan 2017 14:27:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.1.56 with HTTP; Thu, 26 Jan 2017 14:27:21 -0800 (PST)
In-Reply-To: <1484608187-28597-2-git-send-email-max.krummenacher@toradex.com>
References: <1484608187-28597-1-git-send-email-max.krummenacher@toradex.com>
	<1484608187-28597-2-git-send-email-max.krummenacher@toradex.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Thu, 26 Jan 2017 23:27:21 +0100
Message-ID: <CAEHkU3UX4NhOVvg6QXcuWgw_H5Z1EaOgih3Lsj9D+hfvC1s44A@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [meta-browser][PATCH 2/2] README: add -s to git send-email example
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
X-List-Received-Date: Thu, 26 Jan 2017 22:27:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

ping

Any comments on this one?

Max

2017-01-17 0:09 GMT+01:00 Max Krummenacher <max.oss.09@gmail.com>:
> Prevent missing Signed-off-by lines.
>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  README | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/README b/README
> index 647404b..effe2f9 100644
> --- a/README
> +++ b/README
> @@ -26,7 +26,7 @@ Maintainers: Eric B=C3=A9nard <eric@eukrea.com>
>               Otavio Salvador <otavio@ossystems.com.br>
>
>  When sending single patches, please use something like :
> -git send-email -1 --to openembedded-devel@lists.openembedded.org --subje=
ct-prefix=3D'meta-browser][PATCH'
> +git send-email -1 -s --to openembedded-devel@lists.openembedded.org --su=
bject-prefix=3D'meta-browser][PATCH'
>
>  TODO
>  ----
> --
> 2.6.6
>

