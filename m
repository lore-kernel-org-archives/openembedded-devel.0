Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 18DBB6B519
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 02:49:45 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id s1so997785qte.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2019 19:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LVhJQDMg2a59IofF0HTN/7T+kQKsmDUBmv54l+xz9c8=;
	b=dLTfry6wLGCJ+5k0EBH85SSMJMOSK+0JCvXftAqK9AuPsQZi+r7c2/IHE2/y/XVA5L
	RCuLoU8nBheoB+MVa/HqSkbFfPrXcU6MJM5Zh6iJOkfhlLWbCe/KOhnjWMfprkdgBmrH
	hs5GrUh79ySNh55GeMKJHI6nAc6QuhwY+QwFhULxaJB6DNMmbnN0QvxP0sKpTzy9Iilg
	u9sWfdstbEp8MTSk06NqQgTD3cJOAtz0+9bKf7Dd9QmequSO99zTUo7hshVGRpYgGuKY
	K156cwyFOG9Ac/9qKubRAB/3+p2ZMybxKKqY+M8RidUXOh+E3IJqUoT0aofY/3TLqjj7
	iBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LVhJQDMg2a59IofF0HTN/7T+kQKsmDUBmv54l+xz9c8=;
	b=nopiNBcqepxPW/vK1/C5/MVLqhzkdEkksDC4ggwfiGzi5CmShhbikEJLH/B0D9Sa2L
	dgNLXP3lVn9fbEtJ2YklTBH1o2FM+Bc7JB59O3wVWUyG+RkWj1I402hzT7pyJp0LoWRs
	OjGz3zaX0AYtzxHw7V7Lp8zuBtjiRPsPEMvhqpLlJKve926UhB8GH3gJQmjnlX+bjgGc
	MRlOeOIPLeEbCSBDnsnQMNtHOtDSEjg5rtYOQfOgi13BBjIDX1pY4yxXaJO6S8NeymUB
	13V76MvgjtgBDqR13Jnym3wEYprtTnUdONPwZdlCTxSoHmj16x4rx6+b+hphBPqjGTb7
	ygww==
X-Gm-Message-State: APjAAAWvGXQuuUY14dznNWPPye3tjEImKx+fmJcGP3g40gOTfbDSarub
	1LRt5rjOBVYMv/jtTnTh2NG25fDxB55bDJrhIGg=
X-Google-Smtp-Source: APXvYqyUKNR8IMvOjQZBZbJNk90shojW3Gd6/uEmp3IXAtxrw60q3mYzZHal/Tl0Bz6bKfIcNataJP88AliGuWrZCKo=
X-Received: by 2002:a0c:b645:: with SMTP id q5mr6075024qvf.194.1553222986764; 
	Thu, 21 Mar 2019 19:49:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1534182463.git.paul.eggleton@linux.intel.com>
	<6a15a264cf5e3cbe0df1614387cd2eb9fc421ac7.camel@gmail.com>
	<CAMKF1sprBWXWR2b13ARFOK8LYSjrkbiyx_cWDfKXUktUhZOzdQ@mail.gmail.com>
	<1698450.TmOFBMJAC0@localhost.localdomain>
In-Reply-To: <1698450.TmOFBMJAC0@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Mar 2019 19:49:35 -0700
Message-ID: <CAMKF1spf=+BYaav44poJZTbGRGK1QzwYsg+DTt=zF+Wb3dYTDg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 4/4] faad2: set LICENSE_FLAGS
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
X-List-Received-Date: Fri, 22 Mar 2019 02:49:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 21, 2019 at 4:32 PM Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> On Friday, 22 March 2019 10:29:13 AM NZDT Khem Raj wrote:
> > On Thu, Mar 21, 2019 at 2:09 PM Joshua Watt <jpewhacker@gmail.com>
> wrote:
> > >
> > > On Mon, 2018-08-13 at 19:50 +0200, Paul Eggleton wrote:
> > > > Commercial usage requires a license according to the homepage, so set
> > > > LICENSE_FLAGS = "commercial" to indicate that.
> > > >
> > > > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > > > ---
> > > >  meta-oe/recipes-multimedia/faad2/faad2_2.7.bb | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb b/meta-
> > > > oe/recipes-multimedia/faad2/faad2_2.7.bb
> > > > index b777831ad..9e5a3817a 100644
> > > > --- a/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
> > > > +++ b/meta-oe/recipes-multimedia/faad2/faad2_2.7.bb
> > > > @@ -5,6 +5,8 @@ LICENSE = "GPLv2"
> > > >
> > > >  LIC_FILES_CHKSUM =
> > > > "file://COPYING;md5=381c8cbe277a7bc1ee2ae6083a04c958"
> > > >
> > > > +LICENSE_FLAGS = "commercial"
> > > > +
> > >
> > > My understanding was that faad2 was GPLv2, but you could *optionally*
> > > get a commercial license for it if you needed one. Is the LICENSE_FLAG
> > > necessary in that case? It seems like the default license of GPLv2
> > > would apply unless you worked something out with them to get a
> > > commercial license?
> >
> > Sometimes the use determines the license enforcement. e.g. it might
> > be GPLed for personal use but not for selling products.
>
> Also, the GPL unfortunately is not the only concern if you read the full
> upstream README.  I think it's best to err on the side of caution, after
> all
> there is the ability for to set LICENSE_FLAGS_WHITELIST signifying "yes I
> have
> checked and my usage is OK".
>

I would tend to agree

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>
>
>

