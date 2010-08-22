Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1On5PJ-0002A4-V2
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 09:55:59 +0200
Received: by iwn2 with SMTP id 2so1948459iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 00:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=F0gFM6E9udeao5aTgjf16yU2hXPfIBLpHUi+RVdFnBM=;
	b=WVloj9J6vq46L82tIG5cR5QBSH7yIOJN7jgbwDnMkau6glQrfwWGRYhDN76/dJUDZt
	aDadLUEQTVr+NsU6egtyt7fcpRRTzGpHOym5iLXeLVLJI9tsFH1uLrN1VrK6dxNF19l6
	46nPfjXR/EpDRJrh2j6RyqUehC9Jwk+2yJu4g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=WSxTl4/IgS1HTLTpCpseZOJas6eGAdfsdc7aqXvjeNq8o2O5CGerLWV885+GJo66iC
	BurfQkDaVr5NBDAKobYyin8LWcNWwfkijzVMuo9sUPeeBMrs7ThRJRQU5vspyyxD0VeP
	v6236PC+VM+NGgVK8iWLfuzQme4d7P7BiDTwQ=
MIME-Version: 1.0
Received: by 10.231.173.3 with SMTP id n3mr4344699ibz.56.1282463736213; Sun,
	22 Aug 2010 00:55:36 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 22 Aug 2010 00:55:36 -0700 (PDT)
In-Reply-To: <AANLkTim2hsYd7ya-SZ6hRpjU2_MHRAQAeczkTnQVuRD3@mail.gmail.com>
References: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
	<i4iqg8$g6i$2@dough.gmane.org>
	<AANLkTim2hsYd7ya-SZ6hRpjU2_MHRAQAeczkTnQVuRD3@mail.gmail.com>
Date: Sun, 22 Aug 2010 09:55:36 +0200
Message-ID: <AANLkTikoa8bZuk-xbkbtbym2ST=zsy+_Ro9qGA5S7_Xp@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] added a .bb for node.js
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
X-List-Received-Date: Sun, 22 Aug 2010 07:55:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/22 AJ ONeal <coolaj86@gmail.com>:
>>

> I don't know how to add the [v2] onto a patch, but I'm going to submit again
> with what I have working.
>
There is an option with git format-patch, which I always forget.
The alternative is to edit the file format-patch gave you and change
the subeject line before doing a git send-mail

Frans


