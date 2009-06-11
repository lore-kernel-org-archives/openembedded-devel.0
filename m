Received: from [209.85.132.243] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1MElK6-0000uO-RI
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jun 2009 16:32:11 +0200
Received: by an-out-0708.google.com with SMTP id b6so789761ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2009 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=orGwJlU6yf0VQzDeJeIIUHg8YFQUD7FgerfsbvMWvy8=;
	b=quzNxaWJ6o//3fdOq4R0Uwu1wznwfSWTRVdt+RzTrPxDgsZItl4uQEdLSjK2O3KY44
	GIF8cHG7XA4dRl6uBZf+NuUJDqLCX5nMG07JbUPR12CYy5oj5KSGZxzTrfju7T329paC
	sGho4gagt1du0sulA019j3mhU1FbixMObJ+0E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UCyZ+d9Dv5i9Jlt+ASNv2GjN/KHdpwZVve4fhf987C7TRAgZE8vAfwuyTtk9zg2F+t
	qO5HwOXhtoNx59F5ubec3jyyIz4Q1BXxUgElwSJi3iQvrTiBjmNuGizFdF0up1CaDl9h
	CD+mAOM/Tci9HrL9c9mDrBHs1PgLsTOT1M8Ns=
MIME-Version: 1.0
Received: by 10.100.213.13 with SMTP id l13mr2957518ang.110.1244730142700; 
	Thu, 11 Jun 2009 07:22:22 -0700 (PDT)
In-Reply-To: <CEB81C4F-48EC-4D42-84C2-F7779D133565@mac.com>
References: <1244366174.4412.11.camel@daniel-laptop>
	<1244384219.4431.46.camel@utx.utx.cz>
	<1244385233.4151.27.camel@lenovo.internal.reciva.com>
	<1244402010.4463.36.camel@utx.utx.cz>
	<1244402413.4151.36.camel@lenovo.internal.reciva.com>
	<1244721978.28486.107.camel@hammer.suse.cz>
	<CEB81C4F-48EC-4D42-84C2-F7779D133565@mac.com>
Date: Thu, 11 Jun 2009 16:22:22 +0200
Message-ID: <ac9c93b10906110722g77626187m50f92b8f20c9579c@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: e2fsprogs-libs failed on latest org.openembedded.dev branch
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
X-List-Received-Date: Thu, 11 Jun 2009 14:32:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I had the build problem too 2 days ago. bitbake console-image
repeatedly gave this problem.
yesterday I was about to dig into this, I did a git pull just to be
sure that if things were fixed, I would have the fix.
After that the problem mysteriously disappeared.(for me)

Guess it is something in the python code, but I have little knowledge
about this.

Frans


