Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OrIo8-00074a-Ij
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 01:03:12 +0200
Received: by iwn2 with SMTP id 2so917070iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 16:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=cIsGQt2nLjCMuKM/bSNA29S+f+0t858Ob+4yCRdHfFg=;
	b=TfQDe3JvX1H+aGPdmdt+Dh+zvLHnuKZT2Px8AIlXJvfZg/NRsCO5siIESxHlqFzQrz
	ROU1KXjiIUWBEgHAQHC6i8VHM52naSmcIjK6uXmB05MSUN+sF6LBAml+On4XlkBDXj4w
	bapWMEMfuVRXA8eLGZVexA56z8JYjS3rCIwMc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=t6xJ/5E/XS245yv2a+4bjZr6Dvwcm+uHJCOIHxvoe2l+T+MTzAipBAqPWDifL9kWp7
	jDZeIGd092G6mqi9TYfv0b8PW2VNrG2IYoEJdrlemWWoYdUWXiRSSxqclQM+jIkf+Rxc
	jetKFl2UtLoJ1oFjwWrcZPhbi9eL6iEILrl6U=
MIME-Version: 1.0
Received: by 10.231.11.69 with SMTP id s5mr10972002ibs.38.1283457728892; Thu,
	02 Sep 2010 13:02:08 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Thu, 2 Sep 2010 13:02:08 -0700 (PDT)
In-Reply-To: <AANLkTinU39HjKWb9=VMiSa=R2YA_9BxPDctiW1ire48C@mail.gmail.com>
References: <AANLkTinU39HjKWb9=VMiSa=R2YA_9BxPDctiW1ire48C@mail.gmail.com>
Date: Thu, 2 Sep 2010 22:02:08 +0200
Message-ID: <AANLkTikk1sce-dOHW_uVOO3m+XPx1ZjapvcNAAHiXwnS@mail.gmail.com>
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
Subject: Re: Perl modules I can not get to build, libdbd-sqlite-perl libversion-perl
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
X-List-Received-Date: Thu, 02 Sep 2010 23:03:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/2 J. L. <vwyodapink@gmail.com>:
> I have cleaned and rebuilt these a few times now while trying to do
> what its saying or assuming it should be saying in the errors, the
> commands i have run are bitbake -c package then I run bitbake package
> again after I try a fix. Build machine is ubuntu9.10, and I am on the
> overo branch. I know I really need to learn to grasp the recipes and
> patching more but I am slowly working on that while working through
> the errors as it sticks better for me this way. I broke up each
> failing recipe down so easier to see info for each package.

You might want to check if the recipe is the same as the OE one.
Typically the people on this list are working on the main branch of
the openembedded repository.
If you are reporting a problem on another repo or branch chances are
small that people can help you.

Also I see you are reporting quite some problems, but your posts also
seem to indicate that you make some progress.
If an item you reported on is resolved it is nice to report back (so
if someone looks into it, he knows that it is not needed any more)
And if there is a fix, a patch is always appreciated :-)

But the most important thing is;
Have fun!
Frans


