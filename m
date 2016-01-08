Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id CD9DC7327E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jan 2016 09:46:19 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id f206so162707127wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jan 2016 01:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VUal0fSwDp8seb4G/DOszilVHoYVze4nDo9GRl6QdwU=;
	b=D5wj+Vs07BAf78LlcrufP7+X45ihG532XwnRK9dnPtNDXQuvkwYSe2rPMU5aMCwkVp
	fCnrqvd7NlxhNvG0XNhjEFQ+0yN1dtTfArtWAplJrHI0EMATvPHnIFqDdmFlXt4ilx6r
	vGOVfg6xkfJI71RXsc9LoluP4cYWMMlfndJ+tS88VQgXllyJ4jnJWPlr8Kg1GOq7+Zx2
	/Qr/38cynLcjLiTIQRUROi5kyx6tnEVeBSnyHSjdksEHXJfL0p5jlDO2d4QULLiIVZVU
	CwkdM3OIz9kAalUVqffBwv6uzrZ7PT3VHgL8LICZpkv3cR6IBrxo5TiRL8jWXK6Ss/u1
	e8cQ==
MIME-Version: 1.0
X-Received: by 10.28.139.205 with SMTP id n196mr23445664wmd.0.1452246379770;
	Fri, 08 Jan 2016 01:46:19 -0800 (PST)
Received: by 10.194.2.15 with HTTP; Fri, 8 Jan 2016 01:46:19 -0800 (PST)
In-Reply-To: <568F8037.4050902@elfin.de>
References: <568F8037.4050902@elfin.de>
Date: Fri, 8 Jan 2016 10:46:19 +0100
Message-ID: <CA+chaQfSnmR2MtpUvprHjDBFQ_6ifhA_cNtDW_ZzSY_H+NADjw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: Unblacklisting package
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
X-List-Received-Date: Fri, 08 Jan 2016 09:46:20 -0000
Content-Type: text/plain; charset=UTF-8

set it to empty value.

On Fri, Jan 8, 2016 at 10:24 AM, Piotr Lewicki <piotr.lewicki@elfin.de>
wrote:

> Dear Paul and oe-devel list,
> I've found as a part of this tread
> http://lists.openembedded.org/pipermail/openembedded-devel/2014-October/098410.html
> that you know how do "unblacklist" a package from my conf file.
>
> /You can still disable that PNBLACKLIST in your local.conf or distro.conf.
>> /
>>
>
> I was trying to find out how to disable it but my research failed.
> Could you share this knowledge with me?
> I'm trying to unblacklist modphp package.
>
> Best regards,
> Piotr Lewicki
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

