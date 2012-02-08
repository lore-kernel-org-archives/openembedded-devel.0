Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1RvEc7-0000mQ-B1
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 21:59:39 +0100
Received: by wgbdr13 with SMTP id dr13so900363wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Feb 2012 12:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=PuTe09g4roO4XPN+1zQQhpjLRzZxNBoFnsD+B/p2MIk=;
	b=opjBHzFgkG+O5jaFeuRdcz/RdLCtlFo1jPA8zNVgPYs+CWFidSCIewytY25OTOKOwp
	yvL3WyXscmzuHFPqKBjvuXzQ4FoawUURMwoqE/HYBo3wxdTAQGlq0Y02NRx5y+4Lm1BE
	4SS3B0bpQZcAZpNI7oBkjTvjN/64IqdT8AmhE=
MIME-Version: 1.0
Received: by 10.181.13.113 with SMTP id ex17mr43220337wid.15.1328734295712;
	Wed, 08 Feb 2012 12:51:35 -0800 (PST)
Received: by 10.216.93.7 with HTTP; Wed, 8 Feb 2012 12:51:35 -0800 (PST)
Received: by 10.216.93.7 with HTTP; Wed, 8 Feb 2012 12:51:35 -0800 (PST)
In-Reply-To: <CAMKF1soj8DnpXcEDJg0vogUCgL9C_SF37q2oFv66W7pXQ2ZH-g@mail.gmail.com>
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
	<CAC1BbcSLYNNTstF8LJoAoGd+J5+-Tba0jhTtmPpm+u+6tNrJFg@mail.gmail.com>
	<CAMKF1soj8DnpXcEDJg0vogUCgL9C_SF37q2oFv66W7pXQ2ZH-g@mail.gmail.com>
Date: Wed, 8 Feb 2012 21:51:35 +0100
Message-ID: <CAC1BbcTpr-=hE7W1jQ-x=VSks5xUvHmJs1Up8vB+nqSor_kixA@mail.gmail.com>
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
X-List-Received-Date: Wed, 08 Feb 2012 20:59:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Feb 8, 2012 9:29 PM, "Khem Raj" <raj.khem@gmail.com> wrote:

I am redoing the full merge now, with my usual (super cautious) hat on.
Anyway, can you reproduce the ?etnetgrent() stuff with sato?

It is amazing how anybody seems to fail to get recommendations (think
configure flags) right.
How hard can it be to have a resolver that provides a set of (virtual,
inherently) packages that provide their virtual (sub-)duties on one hand,
and on the other hand (optionally) require a set of duties to be selectable
(come into play to satisfy a duty)?

