Return-Path: <cmayer1@binghamton.edu>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id E952A6A880
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2013 13:27:49 +0000 (UTC)
Received: by mail-ob0-f171.google.com with SMTP id dn14so10042766obc.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2013 06:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=62azqhOrQlZkm8xUCvISs5XC8MNCFjhysFwowy3WRPg=;
	b=l/3g1cul5EQ8aOqj3VePgmXk4kh1mAztf6vpN0DqmaRU+zjSzMnrgNBoX1TisW1Zf7
	r68414Ktg3dGMpJduRksSwYLezBPXMUxIBUYZsiP1z/622UyuNPPmIYPWT0FmFi3u7Xf
	sx7FdL+vu+sCscNDizPnCH84kjiS+EFMQu0UlL6+8oB+rBA4/gTbry88BDegH34Q8OmD
	qyLlU5Qtqot3p/2TBiR4vt381B2INiGBb68CagjzDBTc+Hi4eGfAAXOHZ5HD57zEcOgJ
	0d6eSlZdRRlEjOImrYPTvKWTnuD+Nbmksof5cGiH5EnMVfIarHD5idtqn+n5OBvqvLgT
	Pw4w==
MIME-Version: 1.0
X-Received: by 10.60.55.65 with SMTP id q1mr31567157oep.92.1373549270559; Thu,
	11 Jul 2013 06:27:50 -0700 (PDT)
Received: by 10.76.19.18 with HTTP; Thu, 11 Jul 2013 06:27:50 -0700 (PDT)
In-Reply-To: <8377881.Svh8SavfTG@helios>
References: <CAOys6npcxfg0e_udHbXtt-V57eJaXRtgU+j3WA0Gp+xOHGS5mQ@mail.gmail.com>
	<8377881.Svh8SavfTG@helios>
Date: Thu, 11 Jul 2013 09:27:50 -0400
Message-ID: <CAOys6novr85_Nr_r8o6AxwiijTZ3ks2vU-jSUTGwv5pDWUK90w@mail.gmail.com>
From: Christopher W Mayer <cmayer1@binghamton.edu>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQkILAJhATbNlKVmF8LOfO0INLCyiZxSHhzzNCkIja+Aex23rH/XlG0tK9X85AcqPpynPM7q
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Using Xen from Meta-Virtualization
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
X-List-Received-Date: Thu, 11 Jul 2013 13:27:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

Paul,
   I will do just that, thank you.

Regards,
   Chris


On Thu, Jul 11, 2013 at 9:24 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> Hi Christopher,
>
> On Tuesday 09 July 2013 12:23:35 Christopher W Mayer wrote:
> > Hi Everyone,
> >     I am trying to use the Meta-Virtualization layer to build Xen dom0
> > support into an Open Embedded build. I've built the xen-image-minimal
> > target but when I try to boot it as dom0, I get this error
> >
> >
> > *'elf_xen_note_check: ERROR: Will only load images built for the
> > generic loader or Linux images')*
> >
> > I used this
> > link<
> http://xen.1045712.n5.nabble.com/Panic-on-CPU0-Unable-to-boot-with-Xen
> >
> -4-1-on-Fedora-16-manual-grub2-config-after-compiling-Xen-from-e-td5571653.h
> > tml>,followed Ian Campbell's instructions (the third post down) and found
> > that
> > the kernel being built is not Xen capable. Am I missing something simple
> > here? Is this a problem with the layer or am I using it wrong? Any help
> is
> > appreciated.
>
> You may be better off asking this question on the meta-virtualization
> mailing
> list:
>
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

