Return-Path: <sadlife1990@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 956E86AC36
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Mar 2015 16:33:39 +0000 (UTC)
Received: by wivr20 with SMTP id r20so14526264wiv.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Mar 2015 09:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=MljK1UdQOxDRWbzjbO+QylMMsbrEbSQIpLeATUGWnj0=;
	b=s5gLs8yresPa6m7beipkr/2TAcIDC2Q+e97HuOV0HuFYe+x/CIIVOO5SoJ62Is6AgU
	qzD0R6i55lZnTndY7ePxQCiNRt11PEDewhmxlDVBs2+zHnIUZNFFoI8GQ47lPEYd/n+X
	hdblZRYi3MGlVqSFnPil/Ym98uIaEUSYGjXywzndHJuJSWjThXJUjS+qTmnpmahp05KT
	E9FnPH0ZqsKjfLKaUlIa8nkNhAaekfXhVaEPqK9cRgtCyqPnhDh33QYSmZpKzCZ5BSel
	Xc/BFeYg5IHr7s/p4Vx097WmeEkbT7tMvNHz/bRXQ4Zc/7++66MLUTbcYT0jcD5zEPiW
	okyA==
MIME-Version: 1.0
X-Received: by 10.180.14.66 with SMTP id n2mr93054372wic.50.1425832419966;
	Sun, 08 Mar 2015 09:33:39 -0700 (PDT)
Received: by 10.194.36.196 with HTTP; Sun, 8 Mar 2015 09:33:39 -0700 (PDT)
In-Reply-To: <0AFADC05-FB43-4557-9617-3F64743F4B02@gmail.com>
References: <CAAHuHfw4LNW-d7_rDKbGBwaMf-HKthMzO4f0AOY_4ZM3cy0SCw@mail.gmail.com>
	<0AFADC05-FB43-4557-9617-3F64743F4B02@gmail.com>
Date: Sun, 8 Mar 2015 18:33:39 +0200
Message-ID: <CAAHuHfxBAJYLqJb0q44M30Ni-3dLhU3tym5eapwvd0M-aSTu-A@mail.gmail.com>
From: Life Life <sadlife1990@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: ghostscript: build cups filters
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
X-List-Received-Date: Sun, 08 Mar 2015 16:33:41 -0000
Content-Type: text/plain; charset=UTF-8

Thanks

2015-03-07 19:15 GMT+02:00 Khem Raj <raj.khem@gmail.com>:

>
> > On Mar 7, 2015, at 1:59 AM, Life Life <sadlife1990@gmail.com> wrote:
> >
> > Hello,
> >
> > I found this link, to build ghostscript cups filter but it's failed. Do
> you
> > have any idea ? I see error on this line
> > +RDEPENDS_${PN}-cups = ${PN}
>
> change it to RDEPENDS_${PN}-cups = "${PN}"
>
> >
> >
> https://git.congatec.com/yocto/poky/commit/b5ad3773afa99580f11292bcc730d355cae2e39a
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

