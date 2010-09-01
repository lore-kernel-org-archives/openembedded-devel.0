Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oqv1d-00089O-1u
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 23:39:24 +0200
Received: by iwn2 with SMTP id 2so6983734iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Sep 2010 14:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=rWpbP0+wxGI4Mkacqw+5uY+gnnE0DQjAnvXcG7bXP2s=;
	b=ttFesqBBTl3h4l7PTjsqsvPg/ICmFKWvPmAbQ5eG9KCb1rSnLiRXOIYfmb6kF2RDNa
	NIQE4pMuK8hqMkdL4zVEfKlT+cA50UN9f1fh+IsHLCp/Ab4ZWNf18fyd10DWPPb4KyWv
	6t9T3/NFuHbI81ttromMquLClRBQ+rzsLr290=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=yDZ5H9bRfdXwpshx+xrtsdGC93KR+EJ3ILg08KrR6v3w4FQA9GTNOlxNsjQPE7QHnU
	x85aCF8sw763bu5Z1jV3T2SRM3Whl2lL5Z7jis3gMXSVevkYjeZaIlCXpx4c7XwpCJPK
	L1O6fxTVL6e/f+bANLWZwzrzc/ICewvYw/tU8=
Received: by 10.231.33.73 with SMTP id g9mr9087916ibd.117.1283377125202; Wed,
	01 Sep 2010 14:38:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Wed, 1 Sep 2010 14:38:25 -0700 (PDT)
In-Reply-To: <AANLkTikPjmgPn3d7xSwxFt8Po2+vJ8JsnG1nQ=Zms0Sz@mail.gmail.com>
References: <AANLkTinuQnnOAh62GF+v0TzU8mRj1F+m1YGi6DdohNmr@mail.gmail.com>
	<AANLkTim=Bb_yWWuKOd=JMQ9GGL5aoxAyaO7oJnXO+zyK@mail.gmail.com>
	<i5m4sn$l1b$3@dough.gmane.org>
	<AANLkTimttxo+X6DaN8SatwXbKYJWoTJQ27D3bhW9FEq5@mail.gmail.com>
	<AANLkTikPjmgPn3d7xSwxFt8Po2+vJ8JsnG1nQ=Zms0Sz@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Sep 2010 14:38:25 -0700
Message-ID: <AANLkTi=b+gi7YZj5ZfhErXFkUfR1qrp1VUCvW2UQC3R9@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-08-30
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
X-List-Received-Date: Wed, 01 Sep 2010 21:39:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 1, 2010 at 2:23 PM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> For what it is worth.
> I've gotten permission from my company to put a few builds on our
> autobuilder provided there can be a small note on the wiki page
> acknowledging that they donated the resources for that test.

You can use your company name for tester in table just an idea unless
you are looking for flashy logos

> Guess that is ok.
>
> I still need to set things up, maybe tomorrow. I'll probably start
> with a single machine/distro, and probably it will be combo's that the
> company has interest in.
>
> Frans.
>
> PS: for building we use http://hudson-ci.org/
> Great tool (probably could also be mentioned on the page)
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


