Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 58FDA732DC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 14:12:01 +0000 (UTC)
Received: by pdev10 with SMTP id v10so19596644pde.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 06:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=1qUrN2+xRIgIkn8w3l4E/lGl43NQKc3eHx0bOasxEhw=;
	b=ys9YXk+pbY5TrfJ73gu52S3AHH2EmOu4MhHtySydJMvO1rirXx0URd3Wyx15K/IRen
	3HGZjKN3j5ZL2BijjfseVw3PyhifIW4S9zQhXnAa5TdZCN7u3Zn/M0dphxWz0Pbno9Ul
	88B1VMbqR/YAvT50JLvWxZs8eMsc7uhXWZl1bNt0m/p2ubmtap4aTiZbQ5+B4+eQXKzp
	Jvc7d0e5gtLpA1p3CPci22PubJh1ZSOfw31GR9wOqFA93OhnkCoUtn0EtudheLq5zI4e
	gi2QCTacew/t+fc8GVPVH8WgpEzsK/faXQsb5HRHKBDoRmPKJanqSbxXEhUtEADni5p/
	uw2g==
MIME-Version: 1.0
X-Received: by 10.70.132.71 with SMTP id os7mr15795452pdb.94.1423836722665;
	Fri, 13 Feb 2015 06:12:02 -0800 (PST)
Received: by 10.70.36.36 with HTTP; Fri, 13 Feb 2015 06:12:02 -0800 (PST)
In-Reply-To: <20150213115717.GA2297@jama>
References: <1423776119-14981-1-git-send-email-schnitzeltony@googlemail.com>
	<1423776119-14981-2-git-send-email-schnitzeltony@googlemail.com>
	<20150212222204.GJ2272@jama>
	<CALbNGRR=AJAqS2MD=Ve7VMSi5qiCPaxHtRBVKBmhMEQvpURR5A@mail.gmail.com>
	<20150213115717.GA2297@jama>
Date: Fri, 13 Feb 2015 15:12:02 +0100
Message-ID: <CALbNGRT9BNR24i_xmot+_7=83kJHaaNmwx3wt8uV651YWqsD6Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 01/19] libmbim: initial add 1.12.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Feb 2015 14:12:05 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 13, 2015 at 12:57 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> >
>> Wow - I don't care for this but want to be a good boy: What is maximum
>> length of SUMMARY?
>
> 72
> http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-SUMMARY
>
Thank you for clarification. I checked: V2 should be OK from summary perspective

Andreas

