Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id DEC4779A60
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 03:44:15 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id p6-v6so4624608qkg.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 20:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sBMKh3cw9Lg+jCuJULLdViGICtHAayH9aBUQ10jo44c=;
	b=sZspFB1Z1e9+G6QJiXqzKZR/J+gdicDRr1SXFcpIbvCUZeMagFQ+wAa1nS9Y7mecPI
	YzMh941161LaEtNASKmV46uI6Xpbv4MkNlFq4wQA0WuT9QV/hMIeyD0QDDTMNctA6UUx
	Jk4Lo6FlaBFNQt6KzX9h1bcwlSbS+5z1uXBGAm5oDU0FcCwjPMCsdNc+87uyFWt5z2j+
	hLvKUmvHRd5VDZNg3Yby0rbjtaQfzD37zd798J8A/T/vLmSJk35xSAYnYCcMvVOJF22a
	+cME5Od0wDLbgJPMTOTd4RTe0mIPxVNrob6OrIGkWLtOkxugC7P0ff/susc+e1W4Lr39
	paeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sBMKh3cw9Lg+jCuJULLdViGICtHAayH9aBUQ10jo44c=;
	b=sKhKOGV0/sg2xV8NGpbWOB6vvHDqMf6ERy0wcu0PRp9ZAN52mVjvQtEqjNULVkUiwA
	QRXwXoAhxISfHPf2IJvJD26k4t+mHjFQSNS5spiRdIgWU2HJdkGWt7fSfh5THV7fyg/n
	HIsdr7iqaEDddxVzEddAEZuCzJK/XdAdYeNm7TtJx28IRA+fuhbgTKkupEtgXHLenSeu
	BlqxIPo9KDOaJuAFm+/8HxAdTHOezjtJcdh0PvnHtSXjhXu+SiEboUhx23kpkwkd8x+e
	WFZ8sGZOTANqZ/hEmczGZXyUo0Obb7R1T6j7wMygghlz4bUz6qgDfjQh1ZTI8sW/0uOe
	6D+w==
X-Gm-Message-State: ABuFfohgFTuFcjUY90G71U/EucRwst3MtKxyAw2HgHUlwddBV5RVxJoL
	fLNdN8FqtJiL+1nUAvoqaYHrGbfHAXsWhDj11GI=
X-Google-Smtp-Source: ACcGV62fSd2+iR8CRAjqWwGTTiWSms5kCGjb755zmjxNy4n7xzVDMoFfS4a7GkkQCFqh+QjHNZAyBi9hLWwXxOcldgQ=
X-Received: by 2002:a37:31cf:: with SMTP id
	x198-v6mr11209650qkx.206.1539229456579; 
	Wed, 10 Oct 2018 20:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <20181010070310.18649-1-sno@netbsd.org>
In-Reply-To: <20181010070310.18649-1-sno@netbsd.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 Oct 2018 20:43:50 -0700
Message-ID: <CAMKF1srRZhZqHY9-36K+XmDjrN_WuaPQKYjMANThmRjW6oB8Ug@mail.gmail.com>
To: Jens Rehsack <sno@netbsd.org>
Cc: svenha@external.miltenyibiotec.de, igork@miltenyibiotec.de,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-mono][PATCH] layer.conf: update layer compatibility sumo->thud
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
X-List-Received-Date: Thu, 11 Oct 2018 03:44:16 -0000
Content-Type: text/plain; charset="UTF-8"

HI Jens

This is wrong list. Please check the README file for the layer for
right ml  to send patches to
On Wed, Oct 10, 2018 at 12:03 AM Jens Rehsack <sno@netbsd.org> wrote:
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 8a8d273..cf9a1f0 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -15,4 +15,4 @@ PREFERRED_VERSION_mono-native ?= "5.12.0.226"
>
>  PREFERRED_VERSION_nuget ?= "3.5.0"
>
> -LAYERSERIES_COMPAT_mono = "sumo"
> +LAYERSERIES_COMPAT_mono = "sumo thud"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

