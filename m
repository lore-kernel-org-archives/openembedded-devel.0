Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
	[209.85.160.173])
	by mail.openembedded.org (Postfix) with ESMTP id D921B7D365
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Apr 2019 16:52:30 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id k2so127901qtm.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2019 09:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mww0TGlURrwNJPo+kGvDY/P1unX5WNp01oYK7B031CA=;
	b=Lfu0mcwhh/JqUeH3/dvttEkEZHHXXBSVRv3paeE8tkmX8FY8VMmbBLbFKJpIxHAmbj
	t006xucivopftn2y4DY9mpgSpz0zVBeLQVSiu/5t+UJPgwFOenZQ6Lde6M4HJaurJOH+
	ic0E9BcAjUSGSm+ktkQKMG3WlHv/UE+/yKH5+aB1khwrEASYKpXafsqaM/VUbqRdfDTU
	rk1QgnHXJ0XXFycZxOitlLpVu5sVfpcPHC1byaOCDNO1fnYQ2Gf0+nia4Dc1JOTa/11q
	3l50tunQUiPMx8LKNx4REgF4s+xw5ds459KRQug8nEJqauwpGc9SBfFyoo4y+H8EwENU
	a+/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mww0TGlURrwNJPo+kGvDY/P1unX5WNp01oYK7B031CA=;
	b=dQz6pUHJFZzWO9v1PCFOgm82LM8o3PKWDecBkOmZ5SIWsO52wr6OCrukMuoQLaaFZq
	yC4qN7c11JacLXfofkHwCAdrVkgnJYT/1IIcy4IkNFy2OIy1HHKiFiq18G7uGiV8L4kG
	3EE5CVTTFn7uNxGHS9MrtXYT/Ds0yvZaCemnuqRWq9oNxRPVQwnVUFMiKV0Xl5PNv1UV
	E4gg55ChFigevTXP5woWKMP6uncLKe9lNveZTxczJAwseJI05YnSvQJs8xst70MZn0PH
	3fYKNwrAPTFZeu/USoLDqLdZMCYSrTi/drC4aSwKHRrc+mpzvVCHPxNggl6eCIygUa08
	Mh6w==
X-Gm-Message-State: APjAAAUT05QvBFmHe+6b0feZTxE0U40xXhASdBZUZOhzNt5mk3Bvhl1e
	ok8sXYlVMn/j+kdA6V27ewJ3cS6cCzhq97xWrYc=
X-Google-Smtp-Source: APXvYqwHEXsgbPP612NWksAm+gWYwp7sG9+He+TgrUsVDDajSFECT65VCgPCi0RCon9OzwnMjPUuxFd4/HNiYYoCUaE=
X-Received: by 2002:ac8:2aa4:: with SMTP id b33mr887854qta.127.1554310351670; 
	Wed, 03 Apr 2019 09:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <1554280123-19112-1-git-send-email-vincent.prince.fr@gmail.com>
	<1554280123-19112-2-git-send-email-vincent.prince.fr@gmail.com>
In-Reply-To: <1554280123-19112-2-git-send-email-vincent.prince.fr@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Apr 2019 09:52:05 -0700
Message-ID: <CAMKF1so1Y08xAu8Xk_4X388kc-W3nVbRcdy+qt6GQo0h1LN=VQ@mail.gmail.com>
To: Vincent Prince <vincent.prince.fr@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/3] cppzmq: bump version 4.2.3 => 4.3.1
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
X-List-Received-Date: Wed, 03 Apr 2019 16:52:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 3, 2019 at 1:30 AM Vincent Prince
<vincent.prince.fr@gmail.com> wrote:
>
> Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>
> ---
>  meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> index 9aff59c..2f99417 100644
> --- a/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> +++ b/meta-oe/recipes-connectivity/zeromq/cppzmq_git.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=db174eaf7b55a34a7c89551197f66e94"
>  DEPENDS = "zeromq"
>
> -SRCREV = "6aa3ab686e916cb0e62df7fa7d12e0b13ae9fae6"
> -PV = "4.2.3+git${SRCPV}"
> +SRCREV = "213da0b04ae3b4d846c9abc46bab87f86bfb9cf4"
> +PV = "4.3.1+git${SRCPV}"
>
>  SRC_URI = "git://github.com/zeromq/cppzmq.git"
>
> @@ -13,6 +13,8 @@ S = "${WORKDIR}/git"
>
>  inherit cmake
>
> +EXTRA_OECMAKE = "-DCPPZMQ_BUILD_TESTS=OFF"
> +

explaining why tests are disabled would be helpful for future changes
where someone might
want to enable it and if its an optimization then turn it into
packageconfig knob.

>  PACKAGES = "${PN}-dev"
>
>  RDEPENDS_${PN}-dev = "zeromq-dev"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

