Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 54BDF60702
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 07:57:12 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id rp18so3590158iec.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 00:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=dG0zFgLvK86QhVN18Ku+kYlXgU+I3fLQDnpHzTi/foI=;
	b=OcCiY0HTFwVa8agblgjHFXkEZkPMCuuaMOvX7i9LxQ0GktH2VZhC4QoglY5bAiM7OA
	Qy+GydLmH8TrlnM5/JStdbGb1T52CUf/c8yRLuD6OIFNIerMIp09BPVZgW5oAnpSq6iR
	d4NpE7o2vIrJsdMjGlWLPhhUeNKx+3fX7rjjq9dxaRTl1qMykjpre/d5TgEYsrXlj3yz
	5Px+LN+g9UOKh66GuMu9TXax7OpHkGsHxu/YWVQzmOWK5oHvf/ognJakZUO1TaLnrH4E
	OdWehRxBplV1x7iwyzIcGVm3QmL7vzIhs82o+SrlHxiJUXcMdN9tFqkVtrllbSha4WS3
	GwdA==
MIME-Version: 1.0
X-Received: by 10.50.67.3 with SMTP id j3mr896639igt.10.1397116633586; Thu, 10
	Apr 2014 00:57:13 -0700 (PDT)
Received: by 10.64.230.100 with HTTP; Thu, 10 Apr 2014 00:57:13 -0700 (PDT)
In-Reply-To: <CAFZh4h88iMpR0qEpTDvGj9GD0cgwidjP=nb=17AX6mcOMSw4wg@mail.gmail.com>
References: <CALYKT1gcCmYKqy55T3Xv7qevR2g-EWv-y9dabjzz-D8psdYF2w@mail.gmail.com>
	<ED3E0BCACD909541BA94A34C4A164D4C5B3B0981@post.tritech.se>
	<CALYKT1i_qEM=W26LG3My9Xv8rSsou2LgUn_NgHiChMjFFheXxw@mail.gmail.com>
	<CAFZh4h88iMpR0qEpTDvGj9GD0cgwidjP=nb=17AX6mcOMSw4wg@mail.gmail.com>
Date: Thu, 10 Apr 2014 16:57:13 +0900
Message-ID: <CALYKT1j+KdORN4D4vkRbpTJxj-3mtQbgUftVrO3wBCCJ1hMgCQ@mail.gmail.com>
From: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: How can I use gdb in oe?
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
X-List-Received-Date: Thu, 10 Apr 2014 07:57:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Brian Hutchinson,

I cannot try now since I am a little busy now though, Thank you very much!

I will carefully read your message soon and try using gdb.

Now I must only say thank you!

Sincerely
Journeyer
Seoul

----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------


2014-04-10 11:25 GMT+09:00 Brian Hutchinson <b.hutchman@gmail.com>:

> Hi Journeyer,
>
> I assume you know how to add gdbserver to your root filesystem image or
> install the gdbserver package on your target.
>
> Mats instructions were spot on for connecting to the target.
>
> There are a bunch of examples/tutorials that explain attaching to process=
es
> etc. like this one:
> http://sourceware.org/gdb/onlinedocs/gdb/Server.html
>
> Regards,
>
> Brian
>
>
>
> On Wed, Apr 9, 2014 at 10:08 PM, Journeyer J. Joh
> <oosaprogrammer@gmail.com>wrote:
>
> > Hi Mats K=E4rrman,
> >
> > Thank you for kind concern!
> > I will try your method.
> > Thank you very much!
> >
> > Sincerely
> > Journeyer
> > Seoul
> >
> > ----------------------------------------
> > Journeyer J. Joh
> > o o s a p r o g r a m m e r
> > a t
> > g m a i l  d o t  c o m
> > ----------------------------------------
> >
> >
> > 2014-04-09 16:28 GMT+09:00 Mats K=E4rrman <Mats.Karrman@tritech.se>:
> >
> > > Hi,
> > >
> > > Assuming that you mean to debug programs on your target...
> > >
> > > Prerequisites:
> > > - a network connection between your target and your development host
> > (it's
> > > possible to use a tty too).
> > > - OE built SDK installed on your host.
> > > - gdbserver package installed on your target.
> > > - your binary (my-program) on target
> > > - an unstripped version of your binary in the working directory on
> host.
> > >
> > > The exact commands below will vary with the install path of your SDK
> > > (/usr/local/oecore-x86_64 in my case)
> > > and target specifics (e.g. powerpc, ppce300c3... in my case).
> > >
> > > On target:
> > > # gdbserver :2345 my-program
> > >
> > > On host:
> > > $ source /usr/local/oecore-x86_64/environment-setup-ppce300c3-oe-linu=
x
> > > $ powerpc-oe-linux-gdb my-program
> > > (gdb) set sysroot /usr/local/oecore-x86_64/sysroots/ppce300c3-oe-linu=
x
> > > (gdb) target remote <target-ip>:2345
> > > (gdb) br main
> > > (gdb) cont
> > > ...
> > >
> > > Good Luck!
> > > // Mats
> > >
> > > ________________________________________
> > > From: openembedded-devel-bounces@lists.openembedded.org [
> > > openembedded-devel-bounces@lists.openembedded.org] on behalf of
> > Journeyer
> > > J. Joh [oosaprogrammer@gmail.com]
> > > Sent: Tuesday, April 08, 2014 4:20 PM
> > > To: openembedded-devel@lists.openembedded.org
> > > Subject: [oe] How can I use gdb in oe?
> > >
> > > Hello,
> > >
> > > I use open-embedded in my company.
> > > It is used in Qualcomm's communication module - specifically on AP
> > > (Qualcomm's chipset is composed of MDM + AP).
> > >
> > > And when I compile oe linux, I use bitbake.
> > >
> > > In this environment I'd like to use gdb to debug applications for thi=
s
> oe
> > > linux.
> > >
> > > How can I use gdb in this?
> > > I have experience in using gdb in just PC environment. Not in embedde=
d
> > > env..
> > >
> > > Thank you very much in advance!
> > >
> > > Sincerely
> > > Journeyer
> > >
> > > ----------------------------------------
> > > Journeyer J. Joh
> > > o o s a p r o g r a m m e r
> > > a t
> > > g m a i l  d o t  c o m
> > > ----------------------------------------
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
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
>

