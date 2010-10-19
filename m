Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P85aB-0005s6-Fc
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Oct 2010 08:22:00 +0200
Received: by iwn2 with SMTP id 2so2133725iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 23:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=Njkp5IucSO7K7y88Z8BOnwzL8LNpx9LGMhaHN5YAoUE=;
	b=M0eCz8U2QHfwRNpyqED70dMElIi1KxkuQRXiKGBjX04AIt7FAbcuq95zLEXdRMm0Pp
	CHX6I0GV8PxuZDgIjdrLejcRMvtaY637mCmEAUoM2NAbTl5fLt4q1EcIXpqtpdjaE260
	Xue9n8cHVOYsbm/3PjEPANPR3Aq+YXkQDiRg8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=VFGrUy4nMw7H/EHRnugaXrLg0Fh37eVR8OcvX2Rhhf68JFE36yu2ds8J19pq6hpu+X
	phGFOwVGCHq50QFU4MlZM0SvowxaqHK55sZObWJQ8/i9Z8GhmPZhED3NTSk7cqz/T/nk
	hEGLrjve06AVzGGiLijGp8FL4ALIAS/dtp1ew=
MIME-Version: 1.0
Received: by 10.42.217.72 with SMTP id hl8mr28853icb.349.1287469286787; Mon,
	18 Oct 2010 23:21:26 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 18 Oct 2010 23:21:26 -0700 (PDT)
In-Reply-To: <20101016072423.GM28423@ibawizard.net>
References: <AANLkTini++RBtxheY+RZ2+7X-=i4NAbY39e2wcRA8mDh@mail.gmail.com>
	<20101016072423.GM28423@ibawizard.net>
Date: Tue, 19 Oct 2010 08:21:26 +0200
Message-ID: <AANLkTikt5OzA0VogWq36Ss2ARpZvxjryjmioOivna-fU@mail.gmail.com>
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
Subject: Re: testing branch 2010-10-14
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
X-List-Received-Date: Tue, 19 Oct 2010 06:22:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

For me things in this branch work out quite well. 5 out of 6 targets
build; still peeking at #6.

But actually reason for mailing was to drop the suggestion from Crofton on irc.
He suggested testing_2010-xx-yy was confusing to some and that we
perhaps better could use tested_2010-xx-yy
I think he has a good point.

Frans


