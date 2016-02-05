Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id BF737731D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Feb 2016 23:03:02 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id d63so144742770ioj.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Feb 2016 15:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=hHg2SFt6vg9dZqkIAQaHxl2VCCxtx5h+i9LZ6y0edio=;
	b=It9OnWdgunumE/9TrfUWZCiNzW+DtEEM1dd3Bk7RIBR8lKo6RJO/JFgyq6akZTB1up
	Gn27s5ZpE9F0F4MmUH1kcjQUYrIeifJjjCZkLRLL9swzP6nmRlKJM9Fvnoj1qSnec0vD
	yuHDdsL906ec0hvXpNlqGef81yiUomau6ZuOlmw6rsFoIBGjZF64Y4PFjmokYhQ7ivL0
	xLMKT5gjcR4dS8VEx/BjZMlVcDdgItsTvn/pid009N9zEA+zWgIzvrb3WYXEUSvkIukL
	P0/PxooRcZ1maNilaqYO0YcC79X8n+DTIyx5rsy+6NfkEXY/lWvMREQXqXLB3++/1xed
	obnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=hHg2SFt6vg9dZqkIAQaHxl2VCCxtx5h+i9LZ6y0edio=;
	b=FtOh9zRajG/xRIkDz3mp5ZPQgyqoiVZEhWwz974spjzXXmaGWxXj3o9LtzBkFftRkw
	XcBzi4xgSz5pf9FoyFPRStzwLJRmysjjrhlZCdOwoeqRK5HmMt/sBDVmIaVvbZl2k/ec
	nXSGa32fvc7IQZQ1NGI+g7oyhg8FpEf/pUgk/VDUH2YqqHGZsGv5/OfnoibdMwwjDizl
	X1ncK345F0MZ5UW2391P/JqK1fjZQgu+syzShJSfsN6v9wDmCY9mNoiT6K+s24ZNiV38
	qdzOXUgX8K0g704VpPmklyAthJu+4epfzqEzxPtePEKSshgU+8j07FISPrH8qbwWEaLD
	8R0g==
X-Gm-Message-State: AG10YOTTJJi9xjW+QSV+fdQEGlHb5IsCOFzufFi7ATga2OQyDZ/DFXFVoKd41AoY17AlhOielB+7HKE6zb45rw==
MIME-Version: 1.0
X-Received: by 10.107.164.15 with SMTP id n15mr15915968ioe.148.1454713383201; 
	Fri, 05 Feb 2016 15:03:03 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Fri, 5 Feb 2016 15:03:03 -0800 (PST)
In-Reply-To: <CAJTo0LYixRNEfrUbccUke=RDcoaQ2k+BcyDJ9x_crPJg3f_h3g@mail.gmail.com>
References: <1454705380-22071-1-git-send-email-ross.burton@intel.com>
	<CAMKF1srx2eRWua1d1B=VE00-8Exa+k0NGsAPmiKTN6fOgUipUg@mail.gmail.com>
	<CAJTo0LYixRNEfrUbccUke=RDcoaQ2k+BcyDJ9x_crPJg3f_h3g@mail.gmail.com>
Date: Sat, 6 Feb 2016 00:03:03 +0100
Message-ID: <CALbNGRS2JVd6x3uR6LHHo=V=Xjg25i2BTmMHCnnRMz8jbpPZfg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] gtk-theme-torturer: add
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
X-List-Received-Date: Fri, 05 Feb 2016 23:03:06 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 5, 2016 at 11:54 PM, Burton, Ross <ross.burton@intel.com> wrote:
> meta-oe maintainer, I'd reject this patch and let the recipe disappear into
> the ether.
shared same thoughts...

Andreas

