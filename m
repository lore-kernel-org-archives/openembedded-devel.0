Return-Path: <ticotimo@gmail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 27BAB78998
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2018 04:17:04 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id x24-v6so4199164ual.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 21:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3cl+4lh4h7pvJEuIPWU85otTEWZzbKuhOM+NV9oymDk=;
	b=sFhf4UzYVkDJMARngdw+SS3A6rZdU7KBOM9QDX0SEMzSdOg9OwLGWhbr3B9RSSKqTD
	fP6ye3bQLAdcLiBrD22OPQ0yuTS7BMm5X0RxPTuDJJvUzD9viIfZQq4zntcCFoyjBAm2
	6PfPyBFAOqqMHHct7ZBZKji6oDk5LE/0H0Hl/pT2qXOR9c+H4hs0qHyc4klQI8wa4fSY
	l6oMnJHgj6YmcI+QwWxcYl80a4/+b1bmTfc7BFMHU6FIgTOZD80K7/HAOmf4r11KTVoi
	osHIocbrmCkSd9SPP85M5BuDbxVRVMCNja47LREB6m2qMGEXKE+xQf1SwZgZgrXbRXdG
	Wtrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3cl+4lh4h7pvJEuIPWU85otTEWZzbKuhOM+NV9oymDk=;
	b=V/Vli8ZeK977uVEoY1pD88CP1YfEYbX3j5FvVr9Qtbn9vfbLEqWgrryGXYMey6sT8t
	QxwPuvRq8fkwn1vvN3gsTuCoZncdnBHGMJOvAMjAKYqXCbmsMZL/SyKrMQi+yTIAYoTq
	s5SJZro0vx1ZlHfhM309p89C6zNcgLF1mV6xEVM5qAWgoKOu+mk0SyFgjvDdJfJfcCWh
	WIvmBfc7vxonLhjjHfwToJt4chna10lz3uF8BMUbf87Wz3MkWoeOGODq8UqGj2GAOwo5
	4IEjmJoUw7DP4jp5xnvPvb8u9tJ1ujMdhRnbIdyr/clVn3O8NINAqaH6Tsp/P6e2HHq2
	488w==
X-Gm-Message-State: AOUpUlEwCA9cP4HxpFviXtMaP38cchGpl0C8AVtVPCgMPezXu9rOm/wk
	E375nnQUcDJGfA/9rIzE1qzX/WokccgmHPIljTZoFw==
X-Google-Smtp-Source: AAOMgpfF8jt3qE+hBXeYZYvlgrdtmhSKTWjuFyy1w2DxodaH234wi+h+p/z+txv9Aq/ThstZkUgJSQexV4GP/G2Ua90=
X-Received: by 2002:a9f:35ec:: with SMTP id
	u41-v6mr13756242uad.86.1532492225487; 
	Tue, 24 Jul 2018 21:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <a0731f9a-83e2-9ea2-a04e-191ef3793e74@skidata.com>
	<CAP9ODKqDEZ8ND4K3SEELY2mTjALCX5rzWLxjD0Vht7RFTVZ6cw@mail.gmail.com>
	<20180724152529.GA19585@mail.itconsulting-heinold.de>
	<CAP9ODKp3_1iQybyE0McSFUbd7YFPoPbD8HVy+qu05aP18zvwKw@mail.gmail.com>
In-Reply-To: <CAP9ODKp3_1iQybyE0McSFUbd7YFPoPbD8HVy+qu05aP18zvwKw@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 24 Jul 2018 21:16:54 -0700
Message-ID: <CANx9H-BRdfmLO1vbeFocn6RSOmcd5F73hB_bYQqOMsc5o_nPSA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 25 Jul 2018 04:17:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 24, 2018 at 11:05 AM Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> Em ter, 24 de jul de 2018 16:25, Henning Heinold <
> henning@itconsulting-heinold.de> escreveu:
>
> > On Tue, Jul 24, 2018 at 08:55:34AM +0100, Otavio Salvador wrote:
> > > Em ter, 24 de jul de 2018 08:33, Richard Leitner <
> > > richard.leitner@skidata.com> escreveu:
> > >
> > > > Hi,
> > > > finally I have another question regarding the meta-java layer :-)
> > > >
> > > > Do we have some kind of bug-tracker?
> > > >
> > > > If no: I would really love to see one for meta-java.
> > > > What are our possibilities here? YP Bugzilla? GitHub? others?
> > > >
> > > > What do you think?
> > > >
> > >
> > > We recently passed the review process of meta-qt5 to github and it ha=
s
> > been
> > > much better this using the patchwork.
> > >
> > > Maybe we could consider the possibility of moving meta-java there and
> > make
> > > the yp.org a mirror so we use the issues, PR and all resources it
> offers
> > > (Travis as well).
> >
> > The question is under which github space that should happen and who has
> > the control over it.
> >
>
> We can make a organization as we did for qt5 or it might be under OSSyste=
ms
> umbrella.
>

I=E2=80=99d vote for new organization. Just make sure to update the layer i=
ndex.

>
> >
> > Bye Henning
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

