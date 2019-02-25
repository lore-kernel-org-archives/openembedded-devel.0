Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 110776BE21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Feb 2019 01:52:54 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id v10so8783477qtp.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Feb 2019 17:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KhKH2tBr5/oC351gQIyNVIG+1bYUvERd3BZd+GN+wVs=;
	b=G2NhZFCMJaztpUM49VELExSQmHbINhm6xaAK0eZAtzMSHkC/9NMqRNb5a0CuzTag6C
	MidWkmNqBE+kGZp9gAtxNcrOPsZiBi+tcvpxsD0T05kBl39PW7iG2fCfo7BzvflPj+vd
	YEYpnOKaOEO1ov1d4n7QSdpAadghi5kd2NpVsZ9xF12cUxgiQ2xgajarXzXfJ1hJQTaq
	FVYtnxFIHjFvhtsdjgd2UIeUbtYnECVi2JmZTuEM3b2cwjV7iSvUUbByYQhiZgevj0aq
	MwS23dYg23Lee6R44uHIfq/E1InpUnNLlbfPL7haujURNZ5b0P46DBpZscezXaR0D0JU
	1zzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KhKH2tBr5/oC351gQIyNVIG+1bYUvERd3BZd+GN+wVs=;
	b=eBwtrZ1YPx1NZ1XZPmRAhPHJmR9VG/SGfYFzW2JjW3PddUpUKF/k580BTPJiidCg1U
	QXLdeXdGfm5jMMzvvaZhV4ORBaG+tgHDrkKb66jn+0aj2LMw5X/kXni+DjUHkss/tMN+
	Sm9RN+dZpBmzKHKb9x+UaR59c+uuZJ8thxp9H+GMjL87Im/IqVklolPOPdrxnQUmfOQV
	ib3yTJATYCzX9/lDeS6t4HxkYE0qLkY/G/l6fH55kcv12jiK71PCVwMqWOR7dSi6aKax
	tW1TL+UYjm7MIfLue1jKxbMJVPFRPr0Mpqvidesn/o0iNKNpXUoR3TcsExuutPKhYhso
	KcEA==
X-Gm-Message-State: AHQUAubKbGVdfqHxzFjK282NMPdbcbGC4XqAfwvdpv9rzp+f//BxA3/g
	w4FpGG6ZXjNLM+i5wQAz9hEevJTmFQPe1Vtji6wd9qfU
X-Google-Smtp-Source: AHgI3IYrRr+Z/QV9ACbYBFIwQbQCtlNZXStpzBqCajQ1geHdqjjHn+/w0uhT/b/CFZCCBsF57BmaP5jqNEnHYaqKsdk=
X-Received: by 2002:ac8:2c51:: with SMTP id e17mr11574012qta.254.1551059575512;
	Sun, 24 Feb 2019 17:52:55 -0800 (PST)
MIME-Version: 1.0
References: <1550200574-9614-1-git-send-email-chandana.kalluri@xilinx.com>
	<MWHPR02MB2576AFB4217110298F064C3CB07A0@MWHPR02MB2576.namprd02.prod.outlook.com>
In-Reply-To: <MWHPR02MB2576AFB4217110298F064C3CB07A0@MWHPR02MB2576.namprd02.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Feb 2019 17:52:29 -0800
Message-ID: <CAMKF1sqo907AihyvtOH2cZHSft2iTzkAhnRFmA3B7ZmPsSgAEA@mail.gmail.com>
To: Chandana Kalluri <ckalluri@xilinx.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][master][PATCH] ace-cloud-editor: move ace-cloud-editor recipe to meta-oe/recipes-support
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
X-List-Received-Date: Mon, 25 Feb 2019 01:52:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 24, 2019 at 5:21 PM Chandana Kalluri <ckalluri@xilinx.com> wrote:
>
> Ping


did you check latest master ?
https://git.openembedded.org/meta-openembedded/commit/?id=cb1b5130441b79473fde4083c07ac5d18dd28561
>
> -----Original Message-----
> From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
> Sent: Thursday, February 14, 2019 7:16 PM
> To: openembedded-devel@lists.openembedded.org
> Cc: Chandana Kalluri <ckalluri@xilinx.com>
> Subject: [meta-oe][master][PATCH] ace-cloud-editor: move ace-cloud-editor recipe to meta-oe/recipes-support
>
> This commit c245374fafbc4769e0c98ae18ac9ff71f9f14169 places ace-cloud-editor recipe in an incorrect location. This commit moves the recipe to the right location.
> ---
>  .../ace-cloud-editor/ace-cloud-editor_git.bb       | 22 ++++++++++++++++++++++
>  .../ace-cloud-editor/ace-cloud-editor_git.bb       | 22 ----------------------
>  2 files changed, 22 insertions(+), 22 deletions(-)  create mode 100644 meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
>  delete mode 100644 recipes-utils/ace-cloud-editor/ace-cloud-editor_git.bb
>
> diff --git a/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
> new file mode 100644
> index 0000000..4ea6c8a
> --- /dev/null
> +++ b/meta-oe/recipes-support/ace-cloud-editor/ace-cloud-editor_git.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "Ace is a code editor written in JavaScript."
> +SUMMARY = "Ace is a code editor written in JavaScript. This repository has only generated files"
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=794d11c5219c59c9efa2487c2b4066b2"
> +
> +SRC_URI = "git://github.com/ajaxorg/ace-builds.git;protocol=https"
> +
> +PV = "02.07.17+git${SRCPV}"
> +SRCREV = "812e2c56aed246931a667f16c28b096e34597016"
> +
> +FILES_${PN} = "${datadir}/ace-builds"
> +
> +S = "${WORKDIR}/git"
> +
> +DEPENDS += "rsync-native"
> +
> +do_install () {
> +    install -d ${D}/${datadir}/ace-builds/src-noconflict
> +    rsync -r --exclude=".*" ${S}/src-noconflict/*
> +${D}/${datadir}/ace-builds/src-noconflict
> +}
> +
> diff --git a/recipes-utils/ace-cloud-editor/ace-cloud-editor_git.bb b/recipes-utils/ace-cloud-editor/ace-cloud-editor_git.bb
> deleted file mode 100644
> index 4ea6c8a..0000000
> --- a/recipes-utils/ace-cloud-editor/ace-cloud-editor_git.bb
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -DESCRIPTION = "Ace is a code editor written in JavaScript."
> -SUMMARY = "Ace is a code editor written in JavaScript. This repository has only generated files"
> -
> -LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=794d11c5219c59c9efa2487c2b4066b2"
> -
> -SRC_URI = "git://github.com/ajaxorg/ace-builds.git;protocol=https"
> -
> -PV = "02.07.17+git${SRCPV}"
> -SRCREV = "812e2c56aed246931a667f16c28b096e34597016"
> -
> -FILES_${PN} = "${datadir}/ace-builds"
> -
> -S = "${WORKDIR}/git"
> -
> -DEPENDS += "rsync-native"
> -
> -do_install () {
> -    install -d ${D}/${datadir}/ace-builds/src-noconflict
> -    rsync -r --exclude=".*" ${S}/src-noconflict/* ${D}/${datadir}/ace-builds/src-noconflict
> -}
> -
> --
> 2.7.4
>

