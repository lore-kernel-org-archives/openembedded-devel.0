Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
	[209.85.222.177])
	by mail.openembedded.org (Postfix) with ESMTP id 618A37CA66
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 04:25:47 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id r21so417589qkl.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Feb 2019 20:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yahM24lqg93M02cyu6loOckOffH67KvMw8rOcUS7ilM=;
	b=KmzbhwPNWzHUulJNO0NyZEwpZFZcmRaWlTWlRAFW7VA8sjr/Pb/iAIT0ivWdGnf1TQ
	q6MWSbYvHhfH2eoKaMR+xE4wPQ/XaGypTQPllzHnkCK8QyaKeOjrLGfroe5XnLm3vXCR
	qC8OYu8kvoWcHLr+sIEEByZ/qrtFMOa3C+5fUL3EAycy5noYkf94KUuivB5eSGLJfYTi
	b0AS0XVogcpI7UD9bggmpomfJhj5qV0MgxPV6aJ4jtUK632DwhIJgOG0a5yuTegOVYWS
	zYTvmOZDy56zHOuBe+7eKFLiXxJWfaeQTcZCv3cQU58V3DR6WKunHQ+KE6bQV4hroP7T
	oedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yahM24lqg93M02cyu6loOckOffH67KvMw8rOcUS7ilM=;
	b=hC84lEFXTt9n/3fPp0+327sR5zy8A1mUSQhXlZdFHZSOqk/RYG8LEpJO1ahi2socor
	+fFbu1h/MqkCG8PkmtcIT3w7l1ZyfICz0RZr1245K+Yc3M2/s6fehAN2PGAdTlPoWkWq
	F9B09287NsjmyVpAHkhAhjRPPW83SGGc+CW7twx+f/frUoFbBbotsA3yR/+ysaWB0Ijl
	7Gr/Foa37XBkRUUSo73LePOlN8R+azHlkKzzHzdz/kx7YNdl+pch5WjajRlLoN4ZSPRR
	kxgyPBNfwPd6hgaJUEqoNU1H+fVXUgv4Exhvroia+XcVOAXUJ5K3hgSUlXgL0uXxyMp+
	Lc5Q==
X-Gm-Message-State: AHQUAuZgaPQYOg2oD16M6ZLFjD+ulSrVk8VREwvht4Vop5V20E8EJY8p
	PXZwulW7kz8CQ6pFtxDIe48pXULHGip9dlvf/SE=
X-Google-Smtp-Source: AHgI3IZyNerHKOgHX/Ig8MKa6eqZxrOrr0gmvW0sL1FAGnzRkp93bmE+avxEKtDK0NY+pSTXT6yq9Qng7mykoiHmErM=
X-Received: by 2002:a37:3d6:: with SMTP id 205mr1505547qkd.223.1550809547765; 
	Thu, 21 Feb 2019 20:25:47 -0800 (PST)
MIME-Version: 1.0
References: <a6e14d32-59d5-c567-3d45-3c3cabd6a940@viosoft.com>
In-Reply-To: <a6e14d32-59d5-c567-3d45-3c3cabd6a940@viosoft.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Feb 2019 20:25:21 -0800
Message-ID: <CAMKF1srL+jzhbi2Ko_sC9KQZoUMDpZM=FJEWjA4Kr02VG_dkxA@mail.gmail.com>
To: Hoang Anh Tuan <tuanha@viosoft.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH 2/2] gtkwave: add version 3.3.98
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
X-List-Received-Date: Fri, 22 Feb 2019 04:25:47 -0000
Content-Type: text/plain; charset="UTF-8"

Does not apply. Please rebase it on top of master or master-next and resend.

On Thu, Feb 21, 2019 at 6:11 PM Hoang Anh Tuan <tuanha@viosoft.com> wrote:
>
>
> Signed-off-by: Hoang Anh Tuan <tuanha@viosoft.com>
> ---
>   meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb | 19
> +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>   create mode 100644 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
>
> diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> new file mode 100644
> index 0000000..6fd9392
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.98.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "VCD (Value Change Dump) file waveform viewer"
> +DESCRIPTION = "gtkwave is a viewer for VCD (Value Change Dump) files
> which are usually created by digital circuit simulators. (These files
> have no connection to video CDs!) "
> +HOMEPAGE = "http://gtkwave.sourceforge.net/"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
> +
> +SRC_URI = "http://gtkwave.sourceforge.net/${PN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "eac3073ef381e0c09da33590296ca37f"
> +SRC_URI[sha256sum] =
> "efa6bbbeb3bd54104425a69a2aa0d079bb5c3ecc1c420ba57dcaa1c97c5a22f6"
> +
> +inherit pkgconfig autotools gettext texinfo
> +DEPENDS = "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf
> glib-2.0"
> +RDEPENDS_${PN} = "tk-lib"
> +
> +EXTRA_OECONF = "--with-tcl=${STAGING_BINDIR_CROSS}
> --with-tk=${STAGING_BINDIR_CROSS}"
> +
> +FILES_${PN} = "${bindir} ${datadir}"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

