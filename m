Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 515A873D9F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 17:18:07 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so67028070igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 10:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=T9BzZ8VYmm5210ikSJHi/8Zkc9QX0AMoiRZ7KqCQYFY=;
	b=iK7u4ijNY4SkwbiwskjtlgEHaKUVuBIlTyDQSF0Yqh8j3NQwRnpxTs2yXDUtDEdb5J
	kjSStQPmk0r+Ix8nN+tUkW5035RhpBsO/QeIh/V95LS9I1fhdJTSwRoTYmvIorT/L+k1
	UsJaR0TpMk/0U4C4UvIRsUOrXC/6AvtSnKyJWXRRDlK0uU/E6DGdFFQ4HEPR8huCcjRV
	2myYDAL07WnngDovZTavZVojTz9IibzQ3KeR4MVWLXq2rVwVEUlUmGFxbpE1mciNYluO
	S1NVC42EzbayvCfrqRA8z9sUW4EyP6D35ApsicJ6U3Z08uTy6RLIiZSjtM1WaoLVZWKl
	cM4Q==
MIME-Version: 1.0
X-Received: by 10.43.55.12 with SMTP id vw12mr13349380icb.30.1430155088927;
	Mon, 27 Apr 2015 10:18:08 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.197 with HTTP; Mon, 27 Apr 2015 10:18:08 -0700 (PDT)
In-Reply-To: <3EA16728-34D3-4FBF-B45B-175AA746104C@gmail.com>
References: <1430153054-1252-1-git-send-email-raj.khem@gmail.com>
	<CAP9ODKrO9G9nNyADvRpXG3hhQQDC-=B4okpsL93VLMx7M0i06g@mail.gmail.com>
	<3EA16728-34D3-4FBF-B45B-175AA746104C@gmail.com>
Date: Mon, 27 Apr 2015 14:18:08 -0300
X-Google-Sender-Auth: l2RVBQspD52o7FSjkCQmlF3S3k8
Message-ID: <CAP9ODKoa9_LoktwP+QWHg9cL8fUCa2s1Tyv_jgXNwQrcQEmRwQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: pnandyala <Pavan.Nandyala@lnttechservices.com>,
	Zoltan Kuscsik <zoltan.kuscsik@linaro.org>,
	knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>
Subject: Re: [meta-browser][PATCH 1/2 V4] cef3: Add recipe for Chromium Embedded Framework
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
X-List-Received-Date: Mon, 27 Apr 2015 17:18:09 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 27, 2015 at 2:12 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Apr 27, 2015, at 9:57 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>
>> - proper patch headers
>
> can you point to patch header guidelines for meta-browser ?

Same as OE in general[1].

1. http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

