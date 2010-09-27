Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P0745-0006lb-6C
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 08:19:54 +0200
Received: by iwn2 with SMTP id 2so2686997iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Sep 2010 23:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=0CZUKDYTSczjpE3P+8w09KHj26rxqZHWwLn02/ELZYc=;
	b=i+aW5PZpCVBOZ6mmM5SEc9eZvHP+k6P+PjDL6Bgwntqf3jYztNc2RjbYckuxrDbzGX
	rfk6PC7o2OPjobhv44HZsXdTcMkH8x0KqTRRZ/bid7GCbFLMXEm7d5UVo/s7VafZrb0h
	rPBkyyUYaWLGQF6C8EvhqJIxep7ySuhopcvGg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=smb+t53X5hZWg5zvZsXPFksU6TLno2h9wcJPOC+nez1vNSvDmX7NrrYVghlnXwTEfb
	QXp0sm7xqEkaBTLhKH9q/u8idjBuOHuXvcIf60h5BxD0TRGNRm7VE4ibXRNKGmQN1R2e
	ixMpYZCm7PmEFt2YGhv76cB6Eq9bdwJooku7w=
MIME-Version: 1.0
Received: by 10.231.10.200 with SMTP id q8mr8608616ibq.83.1285568384115; Sun,
	26 Sep 2010 23:19:44 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 26 Sep 2010 23:19:44 -0700 (PDT)
In-Reply-To: <20100926112659.GB6483@jama>
References: <AANLkTi=Wt1eRcSoXzjwMJizLBgQ-+hV=Xj1UWW155MWQ@mail.gmail.com>
	<20100926112659.GB6483@jama>
Date: Mon, 27 Sep 2010 08:19:44 +0200
Message-ID: <AANLkTimQJUyZRsX6a5EA4FruiM5DVVbVD8e676Ri+ARe@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: some more non fetching recipes
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
X-List-Received-Date: Mon, 27 Sep 2010 06:19:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/26 Martin Jansa <martin.jansa@gmail.com>:

> There was about ~1000 recipes failing to fetch few months ago, I don't
> think this number is that much lower as I haven't seen any changes in
> most of them.
>
> See my download status:
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-April/019206.html
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-April/019234.html

April is 5 months ago. Question is if it makes sense to keep recipes
that are broken for > 5 months and no one who saw a need to fix them
or complained about them.
Personally I'm inclined to say it is a waste to spend any time on
these. I would suggest moving them to e.g. nonworking but I guess the
people who mix up quality and quantity will disagree on this.

Frans.


