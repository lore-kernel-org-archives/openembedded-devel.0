Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0138A77257
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 14:15:53 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id f65so2749352wmi.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 07:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=63WT1M/BnXvY39SG5etcusezJ5DOKzO8uhlCU2QBxJ0=;
	b=cPEPDixd+J+vwuG/uNyTDWLTNe8JgaDVOi2wnv4jyUSANT6EHMiUP6zwXkx/XFGfb0
	fwu1kFaPLmc5xKq2w4kNvGqkhGvJpppP0N5UAcpILFu95+ajkEv2mhkglU6IFwag+dt7
	UC+qFpucGs6QNe27KYRuE4lDG2pZoF9QJXFZDoqPnkLtWQnA8NQyvwgxPdDIgPwe9VEg
	t4K2LeRyYS2c5CHNioBOggs+cc2C/z/QcA+PILvDASX2+o1t8TbN7/b4iiXkca9l0/Ns
	X6VbBD+/AiscTZGiQ5Kh8cQkh466kzhh9EZthwQGOchwv/Xzd0zgLQEmBWu1Rtb8GxJk
	B8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=63WT1M/BnXvY39SG5etcusezJ5DOKzO8uhlCU2QBxJ0=;
	b=KBUVRWLeyzJLBgW1lP4oEz3mcPE0n7wmAR9f+KnOGkD9eWgkhpZaQ976y+QMIhdzNc
	nvrurHrHtmLyRscLFtwu9kW982Iw7iuTbCjEVQ54LyYdo6wbqtVQ4OTZw7LjUvnDfmgr
	K6seLLRjpa3s/LEQi1aa9mDjhang2zYOeflM9NSEtcsTZh7lD6SmFsmLTjZOX3n6r5fr
	8pKNdnNmRLUhEx7a8DXb7FOp//TaKxDksils8Rowdsi/yQQQGaoLbND7aVLH7xoLpzF2
	Rr7Izz4hQyZ46ygpJsoFzVg3YbdAxu2n3IaJHHjbeTgkFrjCWk8PtwtYvWXe/uq1xmlQ
	Zg+w==
X-Gm-Message-State: AEkoouvQKw/JewpqAcnUsy6JweYS2AX+MhrcMVmJUtC4cljqrK2S0teearot8lcp6972HfWFP+XN7CBhccdSRA==
X-Received: by 10.46.71.69 with SMTP id u66mr1645377lja.14.1470924952710; Thu,
	11 Aug 2016 07:15:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Thu, 11 Aug 2016 07:15:51 -0700 (PDT)
In-Reply-To: <CAJTo0LbHi5+jwgKMV1-G4SvzkWKvGaEO5t8zTEfi9VSpeN2teQ@mail.gmail.com>
References: <20160808115112.jhhfu6wqmwbv5qzh@jama>
	<20160808120310.22277-1-Martin.Jansa@gmail.com>
	<CAJTo0LbHi5+jwgKMV1-G4SvzkWKvGaEO5t8zTEfi9VSpeN2teQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 11 Aug 2016 16:15:51 +0200
Message-ID: <CA+chaQfwCVnYDEwuRV5TqHkeNfyafVQvjKmkSfDFyavfjND9-Q@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "fan.xin" <fan.xin@jp.fujitsu.com>
Subject: Re: [meta-oe][PATCH] qpdf: add new recipe
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
X-List-Received-Date: Thu, 11 Aug 2016 14:15:56 -0000
Content-Type: text/plain; charset=UTF-8

I'll leave that to original submitter to resolve, test and resend.

On Mon, Aug 8, 2016 at 5:21 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 8 August 2016 at 13:03, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> > +do_configure_prepend() {
> > +    sh ${S}/autogen.sh
> > +}
> >
>
> https://github.com/qpdf/qpdf/blob/master/autogen.sh says that this is just
>
> aclocal -I m4
> autoheader
> autoconf
>
> So I don't see what this achieves as we're about to run this again anyway
> via autoreconf.
>
> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

