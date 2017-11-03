Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id 7A6327832A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Nov 2017 14:51:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1509720697; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=TI70YBg46qUB9JQITcX2uMFiEN2d3hl//gl4WFg9dqE=;
	b=b3GIA1ce3tkWUAgH5v3qHrD57JeDhE9K1TU8KPyr1a5GR/s1LkML41v3ahGT6glvOSjttSyt
	yzfRENHVHhs0inEzvqJLkC1PfzqlRJQ+u/J19WxOs5AJAu/VRVbjROSIqCu4PzBfTiSQcD/S
	T2CgJzh61PSvCpA49GMl2tqa0MA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Cc: Content-Type;
	b=P7tB7mXm+he2cjxnZiq1bcEt/ahLnSwPygJkO3o8wkNfqPDwYQMMZSHicK0xiu9DSQtU6d
	PdiQ0cp6bwh7IjdJFiUTpVtR1KEfUrxLmsJyiDorqDaR0ZYuJ4uEpQoaSnV839gg+MNUSaCw
	71e2n41E0an+/kZz8CnrAtjHaleus=
Sender: derek@asterius.io
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mxa.mailgun.org with ESMTP id 59fc814b.7fc8e41ee070-smtp-out-n01;
	Fri, 03 Nov 2017 14:46:35 -0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id 17so3476739qkq.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Nov 2017 07:46:35 -0700 (PDT)
X-Gm-Message-State: AJaThX6pbE3X4rISIN8TPZGdJMX1hKRusLwHwZ6nxuWlsMwM8fQYQB84
	omTCRU3VX+rU+N5xsl9K8C9XqbdNnR1XNKNzC2g=
X-Google-Smtp-Source: ABhQp+SIbVvPYB+BBumXZAXX+Nw1ZqLKqrd771ZnPFEn4kCpGgOPp2riwm8XmwTVlBhnLM78jCMZq+iY0nGx3RjK/VM=
X-Received: by 10.55.60.129 with SMTP id j123mr10586882qka.121.1509720395030; 
	Fri, 03 Nov 2017 07:46:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.21.165 with HTTP; Fri, 3 Nov 2017 07:46:34 -0700 (PDT)
In-Reply-To: <1509720146-17487-1-git-send-email-pascal.bach@siemens.com>
References: <1509720146-17487-1-git-send-email-pascal.bach@siemens.com>
From: Derek Straka <derek@asterius.io>
Date: Fri, 3 Nov 2017 10:46:34 -0400
X-Gmail-Original-Message-ID: <CADNbA1q0UiiHXyz2iEahvFxF8O_3WmCZKUt62HvGo5wdL9Ld9g@mail.gmail.com>
Message-ID: <CADNbA1q0UiiHXyz2iEahvFxF8O_3WmCZKUt62HvGo5wdL9Ld9g@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Pascal Bach <pascal.bach@nextrem.ch>
Subject: Re: [meta-python][PATCH] python-psutil, python3-psutil: update to 5.4.0
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
X-List-Received-Date: Fri, 03 Nov 2017 14:51:35 -0000
Content-Type: text/plain; charset="UTF-8"

Patch pending inclusion:
http://lists.openembedded.org/pipermail/openembedded-devel/2017-October/115323.html

On Fri, Nov 3, 2017 at 10:42 AM, Pascal Bach <pascal.bach@siemens.com>
wrote:

> From: Pascal Bach <pascal.bach@nextrem.ch>
>
> Signed-off-by: Pascal Bach <pascal.bach@nextrem.ch>
> ---
>  meta-python/recipes-devtools/python/python-psutil.inc                 |
> 4 ++--
>  .../python/{python-psutil_5.3.1.bb => python-psutil_5.4.0.bb}         | 0
>  .../python/{python3-psutil_5.3.1.bb => python3-psutil_5.4.0.bb}       | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-psutil_5.3.1.bb =>
> python-psutil_5.4.0.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-psutil_5.3.1.bb =>
> python3-psutil_5.4.0.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-psutil.inc
> b/meta-python/recipes-devtools/python/python-psutil.inc
> index c9a7f6d..4170ea4 100644
> --- a/meta-python/recipes-devtools/python/python-psutil.inc
> +++ b/meta-python/recipes-devtools/python/python-psutil.inc
> @@ -2,8 +2,8 @@ SUMMARY = "A cross-platform process and system utilities
> module for Python"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
>
> -SRC_URI[md5sum] = "529244aea5d32fb0c2ea46d80ce54abc"
> -SRC_URI[sha256sum] = "12dd9c8abbad15f055e9579130035b
> 38617020ce176f4a498b7870e6321ffa67"
> +SRC_URI[md5sum] = "01af6219b1e8fcfd53603023967713bf"
> +SRC_URI[sha256sum] = "8e6397ec24a2ec09751447d9f16948
> 6b68b37ac7a8d794dca003ace4efaafc6a"
>
>  RDEPENDS_${PN} += " \
>      ${PYTHON_PN}-shell \
> diff --git a/meta-python/recipes-devtools/python/python-psutil_5.3.1.bb
> b/meta-python/recipes-devtools/python/python-psutil_5.4.0.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-psutil_5.3.1.bb
> rename to meta-python/recipes-devtools/python/python-psutil_5.4.0.bb
> diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.3.1.bb
> b/meta-python/recipes-devtools/python/python3-psutil_5.4.0.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-psutil_5.3.1.bb
> rename to meta-python/recipes-devtools/python/python3-psutil_5.4.0.bb
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

