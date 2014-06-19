Return-Path: <ka6sox@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mail.openembedded.org (Postfix) with ESMTP id 226296FDF3;
	Thu, 19 Jun 2014 17:08:57 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id i7so5735174oag.22
	for <multiple recipients>; Thu, 19 Jun 2014 10:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YNhkPvn3fUQ6j786sw8CtJAFC9LMNrflBtN9xyd2SDA=;
	b=IANULKoO8YECwOF7J+kiJBr9jVeZUhoJBJPNxvpQFIkiNxlfSEBAmZbdo/ImUbJxPA
	HsLFJwDTzHhpMhcM67qH4nPv9pZ/BHeLVO2n2k/KjGwIum3+j3XWnvbk0HSPKI+E56DP
	WxfmlPT0C3EwROUlqQvfewm4B3n/6v+pBqHEWDxVQptFEc7HiPk1U8Yb5xFVH3qOvjEO
	bi1kU6LiPLqmHYDNZ5mH1xLbziyZVaQvs9+HFFlr2QZQURkNXMMz8KGCo78aiOHBfyc3
	YfgYSpY+90hz94dLduqfK/gviPZ6aZLW3se7nOIVIywUdpKflFcP/56oCxs1RT4m9oLY
	gsIg==
MIME-Version: 1.0
X-Received: by 10.182.243.163 with SMTP id wz3mr5705568obc.3.1403197738197;
	Thu, 19 Jun 2014 10:08:58 -0700 (PDT)
Received: by 10.76.128.201 with HTTP; Thu, 19 Jun 2014 10:08:58 -0700 (PDT)
In-Reply-To: <1428623.s0yLnq7SlO@peggleto-mobl5.ger.corp.intel.com>
References: <20140619113451.GO2117@jama>
	<CAHQecY7HffEF4TJ5Bmbmq0kSgm_p6Ei2JD=s7Jy924fTs0PKbQ@mail.gmail.com>
	<1428623.s0yLnq7SlO@peggleto-mobl5.ger.corp.intel.com>
Date: Thu, 19 Jun 2014 10:08:58 -0700
Message-ID: <CAHQecY4zy==MBoaH9GP800Xj1xg4ZYmWHbu3aemW-afv2X0uDw@mail.gmail.com>
From: Tom King <ka6sox@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Few archives to add on sources.oe.org
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
X-List-Received-Date: Thu, 19 Jun 2014 17:09:02 -0000
Content-Type: text/plain; charset=UTF-8

Yes,

its in there too.

Tom


On Thu, Jun 19, 2014 at 9:59 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> Hi Tom,
>
> Did cherokee also get added as requested earlier? (Sorry for the noise if
> it
> did, I just didn't see a reply.)
>
> Cheers,
> Paul
>
> On Thursday 19 June 2014 09:09:33 Tom King wrote:
> > Done
> >
> >
> > On Thu, Jun 19, 2014 at 4:34 AM, Martin Jansa <martin.jansa@gmail.com>
> >
> > wrote:
> > > Hi Tom,
> > >
> > > can you please add:
> > > IO-Tty-1.10.tar.gz
> > > SQLAlchemy-0.7.9.tar.gz
> > > fetchmail-6.3.26.tar.xz
> > > usb-modeswitch-2.0.1.tar.bz2
> > > usb-modeswitch-data-20130807.tar.bz2
> > >
> > > to sources.oe.org? I can send you tarballs (or fetch them from
> > > /home/jenkins/oe/shr-core-branches/downloads-missing/ on aruba)
> > >
> > > The most annoying is fetchmail which is now fetching HTML page from
> > > berlios (so checksum check fails instead of showing 404) :/. And user
> > > needs to download it manually or use sources.oe.org as PREMIRROR, but
> > > still better than nothing.
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

