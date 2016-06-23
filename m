Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id CC9E4601A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 00:52:26 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id ts6so5146117pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 17:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=2bZ3clSq5P7yynhGAfavM6R2DWtGHTO4/M3vkxPeElA=;
	b=UxS7ALwWSrN0Y8uopNU/j8ASSsbnqmL7pthw0nLveb76lnA8uE4m/wSyPICuNUwTgW
	s1vZ+r7G0TgRP76TSRdNSBr7gE5hERY9/f+kOTiSZJ6pYqi/vljBy/1MBs/fzayOgBUi
	bGSamNahUss14f/cD2fzae71AxV+Fc0cOo2GxnDjQDfqGtVon9vantYU1iHM5MgbNhNR
	CFo3OX7tbkoNo3I8RBvF72l0llqOOXSLMt/KOY7hETFnWP2kgEg3eIoH6YsE6l4soqKU
	wuMSvlOTsjMC/6OPSByr5JP+qi/VqkDKEPiWmSaXgJWrKwg8ia63VAEmpFgRuaHjLpUl
	jH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=2bZ3clSq5P7yynhGAfavM6R2DWtGHTO4/M3vkxPeElA=;
	b=m/UUHyHqDlGcabCMuCfgMWcnk70DwJ4gDAkRh6SYdsBPRiuFwcSGy5p8eOrW4sxhdg
	vPxQLF0tnbCMYGDrAoph6XdKKPx+ccKDZnx/CilTGjfiD98SMq4SyV19gOsSKzsMq5o4
	XUuwhsKvJEnVxRm0R8ObHLjg8dDgFwF6RAgZKzFpx69bDAbQmhyLgUD1CsX4bGgJsmGO
	tSgPfVcw3fFNcXjkJcr8Drd6BwLph+LCdJ+7uKlREB+mCPjTFT7rWVmcheaWQ09nKu3+
	kNnKirV/BJEd0stuvCBLb0oRqfuS3xbgF0ovKJVbG9tb8V6h9kgiCZgx5Cm2dzVFafI3
	5Vvw==
X-Gm-Message-State: ALyK8tJP4K72CFkQU/1n3S/VNHwWpDcnLiYaSXnZE0RyfHRqUcSIx2Sg7eP0WxT8QXI7AQ==
X-Received: by 10.66.81.70 with SMTP id y6mr38199075pax.121.1466643146432;
	Wed, 22 Jun 2016 17:52:26 -0700 (PDT)
Received: from [10.43.100.29] ([50.233.148.158])
	by smtp.googlemail.com with ESMTPSA id
	ql1sm2577548pac.2.2016.06.22.17.52.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2016 17:52:25 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1466025817-30091-1-git-send-email-akuster@mvista.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <576B32C7.6090209@gmail.com>
Date: Wed, 22 Jun 2016 17:52:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1466025817-30091-1-git-send-email-akuster@mvista.com>
Subject: Re: [meta-oe][v2][PATCH] cpuset: add new python package
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
X-List-Received-Date: Thu, 23 Jun 2016 00:52:26 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


Ping.

I don't see this in the patch queue, was it removed, dropped or did I
mess up the submittal? Did I miss a response ?

regards,
Armin

On 06/15/2016 02:23 PM, Armin Kuster wrote:
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  .../recipes-devtools/python/python-cpuset_1.5.7.bb | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb
> 
> diff --git a/meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb b/meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb
> new file mode 100644
> index 0000000..8f6532c
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-cpuset_1.5.7.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "Cpuset is a Python application to make using the cpusets facilities in the Linux kernel easier"
> +SECTION = "devel/python"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
> +
> +SRCNAME = "cpuset"
> +
> +SRC_URI = "https://github.com/lpechacek/${SRCNAME}/archive/v${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "6ad79b26ba03f559604d74513cc34392"
> +SRC_URI[sha256sum] = "32334e164415ed5aec83c5ffc3dc01c418406eb02d96d881fdfd495587ff0c01"
> +
> +S = "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +inherit distutils
> +
> +RDEPENDS_${PN} = "\
> +    python-core \
> +    python-re \
> +    python-logging \
> +    python-textutils \
> +    python-unixadmin \
> +    "
> 

