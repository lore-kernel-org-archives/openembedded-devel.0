Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7B30B771B1
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Feb 2016 07:51:22 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id e64so52291673vkg.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Feb 2016 23:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=NIstWuLvbsQENblvADRszr+ekSvYLrwGH15hi1JprR0=;
	b=dHzJ0QRxzBscVeCNlO0gO1sLjrVcp3wq+vhsC7I723aCI9gx4rAJF97UoKI3chrLuC
	NfeAMGbAofKkqUAyEO7yr0Xa0XJYFHUrPrRQFuXXhI4W/z46Wn0rjt5uprAYItXmUqXg
	ijwqZoJLsSGJkt/4cHyr1Md/G6rGWhVHy3rt/MP/bPcgg/uVbE7us17FRYe1donPJ/N2
	LDCV1ZP7zBHCrfsp/NenOqFRnPAwajqYudIvkn6Ckq19Xz6nAYPkpizzwOP0BVx09055
	U9tb1LMd+skxw9uY+v7Pe/0ewbn4kfb31iKtc2uDguJQpHGXXumcQxcm9dBeR7pSAMXo
	5SJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=NIstWuLvbsQENblvADRszr+ekSvYLrwGH15hi1JprR0=;
	b=IrTH2poeMWICH+bXCkptpA3Q5DNI3DRAHKDiwBBUwmJtkQHNIyH8kntjLe5FFmEvUw
	dJ6pRJjuFeTpH33cmV5Y+2qIR2xFQ7syzIAOuJC8OlOHQObK6DUpC/XVIILViHCTgoV0
	Ca5914DZtOy3Or3MgfU4VIK3PTWvY/KVCOpBFn2PgAn1NflNTt32dYyPS6yyjUlGzVSD
	3GbU+zWG71RBCjnl4HWVhrLzaFgoe4QOvGy+ua3t58Fv1YkwZ5EFlXHiRi8zcHORLhco
	xY3h76lAmBuZaNfSdVSYwBZwy6stEXlmC0hZiPnS7+NDUxQjm0bIDqIBmeTeLx3RhSSc
	SNjA==
X-Gm-Message-State: AG10YOQEUhDFcHPvqn6kgQp77tqUfHLKjsAGH9P5JtRK56Wd3U1DLsGLqbzVi7YHHH3OnnjElTAzK6olPhkjhg==
MIME-Version: 1.0
X-Received: by 10.31.8.11 with SMTP id 11mr8294453vki.128.1454658682728; Thu,
	04 Feb 2016 23:51:22 -0800 (PST)
Received: by 10.103.82.152 with HTTP; Thu, 4 Feb 2016 23:51:22 -0800 (PST)
Received: by 10.103.82.152 with HTTP; Thu, 4 Feb 2016 23:51:22 -0800 (PST)
In-Reply-To: <1454613723-22027-1-git-send-email-akuster808@gmail.com>
References: <1454613723-22027-1-git-send-email-akuster808@gmail.com>
Date: Fri, 5 Feb 2016 01:51:22 -0600
Message-ID: <CACS+7ZS4DzLZrYZXQ2Uk5vAn-oRSG+PDriOFhCjUsCvPSfnw_A@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] python-django: update package to 1.8.9
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
X-List-Received-Date: Fri, 05 Feb 2016 07:51:22 -0000
Content-Type: text/plain; charset=UTF-8

On 4 Feb 2016 11:23 a.m., "Armin Kuster" <akuster808@gmail.com> wrote:
>
> Update to a LTS version which might EOL in April 2018
>
> The following security fixes are included;
> CVE-2015-8213
> CVE-2015-5964
> CVE-2015-5963
> CVE-2015-5145
> CVE-2015-5144
> CVE-2015-5143
> CVE-2015-3982
> CVE-2015-2317
> CVE-2015-2316
> CVE-2015-2241
>
> LIC_FILES_CHKSUM changed do to:
>
https://github.com/django/django/commit/1dae4ac1778f04805c0ed62c8debb13b281ba02b
> * Removed trailing whitespace.
> * Added newline to EOF if missing.
> * Removed blank lines at EOF.
> * Removed some stray tabs.
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>

Looks good, but can we also keep 1.6? Bitbake uses 1.6 for toaster.
Alternatively is updating bitbake's dependencies on the roadmap?
> ---
>  .../python/{python-django_1.6.10.bb => python-django_1.8.8.bb}    | 8
++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-django_1.6.10.bb =>
python-django_1.8.8.bb} (60%)
>
> diff --git a/meta-python/recipes-devtools/python/python-django_1.6.10.bb
b/meta-python/recipes-devtools/python/python-django_1.8.8.bb
> similarity index 60%
> rename from meta-python/recipes-devtools/python/python-django_1.6.10.bb
> rename to meta-python/recipes-devtools/python/python-django_1.8.8.bb
> index a7ca803..5e4c435 100644
> --- a/meta-python/recipes-devtools/python/python-django_1.6.10.bb
> +++ b/meta-python/recipes-devtools/python/python-django_1.8.8.bb
> @@ -2,18 +2,18 @@ SUMMARY = "A high-level Python Web framework"
>  HOMEPAGE = "http://www.djangoproject.com/"
>  SECTION = "devel/python"
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=fa8608154dcdd4029ae653131d4b7365"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
>
>  SRCNAME = "Django"
>
>  SRC_URI = "
https://pypi.python.org/packages/source/D/${SRCNAME}/${SRCNAME}-${PV}.tar.gz
"
>
> -SRC_URI[md5sum] = "d7123f14ac19ae001be02ed841937b91"
> -SRC_URI[sha256sum] =
"54eb59ce785401c7d1fdeed245efce597e90f811d6a20f6b5c6931c0049d63a6"
> +SRC_URI[md5sum] = "08ecf83b7e9d064ed7e3981ddc3a8a15"
> +SRC_URI[sha256sum] =
"8255242fa0d9e0bf331259a6bdb81364933acbe8863291661558ffdb2fc9ed70"
>
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
> -inherit distutils
> +inherit setuptools
>
>  FILES_${PN} += "${datadir}/django"
>
> --
> 2.3.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

