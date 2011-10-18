Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RG1rp-0001nN-Hn
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 07:05:34 +0200
Received: by pzk33 with SMTP id 33so603478pzk.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 21:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=yzzhrPhUfqOjxy3hn1oNYvnzJm/ZXi97xYVx6dtndks=;
	b=yHAbEje++aVmJss3l4nbugK3yeQaq2HgYRwAAtp7J2I3Z78WBG9bYJBw6Uh6xL8bwv
	1KU1ZWsGtIO3BPhnYY23X5ehObGovLxAQ8hJSXq9WL3S7O45Q1GpH0Uj0g8quBtn4Xih
	Y64U25d2Am4Cr/4Esy1TK42Dw0K3vdmmHhOvQ=
MIME-Version: 1.0
Received: by 10.68.23.6 with SMTP id i6mr2386143pbf.13.1318913982934; Mon, 17
	Oct 2011 21:59:42 -0700 (PDT)
Received: by 10.68.48.230 with HTTP; Mon, 17 Oct 2011 21:59:42 -0700 (PDT)
In-Reply-To: <CAG4_upS8pTwVFda=HcYWZ5VcXjo838s85ep2H+=fo9NrMV9hqQ@mail.gmail.com>
References: <CAG4_upS8pTwVFda=HcYWZ5VcXjo838s85ep2H+=fo9NrMV9hqQ@mail.gmail.com>
Date: Mon, 17 Oct 2011 21:59:42 -0700
Message-ID: <CAMKF1srG+ExyMmC-7x3shdKdZaKQSX4vbBMDqM=PG1p=Ea2kXw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: tzdata moved to ICANN, URLs to update?
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
X-List-Received-Date: Tue, 18 Oct 2011 05:05:34 -0000
Content-Type: text/plain; charset=UTF-8

On Monday, October 17, 2011, Chris Verges <kg4ysn@gmail.com> wrote:
> Hi all,
>
> I just saw the posting that the tz database has been moved to ICANN
> after the law suit issue occurred.  Do we need to update any recipes
> or has this been handled already?

I think we might need the src_uri updated
>
> http://www.iana.org/time-zones
>
> Thanks,
> Chris
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

