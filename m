Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id DC5CD77CB5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 May 2017 14:02:53 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id m123so16892988wma.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 May 2017 07:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iFlmDFU0zoT4vXZrcs2fMUmWbIAue6hBIR4j4xZg3to=;
	b=QXg7C8hHMYDDXJmaAod1NvY5CPNbkS3XA6pOg9Ai6wpBjSsgCjw6+MPzIrnb8cuuqJ
	PUyRva94k3PPm8DbDaLV9GW7V04rUEEp6wDUwvl9ok25qOGS4ec0l2UP/p4x0cFuAGyI
	R9ssz8/k4Dl09vzVCI+MUNDUNiVNkq00FrR4xTcaRTetjEaO0gs1zZlGl8PFEpzSECEN
	UI/8LZLywTf/HS/4aUyxoBSwrK0bxHgcipVk9k9wA8p/Wr9Dh+nHeUMi4MERSgla8bXZ
	v12az6pZnLfeyEpgAwpHAeV/04rjQb1gqvCp5QBs8l87kWyW4sXmDe8ipaFvd43RGnCv
	2F9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iFlmDFU0zoT4vXZrcs2fMUmWbIAue6hBIR4j4xZg3to=;
	b=f3FjG0Mmkhetj70LgycJTYQEzUT0oHV8eGpVNjoqVymrEiy063Ju/B3xCF8xdTZXDU
	6RM4oaLFZazWOKlRjokiPEAJAE3BuRwu251epStNawEN/bYJUANLpp09SM29EZuFa0H/
	tOBEQBcSPhrREj2SNz37TANxHMnwBhwysSQh9JkqXhJ9GqDiMpaecvl+8Sd7iiEsUwnk
	TbETGlRwGoIgPYbD2CPkUBfhx7yxNS1ACRf5ceWocCnO0QGk+HVtWnWpm8BPwMkiijsh
	IsnmJrtyeHg0HEj4V+aTrct9U2eXapAT3AaKsc9V7VVJD3mfG7+D7P/fBSwC0/2UhAA/
	4eBg==
X-Gm-Message-State: AN3rC/77ZbynSrYYTWYPXLrclN535kp8SJc4cfIVDcVmf2RIlMITRG52
	IQ4poJn/qNgDmakhR3XY+jzf2G040A==
X-Received: by 10.80.149.209 with SMTP id x17mr29327108eda.175.1493906574555; 
	Thu, 04 May 2017 07:02:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.213.154 with HTTP; Thu, 4 May 2017 07:02:54 -0700 (PDT)
In-Reply-To: <a05fd59e-cbf1-291c-c2fa-63d3ba5b1d6e@gmail.com>
References: <20170426184422.GG3258@jama>
	<a05fd59e-cbf1-291c-c2fa-63d3ba5b1d6e@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 4 May 2017 16:02:54 +0200
Message-ID: <CA+chaQfO+UJ9rm5u20hi9+68qafdnwhJ9Q0WXMnZC7XfLUbNMA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: pyro branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Thu, 04 May 2017 14:02:54 -0000
Content-Type: text/plain; charset=UTF-8

As always, thanks armin!

If there are more people willing to step-up and maintain some layers or
whole meta-oe for master branch, then I would be happy to share it.

Any kind of help counts: reviewing changes on ML, sending consolidated
pull-requests for layers or recipes you care about or just generally
helping to fix the issues detected and reported in world builds.

Cheers,

On Wed, Apr 26, 2017 at 10:24 PM, akuster808 <akuster808@gmail.com> wrote:

> On 4/26/17 11:44 AM, Martin Jansa wrote:
> > Hello,
> >
> > as every 6 months I'm looking for some volunteer(s) to step-up and
> > maintain "pyro" release branch.
> put me down. I will be sending patches shortly.
> -armin
> >
> > You can sign-up by replying to this thread and then one of you need to
> > send README update like this:
> > https://github.com/openembedded/meta-openembedded/commit/
> 3082e30da58df0711182cf114c71a8c6a093aeae
> >
> > More details in thread searching for daisy maintainer:
> > http://lists.openembedded.org/pipermail/openembedded-devel/
> 2014-April/095601.html
> > http://lists.openembedded.org/pipermail/openembedded-devel/
> 2014-May/095694.html
> > or dizzy maintainer:
> > http://lists.openembedded.org/pipermail/openembedded-devel/
> 2014-October/098441.html
> > or fido maintainer:
> > http://lists.openembedded.org/pipermail/openembedded-devel/
> 2015-March/100901.html
> > or jethro maintainer:
> > http://lists.openembedded.org/pipermail/openembedded-devel/
> 2015-October/103810.html
> > or krogoth maintainer:
> > http://lists.openembedded.org/pipermail/openembedded-devel/
> 2016-April/106952.html
> > or morty maintainer:
> > http://lists.openembedded.org/pipermail/openembedded-devel/
> 2016-October/109452.html
> >
> > Regards,
> >
> >
>
>

