Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1ONDpK-0005U7-LT
	for openembedded-devel@lists.openembedded.org;
	Sat, 12 Jun 2010 01:39:56 +0200
Received: by gyg10 with SMTP id 10so1294290gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jun 2010 16:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=wEreIqcL37nEUg3iS0FPKZxVvj1kVXgEy/j4tERgNFA=;
	b=LP2+COhndxhtVYZgoggD1NRBz0oXrd1PU2avCuLwUjzhKD2+ramsIDGeEOXCVBay/V
	KYwhZegHU9D0VgDDl3QetFg3cMYS5ssTojkxAdn4OBzluHms0nGsZwjLM8QWJvQKRCWW
	AuCAX98H8iL8zSBHwJrH1sltUpFfq/uBFro24=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=BhvivMBVAQOadm+oHr24XsxRSEF3AatkU6k4IfY/GlSF9e/8nOQ6dxmT495OohEt6j
	s+B3U8+S36seIVDjiAqd8Hn8vhKrEiMW1/iLbaAGFfBaaRag5IIYaC/HPiGcAe5UTIO/
	oA0jqLYMcft7ZR2RPujQPJV8U38bi7g9dLvsU=
MIME-Version: 1.0
Received: by 10.100.246.23 with SMTP id t23mr2365040anh.167.1276299325023; 
	Fri, 11 Jun 2010 16:35:25 -0700 (PDT)
Received: by 10.100.194.6 with HTTP; Fri, 11 Jun 2010 16:35:24 -0700 (PDT)
In-Reply-To: <huu42u$upj$1@dough.gmane.org>
References: <hutusi$dno$1@dough.gmane.org> <4C1281F6.4030505@mentor.com>
	<huu42u$upj$1@dough.gmane.org>
Date: Sat, 12 Jun 2010 01:35:24 +0200
Message-ID: <AANLkTikpMfT2M_B8jKeNOMeEg5-TdSLIk5OClVL7LiZY@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: please stop breaking psplash-zap!
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
X-List-Received-Date: Fri, 11 Jun 2010 23:39:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

>>> This week 2 patches have been pushed that break psplash-zap for its main
>>> user and creator, namely angstrom.

as it was, minimal distro (not Angstrom) got:

ERROR: Multiple .bb files are due to be built which each provide
virtual/psplash (/oe/openembedded/recipes/psplash/psplash_svn.bb
/oe/openembedded/recipes/psplash/psplash-angstrom_svn.bb).

So was building psplash-angstrom. Why that?

See other post.

Sorry again for the noise.
Andrea


