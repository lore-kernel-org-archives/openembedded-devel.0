Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id EE467766E5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 02:31:32 +0000 (UTC)
Received: by ioii16 with SMTP id i16so99740609ioi.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Aug 2015 19:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Iwb4ugDlFLHopJjJl7B48z73rN9SY9VATMhNF/wdLq0=;
	b=o+oPJ0t/XPxZxHfWMpZBFv60HQ27A07mMLoDrchjRpqJkS9MDESTmUFdOa/yOKtEya
	49FuJd1oNhN+GgejhPITqLgvrPBXZ7oxKfPI2x6qXFQD9hWTPvbg2Atq4TV21ouKQ1WR
	ceDeW55xciMKxmbKS8otp95By9ibxuGFZ2V6bxkC4F7yfx9xirfMCA3jtuJmSmJVH/hf
	8b6RuORFuTXjNsaKMOFdHfZVf5FY0vQjMSIiy9IB2zztBkCOjOyN/EH0XDmfD/vlcu5h
	sQMgFDtULpAxMXrqKVhtkbTkC4WREKLXFA/OZO57UvtVTyLOt41SJq97woFDUwWhJirV
	w93w==
X-Received: by 10.107.14.203 with SMTP id 194mr6213808ioo.195.1438914692251;
	Thu, 06 Aug 2015 19:31:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Thu, 6 Aug 2015 19:31:02 -0700 (PDT)
In-Reply-To: <CAP9ODKrm-OgC5=_HTrPSpfNsGrab2cus7s8v1eRGa68_GLW5ZQ@mail.gmail.com>
References: <556EA59A.8010007@skidata.com>
	<CAP9ODKpB0A9JZbWdS80Dq2bNX1VG5e3PKTpSpCvdvCrwD4965g@mail.gmail.com>
	<55ACECA1.10102@skidata.com> <55C30BCC.2090309@skidata.com>
	<CAP9ODKrm-OgC5=_HTrPSpfNsGrab2cus7s8v1eRGa68_GLW5ZQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Aug 2015 19:31:02 -0700
Message-ID: <CAMKF1sozWdo2yarqU2tOZ_JXg8yRVVfjSsE712EzbNW=v5QJHQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] openjdk-7: 75b13-2.5.4: fix xawt build
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
X-List-Received-Date: Fri, 07 Aug 2015 02:31:33 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 6, 2015 at 6:02 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Thu, Aug 6, 2015 at 4:25 AM, Richard Leitner
> <richard.leitner@skidata.com> wrote:
>> Hello,
>> any updates on this patch?
>
> The patch didn't apply so I asked you to rebase. Can you rebase and send?
>

in addition please build for FSL ppc since that was original
architecture where it failed when I did this patch

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

