Return-Path: <net147@gmail.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0312B6B1C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2013 01:04:57 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id lf11so1853719vcb.26
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2013 18:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KcHWve+O1G/ya5pNo/Kjo1zC75qstdEQKMkA6pUuwDY=;
	b=T9pxI9gwEXfVT2FrwnpsKMcZb2HONYgA6YmNn+f97ZUHJejc7zMhlQPib2SsRZsQ5r
	Ni8krQ3UQoNRzORsLbc9kzLY/oRItJLJAtw5kWzzafc4mzL9mLjBFPWowJwEVa59IjQA
	DQMno/xWPP8Ki5KLkFwRawjb3w25A+CDLmCGJ6Kymr3gE0iBrs2RMidTNibQUXfZelzG
	z791g0qT6H8Ld6/eJTpfLyWxAbuXKIIT98SYHywC8+0kDVHbj99nblYkkkZ5PLHKECuS
	y42II2sB7bCr1zN+4PEdbCxNjSRD0lDowV6/kzsXvs15lsyl7394HAe2gXAjZB0Ak/Tl
	6SXw==
MIME-Version: 1.0
X-Received: by 10.58.214.105 with SMTP id nz9mr523039vec.58.1374109498466;
	Wed, 17 Jul 2013 18:04:58 -0700 (PDT)
Received: by 10.58.68.170 with HTTP; Wed, 17 Jul 2013 18:04:58 -0700 (PDT)
In-Reply-To: <CAP9ODKo+jxNqd8K4YqRR78YAKrX3bsibt0_npynHL-g3GO935g@mail.gmail.com>
References: <1373078818-18530-1-git-send-email-net147@gmail.com>
	<CAP9ODKo+jxNqd8K4YqRR78YAKrX3bsibt0_npynHL-g3GO935g@mail.gmail.com>
Date: Thu, 18 Jul 2013 11:04:58 +1000
Message-ID: <CANwerB0xns9fNpTFvMUSbYwkRn+PaGuv3P7hgeeAEGC5YJhxDQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] qt-creator: add new recipe for version 2.7.2
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
X-List-Received-Date: Thu, 18 Jul 2013 01:04:58 -0000
Content-Type: text/plain; charset=UTF-8

On 7 July 2013 06:10, Otavio Salvador <otavio@ossystems.com.br> wrote:
> On Fri, Jul 5, 2013 at 11:46 PM, Jonathan Liu <net147@gmail.com> wrote:
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>
> This recipe seems to be usable in target but it'd be great if Qt
> Creator could also be build as a toolchain part; did you try it?

I haven't tried that.

Regards,
Jonathan

