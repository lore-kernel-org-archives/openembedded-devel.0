Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1RvE5T-0008Gu-Oi
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 21:25:56 +0100
Received: by wibhq7 with SMTP id hq7so687024wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 12:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=aKsEtZf1QXj3gg3GCyJYdbNnPkfX/A/m1y2d0Udkzek=;
	b=BSFn29niFM+TVC70FZxGWkCsXr/dewUWmypIBRtvX/7lgffc/KhWto4adXRPfIuAMu
	hbSpBDdCN/Snbsnb6fF+Z7NqHIVep8aVoBr4krOBoOUg+PvHAKmw8bdHE+Bzdnd27djj
	u2XkB6LCQpKsPfZfwqgnAdNmoosSqpM4/Stqc=
MIME-Version: 1.0
Received: by 10.180.90.212 with SMTP id by20mr43315220wib.12.1328732272117;
	Wed, 08 Feb 2012 12:17:52 -0800 (PST)
Received: by 10.216.93.7 with HTTP; Wed, 8 Feb 2012 12:17:52 -0800 (PST)
Received: by 10.216.93.7 with HTTP; Wed, 8 Feb 2012 12:17:52 -0800 (PST)
In-Reply-To: <CAMKF1soUL2p=ymicjq6UtiGWvM2_BBMU1JLNR4H+Db+YXOOimw@mail.gmail.com>
References: <20111117223303.96550@gmx.net>
	<CAMKF1spxE8kXQwsX3WYnazpGZDDmZoafvmvxLBRBvfZxdfbgdQ@mail.gmail.com>
	<20111118200047.GD2101@mx.loc>
	<CAC1BbcTp=fd=wSW6rTs4g4RdSSGJLPtTw1wCw8fy1dy9POVu2A@mail.gmail.com>
	<CAMKF1spxWumvNh5sCG8wgectH2HvcNjoDoo6VBYzBTKqwuyQaQ@mail.gmail.com>
	<20120202143311.112290@gmx.net>
	<CAMKF1sr423aR2GnJ6LQy6pdf8nfB_M+wjae5E_xi7ZUsc-cfQw@mail.gmail.com>
	<20120202160604.78480@gmx.net>
	<CAC1BbcTnVS4oqpcbDDbxOuBCDQPcb8cQDznJk58=neVOuC695w@mail.gmail.com>
	<20120202213801.8530@gmx.net>
	<CAMKF1srQcXyjwv2e9=gtKo_T+Q4uC6YXivmROCnnFM3aS5xxWg@mail.gmail.com>
	<4F2BDE2A.3000201@st.com>
	<CAMKF1srDugybTEsusbc0XG1NM5BGVQEHxTBSw3_1aFCFunsCPw@mail.gmail.com>
	<CAC1BbcTEmnZFWrS2PKwt1nnM0h1w+UAun37D4Ep7YyYSbaJXaA@mail.gmail.com>
	<CAMKF1sr8EKC1tzDTHNEb0k4x_oN1bU6aCz_aJjDVPYEOho799Q@mail.gmail.com>
	<CAC1BbcTHi_rKU7yjBVYpRBv9V_1vdvHE-qFrs+TG4taxg85Tog@mail.gmail.com>
	<CAMKF1soUL2p=ymicjq6UtiGWvM2_BBMU1JLNR4H+Db+YXOOimw@mail.gmail.com>
Date: Wed, 8 Feb 2012 21:17:52 +0100
Message-ID: <CAC1BbcSLYNNTstF8LJoAoGd+J5+-Tba0jhTtmPpm+u+6tNrJFg@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: uclibc@uclibc.org, Peter Mazinger <ps.m@gmx.net>,
	openembedded-devel@lists.openembedded.org,
	Carmelo AMOROSO <carmelo.amoroso@st.com>
Subject: Re: future branch
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
X-List-Received-Date: Wed, 08 Feb 2012 20:25:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Feb 8, 2012 8:19 PM, "Khem Raj" <raj.khem@gmail.com> wrote:
>
> On Wed, Feb 8, 2012 at 10:42 AM, Bernhard Reutner-Fischer
> <rep.dot.nop@gmail.com> wrote:
> > Core-image-sato does not build for me due to some buggy package that
> > unconditionally uses *netgrp() or the like.
> > Not amused, way out without going beserk?
>
> Yeah with future branch here is my patch. git am it.
>
>
http://uclibc.org/~kraj/0001-uclibc-git-Update-to-latest-plus-future-branch.patch
>
> apply that on master of oe-core

Fcntl{,64} is a nightmare, yes. But your hunk does not strike me as
immediately helpful.
arm/ioperm hidden def removal is OK, I think, without having sources at
hand.
The socketcall hunk is nonsense, see my previous reply to Peter in this
thread.

+-# provided via pthreads builddir +-CSRC-y := $(filter-out $(libc_a_CSRC)
$(notdir $(libpthread_libc_OBJS:.o=.c)),$(CSRC-y)) +-SSRC := $(filter-out
$(libc_a_SSRC) $(notdir $(libpthread_libc_OBJS:.o=.S)),$(SSRC))
Huh? Sounds inappropriate to me.
Oh, filtering later on makes sense, so OK, good catch!

+-ifeq ($(IS_EABI),y) ++ifeq ($(CONFIG_ARM_EABI),y)
But _that_ is a step backwards, NACK.
>
> then set
>
> UCLIBCVERSION = "0.9.33+gitr%" in local.conf

