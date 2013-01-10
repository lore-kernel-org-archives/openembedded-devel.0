Received: from mail-vc0-f178.google.com ([209.85.220.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fahad.usman@gmail.com>) id 1TtPaq-0002fC-D0
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 22:23:22 +0100
Received: by mail-vc0-f178.google.com with SMTP id l6so800720vcl.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 13:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=b8jbUxrCR0aLjidaVqJiUyN3oHuu3K7Zb4jbucIP0es=;
	b=ap1Urc716vP9awCtRApiQdNwYPNXkNCCaeY5cmZ/5K7LrUysvN6h76h2Gi1k8bxwk3
	F0z6mxpCtS/NnjlInpLDiL9LsXkfsIvUeZnk+S3YjMKFS8XVvdGPXULiW3LVcbpfK6lB
	G0aYMH8oU5cFmPxgxTPHMWgIqmBsq40Pd1HRS3MRka9HIlZEui/GFJMceddBr2GjjPZP
	D/aTP4ByR5YGhKNTm8isqyAhgObxBG92Q6nK2/g2SC8ysutg7L0dNV5R+zGppuQc24Tm
	zlSANXHCIJfT7RrZLNkS8F5JwuAdcmvU1I1EX8YhT6FSP2S2zjQKAOkep2/5buPzsvgf
	Oz6Q==
MIME-Version: 1.0
Received: by 10.220.108.2 with SMTP id d2mr90971391vcp.60.1357852086254; Thu,
	10 Jan 2013 13:08:06 -0800 (PST)
Received: by 10.52.155.176 with HTTP; Thu, 10 Jan 2013 13:08:06 -0800 (PST)
Received: by 10.52.155.176 with HTTP; Thu, 10 Jan 2013 13:08:06 -0800 (PST)
In-Reply-To: <CAHVMiV9PbAUbY7=Xeh=RZD0oWVOq6MR8=NwJAtjNoLpUh+QMRg@mail.gmail.com>
References: <1357834959-9937-1-git-send-email-fahad_usman@mentor.com>
	<1357834959-9937-2-git-send-email-fahad_usman@mentor.com>
	<20130110173023.7cafe23b@e6520eb>
	<CAHVMiV9PbAUbY7=Xeh=RZD0oWVOq6MR8=NwJAtjNoLpUh+QMRg@mail.gmail.com>
Date: Fri, 11 Jan 2013 02:08:06 +0500
Message-ID: <CAHVMiV9qfdmia4hHwUf_Sj__vytqXg9Bs2CCZXaC6suOir_u6A@mail.gmail.com>
From: Fahad Usman <fahad.usman@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-browser][PATCH 2/2] chromium: fix dependencies
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jan 2013 21:23:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

And I used sourcery codebench professional 2012.09 as an external toolchain
On Jan 11, 2013 2:03 AM, "Fahad Usman" <fahad_usman@mentor.com> wrote:

> Hi Eric
> I have tested these patches with freescale imx6 sabrelite target.
>
> Fahad
>
> On Jan 10, 2013 9:31 PM, "Eric B=E9nard" <eric@eukrea.com> wrote:
> >
> > Hi Fahad,
> >
> > Le Thu, 10 Jan 2013 21:22:39 +0500,
> > Fahad Usman <fahad_usman@mentor.com> a =E9crit :
> >
> > > * fix dependencies to build chromium package successfully with curren=
t
> state
> > >   of OE
> > >
> > OK so we need to create a danny branch and apply this one only on
> > master.
> >
> > May you please tell for which targets you tested chromium with these
> > patches ?
> >
> > Thanks
> > Eric
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

