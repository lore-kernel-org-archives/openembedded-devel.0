Received: from mail-gw0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PUWjE-00044D-Nk
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 04:48:04 +0100
Received: by gwj22 with SMTP id 22so1398308gwj.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Dec 2010 19:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=XA2XyI4c5UaAa4d5Leo8YRurBIGetNBpeEQFNh4t6R8=;
	b=ObLqrJ1qOjDTksJMi5gtMTkV5utSbzAmcmu2Uj3/W6zuxNOmUcaDfCzrNPWUJYDyYW
	1jZ79CjYFJfmTuhCn7H6HWgHGjYJI95f+rlW860gqA9QoVjg789okYjWIDYbN9IWyEJd
	lwGriJ1ZbrQuxHvg1tGOcmYtefX96y2Bby9Qk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=HpnxjDA/y8rmT3aFWHgxZvvQY93FjJj/n7OnycloSXi3rSUMGWW5J/qY4hLXKMU0Xm
	xF5Da6MHmvxl+maMvCiEpv/StJ5hz0HU+wcaNICjaRumBPFQZxHsWfx8oPeKWZX6ULSl
	7X2ND+qxVoEopU57Z8Xw/TjFfAtKUzOIhKPr0=
Received: by 10.90.72.5 with SMTP id u5mr4895617aga.114.1292816878310;
	Sun, 19 Dec 2010 19:47:58 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 37sm7771878anr.24.2010.12.19.19.47.57
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 19 Dec 2010 19:47:57 -0800 (PST)
Date: Sun, 19 Dec 2010 19:48:09 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101220034809.GE26429@gmail.com>
References: <AANLkTiknCPruK-CPRKg7hkzhL02Byqk42Tur0a6_fu-7@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTiknCPruK-CPRKg7hkzhL02Byqk42Tur0a6_fu-7@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: python-inotify broken
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
X-List-Received-Date: Mon, 20 Dec 2010 03:48:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (19/12/10 15:18), AJ ONeal wrote:
> python-inotify, (bearing no relation to pyinotify or python-inotifyx, btw)
> is broken.
> it compiles, but it doesn't work.
> 
> Can someone else confirm?
> test case:
> https://github.com/coolaj86/python-examples/tree/master/inotify
> 
> After a few events it just freezes.
> 
> I've also informed the author.
> 
> Generally speaking, is there much point in leaving a library in OE that
> gives false
> hope and then shatters dreams and crushes aspirations?

hmmm well its there, it may not be in best shape but I guess you get a
starting point. here is your opportunity I guess you have to debug it and fix it if possible and
contribute to OE
someone who is stuck in same situation as you can help.

-Khem


