Return-Path: <raj.khem@gmail.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id A734C6D383
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Nov 2013 04:55:55 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id i13so385831qae.15
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 21:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=eUYX+CWHjg8zwn+zUSmOXdAUPyo42H1JSiFlKQNxf20=;
	b=Po6YIA23Gc5GPI1o5rGHM7YAb/tHaC44Ct84QrS+vm4jfAz7gNwnSs2DnS8M1JZoE6
	AZMLkPdCtJQuYhqg4kUMFAoHD4vRHBXps4d46dCIFxfgl7fQEtM18KXHcGs6RPauHh1L
	34QOdCyqINyS5yTWxRRiTNmcec1XglrUNfcFyGQw8NnnQFUSLORDKZZTYpH89csECC/k
	FjidfHkk87GNzZ15Qu3L+MM20VKOuRwHay/AKeISxj9o40+UziR/X41vzsvLdW4NkiXB
	ARIgKrxAT066WaMnB6BXbIqWeb4ROniYVseLxfGPJRfXTNUz1StNdBlKj/EpJlmdCxyU
	gvSQ==
MIME-Version: 1.0
X-Received: by 10.224.167.84 with SMTP id p20mr1417259qay.97.1383281757179;
	Thu, 31 Oct 2013 21:55:57 -0700 (PDT)
Received: by 10.224.10.201 with HTTP; Thu, 31 Oct 2013 21:55:57 -0700 (PDT)
In-Reply-To: <001c01ced6af$3b5db1a0$b21914e0$@com>
References: <1383205247-8487-1-git-send-email-b40527@freescale.com>
	<CAMKF1sqTBq-J_trvVcmVcCT7uuJEaXuECaczSEbjDRNQDWRz3A@mail.gmail.com>
	<001c01ced6af$3b5db1a0$b21914e0$@com>
Date: Thu, 31 Oct 2013 21:55:57 -0700
Message-ID: <CAMKF1sqaJDYE7XZLPfsM6yjjj0iZbArQjk=c4S14NTq09am9nw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Zongchun YU <b40527@freescale.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Zongchun Yu <Zongchun.Yu@freescale.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	"b44149@freescale.com" <b44149@freescale.com>
Subject: Re: [meta-oe][PATCH] tcpreplay:add recipe
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
X-List-Received-Date: Fri, 01 Nov 2013 04:55:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thursday, October 31, 2013, Zongchun YU wrote:

> >get rid of that, and why are the configure patches not ok for upstreamin=
g
> ?
>
> Hello Khem.
>
> Thanks for your comments, I am a newcomer for upstreaming. Do you mean
> that first I should send the two patches
> to upstream?



They were marked inappropriate for up streaming, that's what my question
was about

>
> Best Regards
> Zongchun
> -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Khem Raj [mailto:raj.khem@gmail.com <javascr=
ipt:;>]
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2013=E5=B9=B411=E6=9C=881=E6=97=A5 =
0:36
> =E6=94=B6=E4=BB=B6=E4=BA=BA: openembeded-devel
> =E6=8A=84=E9=80=81: Zongchun Yu; b44149@freescale.com <javascript:;>
> =E4=B8=BB=E9=A2=98: Re: [oe] [meta-oe][PATCH v2] tcpreplay:add recipe
>
> On Thu, Oct 31, 2013 at 12:40 AM,  <b40527@freescale.com <javascript:;>>
> wrote:
> > +PR =3D "r0"
>
> get rid of that, and why are the configure patches not ok for upstreaming=
 ?
>
>
>

