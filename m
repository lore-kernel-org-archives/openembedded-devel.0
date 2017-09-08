Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 8ECB3780F9
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Sep 2017 16:18:16 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id t3so5634859pgt.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Sep 2017 09:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jTSA+9Bydja6m6ph+9U9VNRLXnNwM1LfGD5s9R/GZB0=;
	b=DbjxrLXLoNxytMX3YS8rPnuZn739EuLzvewz7iBvCOXNwgNlYHK/u3QmsemM6rXW6B
	5bvEjoRLe1ZezJJ5L4vYop+VF1Gpfode3yGkjGp4n2ICwPDB5iop0MdRFmI2hwpxP1TE
	nV2BXu62BsIyDww0TPbM7zKBOnLQuWRkaDhd0WjklcHe32ebgCn+5bZjbJlDm4C2wpDG
	o5K64SQ5Oc5VYsBvO/JiALeEPaySa4faj2iPeZ9lrPh7TzEHkuhvNu7aGB7x0Rw92D9r
	OD/cL0bT8vFU/rB32JpU00G5+YiuI2lQLOzWZmPMT6+J7fqfAIp3f2V3newv7dovUmnk
	ZiXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jTSA+9Bydja6m6ph+9U9VNRLXnNwM1LfGD5s9R/GZB0=;
	b=MV3oXj7IibD1mYX9PqOg1Rfh2IqzmsVdxafWKWP8JZqvHxxdhwcX5zNusNvZ/wEKEK
	z4nswI1qTkdS8zh8l2fUdVIt7OV0zKPcxRoQrN/wgSMc/OA6rNFHdByFPAom9P1D28d0
	T5Opwx70WNy4wbuHkJnQz8i03O3plGwYNqE5p/PKcCJIGLLMa2iu+np30IXnSNiPZDuv
	HgQnayBWYhSrN7K6xcZ6PZgTS1m5ef9rCq3lkWwRDkMubWPh152PbDHHieUo0qNL7ptW
	7j1u2ZJSr0/X/64W4agKpTS2Bx76rMu3yicZBMVwlZS7iP4uOjX6aTJ7P1mSXAskY7TP
	lFmw==
X-Gm-Message-State: AHPjjUg0JISz2goCaSt4fgbG6wYQpYxwRpxNVMTnm04uHuN9h6DquTl0
	YRYpIh/oOJ3lGx/Tp0Uq223mTEAnPQGeIiDh5pI=
X-Google-Smtp-Source: ADKCNb5qdbQOwWiZg98pJCVUGqxZ++wT1v46jqbKnQiLkD6C+hGkqKKefr8QUCAFmMFE0ZkLeVxOAV8VBTG1blIzQZY=
X-Received: by 10.99.61.78 with SMTP id k75mr3536269pga.439.1504887497657;
	Fri, 08 Sep 2017 09:18:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.189.8 with HTTP; Fri, 8 Sep 2017 09:17:47 -0700 (PDT)
In-Reply-To: <20170908131343.12748-1-fabien.lahoudere@collabora.co.uk>
References: <20170908131343.12748-1-fabien.lahoudere@collabora.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Sep 2017 09:17:47 -0700
Message-ID: <CAMKF1soTUgk3j1jMduXjCN3jxgikL_vJUB+ye6KFtN=XcaoMjA@mail.gmail.com>
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] libupnp: Add recipe for version 1.8.1
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
X-List-Received-Date: Fri, 08 Sep 2017 16:18:17 -0000
Content-Type: text/plain; charset="UTF-8"

please delete the old 1.6.x recipe at the same time

On Fri, Sep 8, 2017 at 6:13 AM, Fabien Lahoudere
<fabien.lahoudere@collabora.co.uk> wrote:
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> ---
>  .../recipes-connectivity/libupnp/libupnp_1.8.2.bb    | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-multimedia/recipes-connectivity/libupnp/libupnp_1.8.2.bb
>
> diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.8.2.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.8.2.bb
> new file mode 100644
> index 000000000..61b209ab8
> --- /dev/null
> +++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.8.2.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "Portable SDK for UPnP* Devices"
> +DESCRIPTION = "The Portable SDK for UPnP Devices is an SDK for development of \
> +UPnP device and control point applications. It consists of the core UPnP \
> +protocols along with a UPnP-specific eXtensible Markup Language (XML) parser \
> +supporting the Document Object Model (DOM) Level 2 API and an optional, \
> +integrated mini web server for serving UPnP related documents."
> +HOMEPAGE = "http://pupnp.sourceforge.net/"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=b3190d5244e08e78e4c8ee78544f4863"
> +
> +SRC_URI = "https://github.com/mrjimenez/pupnp/archive/release-${PV}.tar.gz "
> +
> +SRC_URI[md5sum] = "db8061f7cbd7f9af993ac4e87ad084cb"
> +SRC_URI[sha256sum] = "438ad86bfd933cb1e9be1c41bf3bd69f049daba11d71bbb5d715336e00106cb4"
> +
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

