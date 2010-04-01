Received: from mail-qy0-f189.google.com ([209.85.221.189])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NxQfJ-0004fn-1I
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 22:06:57 +0200
Received: by qyk27 with SMTP id 27so1682163qyk.23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Apr 2010 13:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:received:message-id
	:subject:to:content-type;
	bh=JlKb9OS9Kp0s2OJdzTtA0inRh8iVNbI0lab1oNcmgdw=;
	b=LWdqDL6bpcVufE1mO0NsL7k1YZDcghlZQSTUf5kVsTcZpLHWjYimmHHjeMYUaguOZH
	3io9hxmoLjXFyfmUJEEwhj4k42kkNWthys1xROsmZOcXt62L/zutxwRfRX0FCKMaDrbD
	BOntas/85v0r7i6b0kEpE5qZpY761878trq8k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=iaAGQCCNYHhohnPKzfh+baij9tVYGrtAfMFqiODxKnbvgAPUf9z6yyTNGowHpcmRYc
	G6ZR87+zadyZKRUBU8nCjy8baoG1qmPYsUEYsiEkGoDcq2nlLYTcxJVWBBH70KkzYNya
	qe6J9+zd7tbcdrV9GJ4t+frG14cv5AD4Vshh0=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.232.131 with HTTP; Thu, 1 Apr 2010 13:03:13 -0700 (PDT)
In-Reply-To: <hp2mls$3go$1@dough.gmane.org>
References: <1270135981.4993.128.camel@rex> <hp2mls$3go$1@dough.gmane.org>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 1 Apr 2010 13:03:13 -0700
X-Google-Sender-Auth: e9efb4e2a88b0c68
Received: by 10.229.184.130 with SMTP id ck2mr1816327qcb.95.1270152213414; 
	Thu, 01 Apr 2010 13:03:33 -0700 (PDT)
Message-ID: <y2wb6ebd0a51004011303p88039e2bj34a31dd88b2e0ac3@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.189
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Request for branch merge
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
X-List-Received-Date: Thu, 01 Apr 2010 20:06:57 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 1, 2010 at 10:55 AM, Koen Kooi <k.kooi@student.utwente.nl>wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 01-04-10 17:33, Richard Purdie wrote:
>
> > I could post the patches individually and get Acked lines for each one
> > but I'm hoping to avoid that and get permission to merge the branch
> > directly. We have talked about most of these things in one form or
> > another.
>
> I don't think this will get serious review people other than Tom, Khem
> and Chris, so if they don't have huge objections, merge it and we'll
> deal with the fallout together if needed.


I agree with Koen on this, it's a definite improvement. Let's get it merged
and deal with any fallout from there.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

