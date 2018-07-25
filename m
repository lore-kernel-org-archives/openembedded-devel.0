Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0D7396010D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 05:38:54 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id 26-v6so4160388qks.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 22:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=3aYGlXZBza+Xum6wQ40//2rl35lF0y7F+fTYFWYPSsU=;
	b=d5CUrnbnCVyxc2CkiGl28WJXbT4NdXo/BS7t6eeogOJYnZKXcSzsn42kZYJwec27a7
	sx1tG7V688SdLqBR1OlKS7GJISTbnD1yPu2ULQhAr/CfnortNtI8dAprqZUqaiUFobzz
	itJr1CGLYqQb6xCcoJOUoGvyyx2HQt2O5Nl7irRUDL8FkaM7+kP93DWnCkxTWsqEyAPG
	S+LcopDfbFrlwx4eLACu3RMcgk1RyLdvdTfFMxDFTVVlclORX6G85plakkKdQmNCWQB4
	7CWw9+1c9FdJ9eY3VpNL08pXnADBE1qef2QqngBeaXzGbn4ZI2kndQSd7YGdmPazrJlJ
	QLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=3aYGlXZBza+Xum6wQ40//2rl35lF0y7F+fTYFWYPSsU=;
	b=Nb/750LM70dD7be2ZCLWUvfX5C6f1te+1vSoctNIaipx5r3T2+CnbbXC5YinmZ3vlp
	hs6EWty1IsngLMGxsR8A8NWhB89JKFYA5KUBLhzGtaKEU52Eqg6OymtMzg5x7Keun47Z
	s1n1aq4/SNKF9nER2dqPV4Oqcx9hGw8Abv2Z/mRekjT4ej3rxab0CrcrGLJh7Imd1st3
	rMmYOg0yty53bCcep2IvXfVCW+lleqCu5oyviiWdqaocv17eP85OJkMZTd+cFMdJ91v1
	EFjw+KnXOPuOn1GoitcK9vEfv3Tjkhda3M2zgVwjGFi3VmuORKq7dbhM4oZIaFAGVI6J
	89KA==
X-Gm-Message-State: AOUpUlHpOBXTeDgTzWxBqJDT8x28yQwUz3uuy740PNqTSu7lnKQQdr+8
	W4fASAQywDD9byfPd0pA17hfDCI3QuMum1Kq4NY=
X-Google-Smtp-Source: AAOMgpcZMFeZ9nf57D6xSwizCSyrc//TGmT2tQULUXlMdnsfBpEH/n6pYPCyYMsBCaP3JPSazXXiwVsqLUMBnyyuRrQ=
X-Received: by 2002:ae9:c00d:: with SMTP id
	u13-v6mr17828208qkk.290.1532497135687; 
	Tue, 24 Jul 2018 22:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <a0731f9a-83e2-9ea2-a04e-191ef3793e74@skidata.com>
	<CAP9ODKqDEZ8ND4K3SEELY2mTjALCX5rzWLxjD0Vht7RFTVZ6cw@mail.gmail.com>
	<20180724152529.GA19585@mail.itconsulting-heinold.de>
	<CAP9ODKp3_1iQybyE0McSFUbd7YFPoPbD8HVy+qu05aP18zvwKw@mail.gmail.com>
	<CANx9H-BRdfmLO1vbeFocn6RSOmcd5F73hB_bYQqOMsc5o_nPSA@mail.gmail.com>
In-Reply-To: <CANx9H-BRdfmLO1vbeFocn6RSOmcd5F73hB_bYQqOMsc5o_nPSA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Jul 2018 22:38:29 -0700
Message-ID: <CAMKF1sp4c_LFSGWKvkQ_bdi3Qz3maQO5k+mo1ViYNxxKAQ_5sA@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] bug-tracker
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
X-List-Received-Date: Wed, 25 Jul 2018 05:38:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

how about gitlab ?
On Tue, Jul 24, 2018 at 9:17 PM Tim Orling <ticotimo@gmail.com> wrote:
>
> On Tue, Jul 24, 2018 at 11:05 AM Otavio Salvador <
> otavio.salvador@ossystems.com.br> wrote:
>
> > Em ter, 24 de jul de 2018 16:25, Henning Heinold <
> > henning@itconsulting-heinold.de> escreveu:
> >
> > > On Tue, Jul 24, 2018 at 08:55:34AM +0100, Otavio Salvador wrote:
> > > > Em ter, 24 de jul de 2018 08:33, Richard Leitner <
> > > > richard.leitner@skidata.com> escreveu:
> > > >
> > > > > Hi,
> > > > > finally I have another question regarding the meta-java layer :-)
> > > > >
> > > > > Do we have some kind of bug-tracker?
> > > > >
> > > > > If no: I would really love to see one for meta-java.
> > > > > What are our possibilities here? YP Bugzilla? GitHub? others?
> > > > >
> > > > > What do you think?
> > > > >
> > > >
> > > > We recently passed the review process of meta-qt5 to github and it =
has
> > > been
> > > > much better this using the patchwork.
> > > >
> > > > Maybe we could consider the possibility of moving meta-java there a=
nd
> > > make
> > > > the yp.org a mirror so we use the issues, PR and all resources it
> > offers
> > > > (Travis as well).
> > >
> > > The question is under which github space that should happen and who h=
as
> > > the control over it.
> > >
> >
> > We can make a organization as we did for qt5 or it might be under OSSys=
tems
> > umbrella.
> >
>
> I=E2=80=99d vote for new organization. Just make sure to update the layer=
 index.
>
> >
> > >
> > > Bye Henning
> > >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

