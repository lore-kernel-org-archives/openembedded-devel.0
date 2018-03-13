Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id A8F3B784F1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2018 22:19:13 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id h2so2427461wre.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Mar 2018 15:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VRqYIM9IMHsq4uK/uqvWwdyeYddBmhePSxWKhm19nt8=;
	b=KRhjb6Te5Lcgz4pUaGSXoHFo8prtEpy9lSB/fTrWxnCUZKnIjhhKurj/lkICjGJK+n
	HnQ6Wi3VzmPTWxyMzud1Ofu2t/obS8ayooLF3RMcJhKkD4/1pM54tXN8ouQg0j3j276q
	aQJ21mr0PMR4yYL4OqCjKNi6ICpkvu1n2GfF9LFydmdp04DiBqV9uJrd45F9T2Bbhs6D
	x16dU5JUtCvaxxHFqgiMlO8QYkCOEsKEJeHlmwtm0zfFaBCoRbsvIIkSbrRagYwUMBFU
	+eRb/Y0obioOYZ9H5P/V4awu/aPuiACPvXDHIQOK0fzexRrLMB3g6gAz79xrdbe/AvXd
	VQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VRqYIM9IMHsq4uK/uqvWwdyeYddBmhePSxWKhm19nt8=;
	b=CQUyXhq6oH+WDbtiU17QGoF9pckGNcd7fTjquzbH50qdgxgm+y/t8L5NVNcvDtBWkb
	sVDDQ90IkCTDWozxD1Y4fIfERrd44x/cq5W2FOzc9HJFkGjnhu3nbGfQbxgG/4IcN1WR
	gK392hk0UZHsrUb2ctxaQn3MVj5kKqrGpqd1CSsFeCHk/GHUELYKC2KZi/zKZjLcmkCR
	KrtRvOwvwRj8pUXsQQSUZuN7Gs7VqVhFsmjZ7PT0pW+xXcFqeiYKxqzLAG73NlWYlX0F
	aaJqr27PFiu3qu1+N0wqwBYxt3G2FykokhP8CVySjD/RMmBAFHfTMi4ogwEv2S6+6Jin
	+wFg==
X-Gm-Message-State: AElRT7EkFECPZFeeoB69VTeIKoJvO/xWXOVYd+onNP3q/k0sLGkDo60G
	0Hh7gG/MleGGty4P0KLW1WDxSJIklxjLdgOHTemybw==
X-Google-Smtp-Source: AG47ELsd3nFLTS6Em0xCAC8GlXK/wjdvmljkKjdndxToCE81wYVj1ml+gUtfFIFP4qKbkk7sS4abKM6CAYrBBdByegs=
X-Received: by 10.223.170.157 with SMTP id h29mr1866973wrc.107.1520979554364; 
	Tue, 13 Mar 2018 15:19:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.133.98 with HTTP; Tue, 13 Mar 2018 15:19:13 -0700 (PDT)
In-Reply-To: <c8d0dd7b9f20416c9cf54ef6e27929ef@aptaiexm02b.ap.qualcomm.com>
References: <b7d094dae2b84636912a257ba07f0e9e@aptaiexm02b.ap.qualcomm.com>
	<CAJ86T=V72v+PmGadiTJTe8PVtbQmmfYjHu+ot_aaTUBjS3bR8g@mail.gmail.com>
	<90e3ba77fe6343818693e52ebd9f7b01@aptaiexm02b.ap.qualcomm.com>
	<c8d0dd7b9f20416c9cf54ef6e27929ef@aptaiexm02b.ap.qualcomm.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 13 Mar 2018 15:19:13 -0700
Message-ID: <CAJ86T=V6Uz6EhL6GbRswaf9ZsmZ7JEgjRHowpYEN+wKvy0Sa-A@mail.gmail.com>
To: "Yong Zhang (AUTO-BI)" <zyong@qti.qualcomm.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: The license of hostapd v2.6
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
X-List-Received-Date: Tue, 13 Mar 2018 22:19:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 12, 2018 at 10:35 PM, Yong Zhang (AUTO-BI)
<zyong@qti.qualcomm.com> wrote:
>
> May I ask why the hostapd license is set to "GPLv2 | BSD"? According to the information we get, the hostapd license is "BSD". Could you provide the basis of "GPLv2" license?

Because it's a mistake. The LICENSE definition in the recipe was not
updated when the hostapd licensing was changed in 2012.

Unfortunately these kind of mistakes are not uncommon. Contributors of
version update patches often don't take the time to check carefully
for changes in the source (licensing changes, new configure options,
etc) and there are very few people who review patches sent to the list
(even worse, a negative review on the list is no guarantee that a
patch won't just get merged anyway - so over time people who may be
inclined to review patches tend to stop bothering).

So, in summary - you have found a bug! Perhaps you can submit a patch
to fix the LICENSE definition in the recipe?

----

For reference, the top level of the hostapd source tree contains a
COPYING file which states:

This software was previously distributed under BSD/GPL v2 dual license
terms that allowed either of those license alternatives to be
selected. As of February 11, 2012, the project has chosen to use only
the BSD license option for future distribution. As such, the GPL v2
license option is no longer used. It should be noted that the BSD
license option (the one with advertisement clause removed) is compatible
with GPL and as such, does not prevent use of this software in projects
that use GPL.

Some of the files may still include pointers to GPL version 2 license
terms. However, such copyright and license notifications are maintained
only for attribution purposes and any distribution of this software
after February 11, 2012 is no longer under the GPL v2 option.

