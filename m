Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id E9E3D78087
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 20:17:25 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1513628246; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=TlT8DV6lEbciyXkU3uMwGxWhs+c2de1Wn7AIWUK0Quw=;
	b=h4R/REceDNUg8DzBcJGm/EWNzTCDMW1gI1EfQCFFMDRMbhttrpiYRrQ2mKGRgcqZHwoY0erh
	8uec7gk8vVMHK4mamJY03TOYVT3I+AYROqJOPTxC8zfD+RgbA2tro+eEgugLy/AJfAHOpWda
	WypNYjTr7WKMmGkVm7wtANXgy70=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Sender: derek@asterius.io
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mxa.mailgun.org with ESMTP id 5a382256.7f8506e057f0-smtp-out-n02;
	Mon, 18 Dec 2017 20:17:26 -0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id r184so12245384qke.8;
	Mon, 18 Dec 2017 12:17:26 -0800 (PST)
X-Gm-Message-State: AKGB3mK2rGsks0ztrcv+xm6SL+atDV6jAt8uEBaM4CD2z/isLozdQ2YZ
	TR5q3/2JHaTDd8lLh6wMwW6o0JEmykrVEdTfxBE=
X-Google-Smtp-Source: ACJfBosFYZ1C+jtreLxTtDGD3rl3fdDW0Vgd3jlHeh73EQBw+N1MMtiuctQRPsnJqCCOq4cn79i8516Nzot4QO7z3Hg=
X-Received: by 10.55.191.1 with SMTP id p1mr1465742qkf.152.1513628246281; Mon,
	18 Dec 2017 12:17:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.177 with HTTP; Mon, 18 Dec 2017 12:17:25 -0800 (PST)
In-Reply-To: <CAPuovE+yd0kA_MmT4GuqXgvNDASsKLszL4uiypKDSa31icwgXg@mail.gmail.com>
References: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1qnmF3-MKo=fqQQeWEedE5A-wzkUkCgdCNArOePjMaXQw@mail.gmail.com>
	<CAPuovEKdqQP35XwP3bgBrE4EFbM2LwpHrHzxF3my9qaWfAaCbA@mail.gmail.com>
	<CABcZANku-aE5a69GpJxXmd2F0+uYVhiRZB3Uut7F2RG1e3R9EA@mail.gmail.com>
	<CAPuovEJNf=qefXX6wKJGaH+HkM6aan49AgVQ3TEWVWPSCn3cNw@mail.gmail.com>
	<711527ad-77fa-947f-2186-1d7835e1783e@linux.intel.com>
	<CAPuovE+yd0kA_MmT4GuqXgvNDASsKLszL4uiypKDSa31icwgXg@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Mon, 18 Dec 2017 15:17:25 -0500
X-Gmail-Original-Message-ID: <CADNbA1psOtOeCcsLaSM4VWJV5PXqe=HmE9BuxcR4UYkJp5Erdw@mail.gmail.com>
Message-ID: <CADNbA1psOtOeCcsLaSM4VWJV5PXqe=HmE9BuxcR4UYkJp5Erdw@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python-pyroute2: uprev to v0.4.21 (from 0.3.22)
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
X-List-Received-Date: Mon, 18 Dec 2017 20:17:26 -0000
Content-Type: text/plain; charset="UTF-8"

I have several customers who have optimized for space and would like to see
the capability maintained unless core removes the ability to split python
packages out.  They also remove the *.py files in favor of *.pyo files (via
a custom packaging mechanism).  I have automated tests that go through the
module importing on each of the meta-python packages to ensure it works on
minimal python installations.  When other contributors don't do provide
that functionality, I either catch it when I do package update or when it
breaks for one of my customers.  I'm fine if you don't want to perform the
checks yourself and it breaks my use case with missing dependencies, but I
would prefer that you don't remove the dependencies that are currently in
place.  Thanks.

-Derek

On Mon, Dec 18, 2017 at 11:56 AM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> On Mon, Dec 18, 2017 at 11:37 AM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
> > On 12/18/2017 06:15 PM, Mark Asselstine wrote:
> >>
> >> On Mon, Dec 18, 2017 at 10:36 AM, Christopher Larson <kergoth@gmail.com
> >
> >> wrote:
> >>>
> >>> All our python recipes should be explicitly listing the python module
> >>> packages they require. No python module recipes should be depending on
> >>> python-modules or python3-modules, but explicitly what they require.
> >>
> >>
> >> This is a giant PITA for little gain in my opinion. The typical python
> >> 'vehicles' to define dependencies, things like setup.py, requires.txt,
> >> requirements.txt..., never bother to list stdlibs. These are standard
> >> libs that are just expected to be there. If a system is being
> >> installed with only select python modules it will behave differently
> >> than python found on any other system violating the rule of least
> >> surprise. On top of this most of these modules are ~40K in size and
> >> there are roughly 60 in the stdlib so the size gain in installing a
> >> few vs. all of them is extremely negligible. All of this seems to add
> >> way more work and churn that outweighs any real benefit.
> >
> >
> > I tend to agree with this. Add also the situation that the yocto project
> > needs to upgrade oe-core to python 3.6 as soon as possible, and to 3.7
> soon
> > after, no one has enough time to do this rather non-trivial job, and I'm
> > beginning to wonder if the best way out is to remove the module splitting
> > altogether, and write a clean, simple and maintainable python3 recipe
> from
> > scratch with minimal amount of custom patching and hopefully no
> write-only
> > hacks.
> >
> > Alex
>
> Thanks Alex for the support. To get a better idea as to what the size
> delta is I took the installed sizes from a rootfs logfile and the
> total size for all modules (python2.7) is 6.5M python-misc is almost
> 2M of this and python-codecs contributing over 0.5M. The savings will
> never be the full 6.5M as there will always be python-lang and some
> other modules needed. There was a time where 32M restrictions existed
> are some systems but are we really seeing devices with these
> restrictions any more? what about exploring not shipping the pyc
> files? I would much rather see this than imposing so much work and
> churn for very little gain. Anyways, maybe this isn't the best forum
> for this and it should be brought up to the architecture group.
>
> Mark
>
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
>

