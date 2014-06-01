Return-Path: <chmorgan@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3FE7D65DCD
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Jun 2014 10:57:54 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id uq10so2340201igb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Jun 2014 03:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=iyboyAvtY043BAgefncKlpPguQvxi74jaRnC3Qq1oDQ=;
	b=wo4VeVrrECLf3+aSR7Xr0ArSUwG4cnCUt1Mmvx0vtNdHrIN7Gh0mg32+h/bsRERPHp
	UEVZebHyBcnpuuI1QS+/DvTO5ZMXiax1WYDKSFHFkZIm81LCpiMM+G6PnEFCMRxJrbAb
	WVkKiF8OpawcXzj9tD7CWpLZRMPHGgPqlBVWcSvDdJ1BvPJeAZ7pUnmwblsiqfkWJFUK
	DUFn+4BB7ymQBPv+qmYxW/Y43cakA3gjz81S8mzZbB+T4KTdw53QTFwXPIdjuFSFz4Rl
	FDUxxL2y80r4e9IqoD87wFRabR5m+/xGjLKETaaB0zs/KHjPlMqBek9r421JbDNZzhoI
	WqBg==
MIME-Version: 1.0
X-Received: by 10.50.153.11 with SMTP id vc11mr11154357igb.24.1401620275394;
	Sun, 01 Jun 2014 03:57:55 -0700 (PDT)
Received: by 10.64.228.141 with HTTP; Sun, 1 Jun 2014 03:57:55 -0700 (PDT)
Received: by 10.64.228.141 with HTTP; Sun, 1 Jun 2014 03:57:55 -0700 (PDT)
In-Reply-To: <CAMKF1sq00_iLbSEhsYbGh39VZbJQ7hdHoDN=hcQj7EYGUjTDhQ@mail.gmail.com>
References: <CAAPegz1HGg34=2kp7DUj8hOR3dmc1QtVe+hFvQPVoNhz5ptTeg@mail.gmail.com>
	<CAP9ODKppar=6rRFF0Vb+TQL3e+XZgirCfdMWXSN7cviQVBAFSg@mail.gmail.com>
	<5388EB65.5000305@mlbassoc.com>
	<CAMKF1sq00_iLbSEhsYbGh39VZbJQ7hdHoDN=hcQj7EYGUjTDhQ@mail.gmail.com>
Date: Sun, 1 Jun 2014 06:57:55 -0400
Message-ID: <CAAPegz0Bvz4xiUBfpQ_R5CTrSUMBnpbNjfqW6GAhj_3rQCpJvA@mail.gmail.com>
From: Chris Morgan <chmorgan@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 0/2] dfu-util cleanup
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
X-List-Received-Date: Sun, 01 Jun 2014 10:57:58 -0000
Content-Type: text/plain; charset=UTF-8

On May 31, 2014 10:41 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
>
> On May 30, 2014 1:34 PM, "Gary Thomas" <gary@mlbassoc.com> wrote:
> >
> > On 2014-05-30 14:29, Otavio Salvador wrote:
> >>
> >> On Fri, May 30, 2014 at 2:14 PM, Chris Morgan <chmorgan@gmail.com>
wrote:
> >>>
> >>> Add a recipe for building 0.7, remove old 0.1 recipe.
> >>
> >>
> >> I'd prefer this in a single commit.
> >>
> >
> > I think he did it this way because of the [slightly confusing]
> > version 0.4 that is still left in place.
>
> is there a reason to keep 0.4 usually its better to maintain one recipe
> >
> > --
> > ------------------------------------------------------------
> > Gary Thomas                 |  Consulting for the
> > MLB Associates              |    Embedded world
> > ------------------------------------------------------------
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

I can send a patch to remove 0.4 as well. Wanted to wait until the two
easier patches were in before stacking another one up behind them.

Chris

