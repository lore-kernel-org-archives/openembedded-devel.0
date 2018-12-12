Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id D6C8E6079F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 22:08:09 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id q70so11776277qkh.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 14:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XWClANb257Mk97cSiKs8cM4sMiNWKhhT6s4TrRim41s=;
	b=CtRem9WR3w+NK4/ZO7H8VTojiJ7EYrwYatuRHmiaOPe0pfFeBMk8FGBIxNq5sUKVcP
	8saMHPlUjBtZ2KtjZjMCmw1ykEoXIugWqC+hJrmtkV/Eh7zxp5MsG1BhAllMTuTnQ1qH
	hcMHqnILsuwDUPMMMzehKtlHhc5fU13non90JD16DBnbcIf6x7BZyTtHiu6N6tXQjJEl
	wwRc7NCx8GZUO01e7l25UwyJe6vkzCGQkZUmzEgWAyExARir23bGRHHcbpJb4pQyIr3W
	cLDAjwZFJNyx8arWjVgtI+FRZwMKAx8ZBd27a8A6K3FDavU3U2WD+VqWgFnvWp5XAEa5
	fqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XWClANb257Mk97cSiKs8cM4sMiNWKhhT6s4TrRim41s=;
	b=tEVP1d/q6ZVNY6Cc9BqQ2xOcUqvKVVtWjHGoQ94LCSE+DlJVbarrQfRJIIDHsDxXjm
	hkl1r8WuK+Rmzf3RgLG8xOxV7lsiyXiFdQ8RCcmFJX3UhPk5/lT9lJ6bAa301Z4xVhyX
	SdTxfRvfwP5RRK8r2+B4wgdWRDskrtxy165B6mN+34yqOpxsl19peUXeptlIbPzBDB9o
	pp0fyRxL6wq52pYHTwET6f1dGmRZaLEDS4NeMcTykaYmbJt4Wnj3oypJwoZ5P7kj5kdK
	q7WibOJGS1T5aRGEn0aL0ZDPwzRI6/u1zAzCMEDmjeYejjDUiDncrhzEqFLPrnl1/TjW
	it0A==
X-Gm-Message-State: AA+aEWZwJn9iOvIYWjaKwQmBGz1626AdMG2d2JoRQnjdqhpi5kmTCtn/
	Fk56dBNcICoLSTsmsRirzZgVyf9vZdYlXohPRsw=
X-Google-Smtp-Source: AFSGD/Xjsm3y3HrRLTXcjf/enXggKthAgvTmdlnKpYNjBurgMeQlvDkYThSYCGxI2uBHH9Tol9eu0oA+6EycfWewkIs=
X-Received: by 2002:a37:a80a:: with SMTP id r10mr747137qke.2.1544652490277;
	Wed, 12 Dec 2018 14:08:10 -0800 (PST)
MIME-Version: 1.0
References: <3045fc0b-288e-322f-e4eb-d6ff637abf2f@linuxfoundation.org>
	<CAMKF1sqqSqzXoEYO==L6t_3t6BEHFsUC75Tv9H-2pHdmv-7mtg@mail.gmail.com>
	<2d3cdfda-317a-1f8f-3018-411dc7acd7d5@linuxfoundation.org>
In-Reply-To: <2d3cdfda-317a-1f8f-3018-411dc7acd7d5@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Dec 2018 14:07:43 -0800
Message-ID: <CAMKF1spLVorCU+gv3ikyVTJcUrFUF=64Rs1RpSFZpyA-vy9XuA@mail.gmail.com>
To: Michael Halstead <mhalstead@linuxfoundation.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Shall we remove bad-checksum files on http://sources.openembedded.org/?
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
X-List-Received-Date: Wed, 12 Dec 2018 22:08:10 -0000
Content-Type: text/plain; charset="UTF-8"

Not that I can think of.
On Wed, Dec 12, 2018 at 1:18 PM Michael Halstead
<mhalstead@linuxfoundation.org> wrote:
>
> I've removed all of those files and prevented them from being mirrored in the future.
>
> Are there any other files we should remove?
>
> On 12/12/18 10:48 AM, Khem Raj wrote:
>
> Yes they serve no purpose deleting them is in order
>
> I should also check the Jenkins job to ignore them
>
> On Wed, Dec 12, 2018 at 10:32 AM Michael Halstead <mhalstead@linuxfoundation.org> wrote:
>>
>> With the current setup files will accumulate on
>> http://sources.openembedded.org/ over time and none will be removed. Are
>> there any patterns that should be removed over time? *bad-checksum*
>> files seem like an obvious choice. Please share concerns or suggust
>> other patterns to remove.
>>
>> Thank you,
>>
>> --
>> Michael Halstead
>> Linux Foundation / SysAdmin
>>
> --
> Michael Halstead
> Linux Foundation / SysAdmin

