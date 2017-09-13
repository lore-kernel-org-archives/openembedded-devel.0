Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id C3AA6786C0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 16:07:42 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id t10so162527vke.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2017 09:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jhn/nya7+Lt2/B89VCbxR8sgkSzcXvf0Kp05W181h5E=;
	b=L0lt2HR6HRT1qhpA8WsZXWZLHDmhw7EXfJwSw2evB9Z+bI+8YP7+oSSyUSwB9agfo9
	ejlYHnb5pMTT61aF+IU0Ux3OoWOcMtpZkzHafI7JhRRo8hqQI0AQF8bD3TDwCIdLfvHa
	a6TLhqYbKl5TOZA8r1Oxn0eeeCuUTAbQBZVBDdeytYoZj+zF4WmedHPs5OUZJu7lfPNA
	js/wEHNbsl4aqG2Ngqn6UXaXBSS2UU9bgZKAzckspidlasJQkRLz54KrWLrl5F/JnA3s
	DNhaZBrzpaEE5AkKwceRlIOq10dlcyubuRv9MSRpf0KmHKXQy3Y5tCKQOXuReFWVHMYR
	+XTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jhn/nya7+Lt2/B89VCbxR8sgkSzcXvf0Kp05W181h5E=;
	b=mJs8YpEvZN5hd8kKoL0XyKT9Nqs1iQZvlkkE3jIv/uolwgRWGM5rmnHqhJAzZISXrC
	UYBxsldZTj3B47leEFIRRX5hCuihRIB4ODWfpwD8GOWNyoZt4fvsdg8qUE9ERNqf0GQh
	7yhXM7HguyeSzZ/T2DIKXbGtt4an2mLCWZz13qG2ExvApH7B9yOuNhZIaYZ4kDjZqUoi
	ilQPlkbef9BXXyNrZutM0/8Mcb7a0/2TOzn1GC7GDopgY/dzBP/ExBzSW4ejLFF/Hnyr
	dsjzXsHDJI+kPwUhN8hMvEgN3beJEmHUnVITslLW+uNCEg2nV4p+rij6/aJJNxWl+Gmg
	5bNQ==
X-Gm-Message-State: AHPjjUjdX5tsCADIDmU0aSCsjLn+lEQbqEB4ZdI1MMDJJ1O3RB7S6WhW
	EHy91pFnxgJiWrVgQmhQcH2cxYyuU7bhwPA1ZBw=
X-Google-Smtp-Source: AOwi7QCPWnqv/xmVI+FEnNTaw8Sr6ys9fvIhTqyGaag0Gl+XLJ1/EOp9jiVJpGwGztfh6QQg1LBjcyUjVFDVTTUHEN8=
X-Received: by 10.31.41.136 with SMTP id p130mr13281100vkp.122.1505318863854; 
	Wed, 13 Sep 2017 09:07:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.130 with HTTP; Wed, 13 Sep 2017 09:07:43 -0700 (PDT)
In-Reply-To: <1dac1c4e37491a36fd3046a9816cd7a89a91e925.1505317801.git.fabien.lahoudere@collabora.co.uk>
References: <cover.1505317801.git.fabien.lahoudere@collabora.co.uk>
	<1dac1c4e37491a36fd3046a9816cd7a89a91e925.1505317801.git.fabien.lahoudere@collabora.co.uk>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 13 Sep 2017 18:07:43 +0200
Message-ID: <CA+chaQfk--dM8ZrC4jVvuYOUzRgixDYWqq9uiA_Lfn_geLDmYA@mail.gmail.com>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH v3 1/2] libupnp: Add recipe for version 1.8.2
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
X-List-Received-Date: Wed, 13 Sep 2017 16:07:42 -0000
Content-Type: text/plain; charset="UTF-8"

Please don't use github archives which can be regenerated in some cases.
Safer to use just git fetcher.

On Wed, Sep 13, 2017 at 5:58 PM, Fabien Lahoudere <
fabien.lahoudere@collabora.co.uk> wrote:

> This version is needed for gerbera, however this version break mpd.
> So we keep both recipe.
>
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> ---
>  .../recipes-connectivity/libupnp/libupnp1.8.bb     | 22
> ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp1.
> 8.bb
>
> diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp1.8.bb
> b/meta-multimedia/recipes-connectivity/libupnp/libupnp1.8.bb
> new file mode 100644
> index 000000000..5b0e72d42
> --- /dev/null
> +++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp1.8.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Portable SDK for UPnP* Devices"
> +DESCRIPTION = "The Portable SDK for UPnP Devices is an SDK for
> development of \
> +UPnP device and control point applications. It consists of the core UPnP \
> +protocols along with a UPnP-specific eXtensible Markup Language (XML)
> parser \
> +supporting the Document Object Model (DOM) Level 2 API and an optional, \
> +integrated mini web server for serving UPnP related documents."
> +HOMEPAGE = "http://pupnp.sourceforge.net/"
> +LICENSE = "BSD"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b3190d5244e08e78e4c8ee78544f4863"
> +
> +SRC_URI = "https://github.com/mrjimenez/pupnp/archive/release-1.8.2.
> tar.gz "
> +
> +SRC_URI[md5sum] = "db8061f7cbd7f9af993ac4e87ad084cb"
> +SRC_URI[sha256sum] = "438ad86bfd933cb1e9be1c41bf3bd6
> 9f049daba11d71bbb5d715336e00106cb4"
> +
> +PV="1.8.2"
> +S="${WORKDIR}/pupnp-release-${PV}"
> +
> +inherit autotools
> +
> +EXTRA_OECONF += "--enable-reuseaddr"
> \ No newline at end of file
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

