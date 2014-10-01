Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id D14E06017E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 01:15:52 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id uq10so128399igb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 18:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=89tOZEOHaZOMTu74Gw/D2IdV2STPxQ5SVIVTDVWJNjI=;
	b=0h7Mjajt3bf0FQPySyyyxg4GOMylYJ+W6iEB/GRSjD9z8ies42HPmFTk7F8Q9uo9nM
	9uTQqoRZ8FB8nuUJt1qZqyR0nKmzmfFi0iD1G0nszlgGyrP3nB2So/DeQeEzBDBrQ+ih
	M8lNloPuvQrsC4kXBHy/JQbdiWkwYKBiDU4Gycx5OEEBuz6oZSZjthYzMK4aEYyBsT9d
	iSOAxDEest4q/C7C7t0mUIn/c3mw2MRD64xRhtdLv7eKBVzhWcFi9X7tD0NYrxf6FchQ
	N8QEnBXAiirvsXEE+XHWkHu2dp9Vzr9g+Wsz6DERqCg9TZ9Pb3qwBFC9C9/aqrKegAmV
	MlmA==
X-Received: by 10.50.61.99 with SMTP id o3mr14085145igr.30.1412126153058; Tue,
	30 Sep 2014 18:15:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.179.5 with HTTP; Tue, 30 Sep 2014 18:15:22 -0700 (PDT)
In-Reply-To: <CAAQYJAtyR-Hr6gPZ2z9kJ3auNyj==qM4f0dzcPosTQizwiU5uw@mail.gmail.com>
References: <1412033122-26076-1-git-send-email-andrea.adami@gmail.com>
	<CAAQYJAtyR-Hr6gPZ2z9kJ3auNyj==qM4f0dzcPosTQizwiU5uw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Sep 2014 18:15:22 -0700
Message-ID: <CAMKF1sqtRxnm1yFoUQUwCwkFArmXk+ObojZbvVh2-mv=VCQZRA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-handheld][PATCH] linux-yocto_3.17: zaurus: initial commit based on 3.17-rc6
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
X-List-Received-Date: Wed, 01 Oct 2014 01:15:56 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 30, 2014 at 1:13 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> It looks like this patch is too big for patchwork.
> Please don't pick, pull request for it and more patches will be sent as
> replacement.

yes. I have to kill the patchwork mail parser as it was going circles
on this patch today morning

>
> Cheers
>
> Andrea
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

