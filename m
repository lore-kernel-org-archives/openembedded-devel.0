Return-Path: <cazfi74@gmail.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 86E0D6AFCA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2013 10:38:26 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id hu16so1709478qab.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Aug 2013 03:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=CBeT2ZG//HNdKvbiyi2D0SnVrH9X1RkM61XWuMsinag=;
	b=E+yCA/Rwe7FF19V4xM6veOicPTNGK1pMQHADRWNhsJ7ACHsBT9CcreURYQhJISqOIi
	1qNef5Xx/VVcvFqKPndnGOKcY88jiSwM+G7o8a/6VzoOlVj5cbZmGok8R41XjAfmcuMQ
	tkyz3QB3FUQj/Zw+qPFpLafzggeAQOwA0Kaasv/XXeyMOF8R6ME5L7Tbldnt+bAZixJQ
	I9vJjf+kzlq9n9NDoOxLV8u8/YRnSR6eZQhV47CeULa5StbmSnWN+isez9eB3UW48sfI
	QntAW8tMz0f+VYJINx8Iht1pKgZuV0UwyS4rgDkhmrlnxE6NrHd7xpctZmkEpt7CGlRL
	7UzQ==
MIME-Version: 1.0
X-Received: by 10.229.134.133 with SMTP id j5mr3276353qct.41.1376908706598;
	Mon, 19 Aug 2013 03:38:26 -0700 (PDT)
Received: by 10.224.114.207 with HTTP; Mon, 19 Aug 2013 03:38:26 -0700 (PDT)
In-Reply-To: <20130819102620.GA522@jama>
References: <1376647801-30792-1-git-send-email-cazfi74@gmail.com>
	<20130819102620.GA522@jama>
Date: Mon, 19 Aug 2013 13:38:26 +0300
Message-ID: <CAF6bG8fbW0s0QReuzK=U9-0KYTV8Ho=VBpaTpGDAUy8+K5+N3w@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] ImageMagick: update to upstream version 6.8.6-8
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
X-List-Received-Date: Mon, 19 Aug 2013 10:38:28 -0000
Content-Type: text/plain; charset=UTF-8

On 19 August 2013 13:26, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Aug 16, 2013 at 01:10:01PM +0300, Marko Lindqvist wrote:
>> - License changed by additional copyright year only.
>> - Patch PerlMagic_MakePatch.patch part of upstream now
>
> Looks good now, do you still need freetype support?
> http://patchwork.openembedded.org/patch/51217/

 Oh, I had completely forgotten I had submitted similar patch already!
Yes, I'm going to need freetype delegate in ImageMagick assuming I get
the freeciv mapimg feature otherwise to work.


 - ML

