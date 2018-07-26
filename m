Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id A291078C49
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 17:28:52 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id b15-v6so2349020qtp.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 10:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Zwc4gBNV9PNq9/zDkivc51VnaB0iNXeKM0T+er9Vp4U=;
	b=CQsCY171BIem47BGv9iIKz/2fGE8TBkFzhC91E0/Z+ZuRSTWQ2/tCkOd5Ff+AnoNPf
	r7LwHEIKWR2maaYb4ZGkhJQTcmh2+QGP4rPs3+laBZD7S3gqtMUs6euCkZc5Qr6vM9G1
	/S5V4WpDN+FNcC0gHyEntLXgebOIsLJnu00c9QjUD6GcpESIowjpNhlR9mmmwzays4m6
	2jJ1nDa/BNP/P8I5KEGPhbtzCWGYxt2Ht8O2DO82jcOtEZS8462BgjnLfn7XeoJAdR5Y
	0QJmyKbj4uVIJokUaVLMpTWnXYx4u4N7932Zgj0idqGhr+NJcE4hpLkeWqiCbdm/7jWO
	HTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Zwc4gBNV9PNq9/zDkivc51VnaB0iNXeKM0T+er9Vp4U=;
	b=tRNOyBAFJNxZm97t1KnGpRBg0aZYPJm4I2x+HMzfxNnP+L/kwxlrAa/uj19gys7XIB
	UvbvrnjCrtgZcuG9nXGn0jaNjHLXjGzEPU1Z+p95ZjlvET60Y9vgIi9ibTnZn4gv4DVW
	2twqBi9dFAo0iqUtz1Zp29g+xxQV0qlQC11T4YBgxvmAjItfHGabiI0DP+8GNVZYfJnI
	m2MIT6063So21XIOt4yt3dPRd3Njcl10wsoxTwk+MQwIjpb6J3L1uaJcXVGw82sfPPJX
	NerJVVz++rlBLO1xIHhPq+impi4VjjBU96Qd56Trcfv278ITc04gwYEsmoU+SIK3iWUS
	/FYw==
X-Gm-Message-State: AOUpUlGYAx2i2gdpj9O6+HdLrfPF97QGHv+DatDscKHZ0Ymfz60QEi23
	7rzxhZzrxrM77j+I6NMiYGJoY5LOMhoHzXJ3dYc=
X-Google-Smtp-Source: AAOMgpcOo84hQRBLzF27ucpaSnGz/EL6T+w/fU3/6E8d47yQok3dyrO1ZWMBD9fcjm/lpDyageamDXAj3PTc85aLvNk=
X-Received: by 2002:ac8:25f1:: with SMTP id
	f46-v6mr2893981qtf.20.1532626133346; 
	Thu, 26 Jul 2018 10:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20180723093326.12122-1-hongl.fnst@cn.fujitsu.com>
	<20180723093326.12122-4-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20180723093326.12122-4-hongl.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Jul 2018 10:28:27 -0700
Message-ID: <CAMKF1sp_GxwJq=kfqihhkMMaioov6mtuL_of+drCPvahiVjuuQ@mail.gmail.com>
To: hongl.fnst@cn.fujitsu.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] [meta-python][PATCH] python-pbr:3.1.1 -> 4.1.0
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
X-List-Received-Date: Thu, 26 Jul 2018 17:28:52 -0000
Content-Type: text/plain; charset="UTF-8"

WARNING: python3-pbr-3.1.1-r0 do_fetch: Checksum mismatch for local
file /mnt/a/oe/downloads/pbr-3.1.1.tar.gz
Cleaning and trying again.
WARNING: python3-pbr-3.1.1-r0 do_fetch: Renaming
/mnt/a/oe/downloads/pbr-3.1.1.tar.gz to
/mnt/a/oe/downloads/pbr-3.1.1.tar.gz_bad-checksum_4e82c2e07af544c56a5b71c801525b00
ERROR: python3-pbr-3.1.1-r0 do_fetch: Checksum failure fetching
https://files.pythonhosted.org/packages/source/p/pbr/pbr-3.1.1.tar.gz
ERROR: python3-pbr-3.1.1-r0 do_fetch: Fetcher failure for URL:
'https://files.pythonhosted.org/packages/source/p/pbr/pbr-3.1.1.tar.gz'.
Checksum mismatch!
File: '/mnt/a/oe/downloads/pbr-3.1.1.tar.gz' has md5 checksum
4e82c2e07af544c56a5b71c801525b00 when b8d6e1b6064f9621fa6f87264aa99db9
was expected
File: '/mnt/a/oe/downloads/pbr-3.1.1.tar.gz' has sha256 checksum
05f61c71aaefc02d8e37c0a3eeb9815ff526ea28b3b76324769e6158d7f95be1 when
e0f23b61ec42473723b2fec2f33fb12558ff221ee551962f01dd4de9053c2055 was
expected
If this change is expected (e.g. you have upgraded to a new version
without updating the checksums) then you can use these lines within
the recipe:
SRC_URI[md5sum] = "4e82c2e07af544c56a5b71c801525b00"
SRC_URI[sha256sum] =
"05f61c71aaefc02d8e37c0a3eeb9815ff526ea28b3b76324769e6158d7f95be1"
Otherwise you should retry the download and/or check with upstream to
determine if the file has become corrupted or otherwise unexpectedly
modified.

ERROR: python3-pbr-3.1.1-r0 do_fetch: Function failed: base_do_fetch
On Mon, Jul 23, 2018 at 2:34 AM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> Upgrade python-pbr from 3.1.1 to 4.1.0.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-pbr_3.1.1.bb => python-pbr_4.1.0.bb}               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-pbr_3.1.1.bb => python-pbr_4.1.0.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python-pbr_3.1.1.bb b/meta-python/recipes-devtools/python/python-pbr_4.1.0.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python-pbr_3.1.1.bb
> rename to meta-python/recipes-devtools/python/python-pbr_4.1.0.bb
> index bdff867..32d0d2c 100644
> --- a/meta-python/recipes-devtools/python/python-pbr_3.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python-pbr_4.1.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>
> -SRC_URI[md5sum] = "4e82c2e07af544c56a5b71c801525b00"
> -SRC_URI[sha256sum] = "05f61c71aaefc02d8e37c0a3eeb9815ff526ea28b3b76324769e6158d7f95be1"
> +SRC_URI[md5sum] = "b8d6e1b6064f9621fa6f87264aa99db9"
> +SRC_URI[sha256sum] = "e0f23b61ec42473723b2fec2f33fb12558ff221ee551962f01dd4de9053c2055"
>
>  inherit pypi setuptools
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

