Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Oh90o-0006Rt-G1
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 00:34:24 +0200
Received: by iwn38 with SMTP id 38so558168iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 15:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=j2+umhtSk5ohkqI+gSa6nzw9ycY7a6qZCq5+JytvURo=;
	b=OUEzfdE0HziV/JH2gapUSQ+sTTdc0PF+TJsR/rAIWSenNBYFOq7gL3uEDPs5kg5oKn
	fqYRZjuJwgoRbGIh2RTa7gWaWsBcaRKRsHjRwVRO0Xd4hutwv+XhmB9ovBhn0edd08NN
	p/Z8r0FhPk8TH2WqdzDJxPL3SeId/eGjwtt6E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=V8+adHvBv9ciuuaw0pCl41ZrgCdNkwPDm0M1eUqX3onflpQKSTZiWbHAU+Pexd7h13
	ff7FNl30Syk5nHb5WAc3Sj9KzzpNzMcz27XxuueVRymueFq3uCjX37gJDv0PPQBQHh45
	gDz9Kn99rgC9dzGs7NFG1dY6kp2Gw7/Aa3y9o=
MIME-Version: 1.0
Received: by 10.231.80.213 with SMTP id u21mr12159709ibk.173.1281047632573; 
	Thu, 05 Aug 2010 15:33:52 -0700 (PDT)
Received: by 10.231.145.77 with HTTP; Thu, 5 Aug 2010 15:33:52 -0700 (PDT)
In-Reply-To: <i3f3gm$5lu$1@dough.gmane.org>
References: <i3f3gm$5lu$1@dough.gmane.org>
Date: Fri, 6 Aug 2010 08:03:52 +0930
Message-ID: <AANLkTim=VSMEHmSaQJJzg1pQbs=VrMhgQx7akNFe-0KK@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patchwork, please keep patches up to date
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
X-List-Received-Date: Thu, 05 Aug 2010 22:34:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 6 August 2010 05:00, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> I had a look around patchwork and I noticed lots of duplicates and
> already applied patches are still in the queue, so I have a small request:
>
> Could the people sending patches to this mailinglist update their status
> in patchwork? And can people applying patches also update the status?

Ok, I created an account and logged in. There is a checkbox next to
each line. Now what?

Is there supposed to be some way to link your account with the
accountability for certain patches, thereby giving one the ability to
delete them? I assume this is an admin/moderator task.

Do I only get accountability for a patch if it is sent to the list
after an account is created for the same email address? Let me test
that with a bogus patch...


--- a/recipes/foo/bar.bb
+++ b/recipes/foo/bar.bb
@@ -10,7 +10,7 @@ frobnobble
 here is some context
 here is some more

-i am a baaaad line
+i am a less baad line
 more context
 yet more context


