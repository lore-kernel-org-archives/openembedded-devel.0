Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9D397784AF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 22:02:30 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id i187so1353997ywd.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 15:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cWGeh+YjEYWPt/fhK6V1d7XR1rXElaXOHwTj0GrImds=;
	b=DWIfjSgajlCQlbkJqapFL5ftTDblnJ73YId/ogS586VfIUCzowAUPwcoelhdnISBV6
	jBgcLkA/b/tEAA0P10VsLCP2bFeDGPlO/YLBkkPrj1oq4qtCfpRBEcGKq/NUioFdvVHj
	yPaxDMArD0zQfgkgRrEtl0rSdTzzwdbfTrlerh23HKBDBk/pvFqeUqzdlKmdycaAXWHA
	hO0laU6Drm8umQPtC4qSXEAKlmKUodNROYAYNsmKmDTLzLLIZzSrz/HBi5VUhMAhjW8n
	Klu/wKbpE9adDk85LXnYiaaQxt7kQOiGvW0R3uu5Tc4BckDP33GUFwT7TN4ZcIawB6AW
	NDwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cWGeh+YjEYWPt/fhK6V1d7XR1rXElaXOHwTj0GrImds=;
	b=UWMNyXhT2DBatHl/ub7mc1l5JoBitIZfqCKZRt8IQE0diULdk6Lpne7hzo0vPtjJ15
	BprWyHzVw2XCi/T5QHqXwSMK+VKD/1sOGeq+NAuMafIwgmmRLMEcSpOkZq0jG6RQFYF4
	XEFKUbCu4MbNEWnxLyObO5BH85lDzbFwNHM1xv3Jd2owQUa5QE6PS0Z+wX4CNEoabbGE
	0xcVd5L2wR2bTegJcv69h35vUeN1zs7xJ2nVMTKaKd7NUSXtup5X2BbWF8LPRN1W6M90
	x5F3SaLYCKjiDAEPw0Tpry8WW9MumvcqAJPHz4ROdQrgRMCl1w5CJLCgMM4BWJ1cch4Y
	+64A==
X-Gm-Message-State: AElRT7HfBqqDIPfCOUYQc7y4VdDaGNPSDe5wx9Zi1AU5wIBIfhh9raH8
	fI/4Ir4YBnVVAmmeyTJci729Z8UXyVCSrrFzLO4=
X-Google-Smtp-Source: AG47ELuRjQHFJ6D4GGhTKXoUyUkeB+ax9ckikMMZbHPWr+laCwJnAfx69FeEoLAwft+ht1B3fs+MW9tbNlb77WVBoVY=
X-Received: by 10.129.108.137 with SMTP id h131mr23752597ywc.180.1522101751519;
	Mon, 26 Mar 2018 15:02:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Mon, 26 Mar 2018 15:02:30
	-0700 (PDT)
In-Reply-To: <20180326214334.26378-1-Martin.Jansa@gmail.com>
References: <CA+chaQdLz1OuDFa2BMTRz-D=xwFk4PFbASJOsxR=578_jQuP4w@mail.gmail.com>
	<20180326214334.26378-1-Martin.Jansa@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 27 Mar 2018 00:02:30 +0200
Message-ID: <CALbNGRTNSvJT-PO1GMSaaVxpdGjuJKxZTotkXj9dFXLJVV7e-w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv3] mozjs: refresh patches
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
X-List-Received-Date: Mon, 26 Mar 2018 22:02:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 26, 2018 at 11:43 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> WARNING: mozjs-17.0.0-r0 do_patch:
> Some of the context lines in patches were ignored. This can lead to
> incorrectly applied patches.
> The context lines in the patches can be updated with devtool:
>
>     devtool modify <recipe>
>     devtool finish --force-patch-refresh <recipe> <layer_path>
>
> Then the updated patches and the source tree (in devtool's workspace)
> should be reviewed to make sure the patches apply in the correct place
> and don't introduce duplicate lines (which can, and does happen
> when some of the context is ignored). Further information:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
> Details:
> Applying patch Manually_mmap_heap_memory_esr17.patch
> patching file js/src/gc/Memory.cpp
> Hunk #1 succeeded at 309 with fuzz 1 (offset 3 lines).
> Hunk #2 succeeded at 391 (offset 3 lines).
>
> Now at patch Manually_mmap_heap_memory_esr17.patch
>
Why don't you adjust the patch mentioned in the warning only? Might
sound lazy but touching all patches is dangerous business. I have seen
cases where devtool does unexpected/unnecessary modifications so I
tend to keep diff small. My workflow:
* run devtool commands
* if the patches are at different place (files -> recipename) -> move
them back (of course only those build complained)
* remove / checkout those patches which were OK
* use git add -p <patchfile> to check in only those parts important
* git checkout remaining changes
* commit

Andreas

