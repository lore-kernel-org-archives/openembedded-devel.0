Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 233EB65E32
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 17:19:50 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id c1so6579096igq.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 10:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=n42tmPrijUN7GiwuP2RrX9eICs2n0gpoRY1mXlxtF7E=;
	b=iclF6Jm8lO8+P6RNFCmQ+vXC3Yiw7nrBdBbo/9Zh4yHRr1fmiwA8jP7XfyfCUxJ1jQ
	PjNZO6+ggy7FG68CJYbmFMUT7LKz7trB8wOukHr4m8ddcq4uwzL9zpBAeIMIeZc/AtZ7
	A0c/Ns0S+vGPMeWvT3ubtReFOI7GEg8v9v+qZtYzcvfk8T6pLByH8TvwlzVwVlHrCqkK
	/Rf0Ngd9xfm2xiEIPuOU8TD9dzEbydpTjuVjiLLL8VE++WyFEuGSeTfBpYurzd2XMjDa
	5Yy3Iwkp6XRiv1U1+5LbEsad9ZTt+tNlyMQNr/v5PS7byxhyY0rOJF1HIUkpp+Y4s/EO
	iSww==
X-Received: by 10.43.35.143 with SMTP id sw15mr39166078icb.29.1399396791547;
	Tue, 06 May 2014 10:19:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.74.228 with HTTP; Tue, 6 May 2014 10:19:20 -0700 (PDT)
In-Reply-To: <AAE0766F5AF36B46BAB7E0EFB92732063397EB4BC0@GBTWK10E001.Technology.local>
References: <AAE0766F5AF36B46BAB7E0EFB92732063397EB4BC0@GBTWK10E001.Technology.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 May 2014 10:19:20 -0700
Message-ID: <CAMKF1spzFEuAAHYWC29Nf4riSNT6U72J+Q59WWjrRCrtL08iWQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Fix for libxml++_ptest.patch with out-of-source build
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
X-List-Received-Date: Tue, 06 May 2014 17:19:54 -0000
Content-Type: text/plain; charset=UTF-8

Nick

On Tue, May 6, 2014 at 6:07 AM, Lewis, Nick <nick.lewis@usa.g4s.com> wrote:
> The libxml++_ptest.patch currently supplied with the libxml++ recipe does not produce a Makefile that works for out-of-source builds. Please find attached a patch that resolves this problem
>

thanks for the note. However I would encourage you to submit a patch
for meta-oe if you can guidelines are here

http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Thanks
-Khem

