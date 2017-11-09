Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8285560620
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Nov 2017 05:52:32 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id j14so3604066uag.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Nov 2017 21:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4jKsesvFmQ5U0RI0QwNZ52o/W3O7H88FSS+E2E8eM8s=;
	b=pwgBX5ZD0SXhvjvjhA2p3xJ14SscD8WB6HXpuFTGV4uPfyQP4g79y6nA3DcCRGKrIQ
	02meJe9Gyy60UpGTDI3fuSysvqn8jYWKHV5puCLiRjVb3grB7te/4/XvB7rCGcV/9mhz
	DaHWpICJe0cGCXmAuzidMKNNKWhrnXcvRtCIk9Bs1Xv3vwR6mFsojmZKEZvzfmEj7CSq
	/c78tDcACt4TpSKrxGmmCmVXKgeH3ANx7MD62iF5LOcT+69XI5Aexxn+BXAkCV+Vzm0k
	1/59SNyXAZBLQ18/CqxGihi+twmy5vmOz4sqDahyjrbb2ItwrrbOYEZwxDnbYjAbtxoZ
	02dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4jKsesvFmQ5U0RI0QwNZ52o/W3O7H88FSS+E2E8eM8s=;
	b=kGUGiPvBcMU0Rx4cptBiqoVi8pXMFGLM8SebEVTUyN0ha31j67nSE+MmIgaQz24ZOS
	99C2mHRvOsUwcPhX1QvY1KRUlFMxzNst58NERoUDF4VNdFX9wA+xB8cqYqfJ8Wsf4fwW
	5NV1oRLx3cm2mscR+ItCvZbaHQcIzbWE//IGsbHzXwxnsf4rvPwHiMXsD4ONWdRJmwlh
	wjuqu+uTf6E07jZs3doqD7DDMHPvodlUGwnxqcLYuYi+Lajh7kT21Jy3Yn8SwSWryNxy
	VfdNn+Gtvv9Hh6eoCLPnjdSz3y+XRnRHJDwPDGzECqvyF7fHdCnVLOXc8yxf0hVVzFLG
	/r/A==
X-Gm-Message-State: AJaThX5CY509JU67uXS06HLB8M7S+p9hRPLIP4yWh2OS9AxWNTI63dzd
	oSf+vtg/QzDWRAfjxd2Bx9Nx0aveszAw5UwAglY=
X-Google-Smtp-Source: ABhQp+T4AXU9SUBfzbUgLf2HJBg4n/1m+dJc6s/oQDkQYAOpM6F/5PBlboO8RET2UcV0GXGeejOu1hINpAECNATXTf4=
X-Received: by 10.159.50.112 with SMTP id y45mr2629535uad.166.1510206753262;
	Wed, 08 Nov 2017 21:52:33 -0800 (PST)
MIME-Version: 1.0
References: <20171024192754.19623-1-alex.stewart@ni.com>
	<34e1dd1c-e88a-7891-dc26-745946508deb@ni.com>
In-Reply-To: <34e1dd1c-e88a-7891-dc26-745946508deb@ni.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 09 Nov 2017 05:52:22 +0000
Message-ID: <CANx9H-A512DWX0O0aTcTzmvWKivmTxic9B1KwJZ9L1dU_nwZEw@mail.gmail.com>
To: Alex Stewart <alex.stewart@ni.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-python][PATCH] python-future: add new recipe
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
X-List-Received-Date: Thu, 09 Nov 2017 05:52:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 8, 2017 at 9:43 AM Alex Stewart <alex.stewart@ni.com> wrote:

> Bump.
>
> Is there an ETA on when this patch can be pulled or is a fixup needed?
>

It is in staging:
http://git.openembedded.org/meta-openembedded-contrib/commit/?h=stagging/master-next&id=a890147a94b48fe817e1cffda300795b9448f52c

And therefore likely to be merged in the next few days. We are in the
process of handing off some of the meta-openembedded maintenance, as
discussed in the OEDEM meeting.

>
> Thanks,
>
>
>

