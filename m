Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id B7F00701CD
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Jul 2014 04:55:50 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id h3so155880igd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 21:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Gg9b27whMpN/ANlePuygyq41K3SdBSUkq8/Eca3UUb8=;
	b=JmKVx2bIbg0PjUR8HoHIhiXXYENEvzlFU1ZMliftLCcI8B5epgssljzm4zuylYKwuM
	C4BmXrPURA/4icmtj+HYmIvqgzERbn5E+xJA95iFeu7h9X9YOmykIrSUYLNi4j0ClYxg
	1Shr7yvUxg/U8eGPog2BC7mfo5+5IbzdOeK4GELM5xgqGw++zlZphorDvKROJBRhRbiT
	ybwHPxZQzZfpqv15gyHHm4v/ibvDR3uU9bjvNh4nCOGZmQYa+1mR3wCn0fK6P0fFucxN
	I9sST1T9mg2XaOUWJrzC1CngLcVgl8M3ps+WDzIyBEcEJv6TqBFgcUX3LUpAu1tL74BD
	UB0g==
X-Received: by 10.50.126.7 with SMTP id mu7mr9936518igb.20.1405140951171; Fri,
	11 Jul 2014 21:55:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.78.105 with HTTP; Fri, 11 Jul 2014 21:55:21 -0700 (PDT)
In-Reply-To: <1405090473-5413-1-git-send-email-philip@balister.org>
References: <1405090473-5413-1-git-send-email-philip@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Jul 2014 21:55:21 -0700
Message-ID: <CAMKF1srKfr+EDu7yMMa_0rpuFiwZpu-e+ALR+b=rv3YLfswYcw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: (No subject)
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
X-List-Received-Date: Sat, 12 Jul 2014 04:55:58 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 11, 2014 at 7:54 AM, Philip Balister <philip@balister.org> wrote:
>
> I was trying to get this recipe into meta-oe before the daisy branch, but
> it had to wait on some other patches to get into oe-core.

which one?

>
> Now that these are in place, it would be very helpful for people using
> GNU Radio from daisy if this recipe was in the meta-oe/daisy.
>
> Thanks,
>
> Philip
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

