Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OIK3R-0008Gp-B3
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 May 2010 13:18:21 +0200
Received: by gwj15 with SMTP id 15so1605453gwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 May 2010 04:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=7aEGpv/FregxOJO0d7/ZlnoYXsw7/jvf61BTC0mAqWE=;
	b=meEDUkU81bcpudxutNjFvZWYw1ZYcIPXHTq6jCGirwJZHCjOsOFUsjoorD4uotoc95
	z2BRToA9nl6RJEHDnn9d4oM/Bn/sjuv8CNnkgiqh1xezMW5UVlwwxplS0RlsWVV8ltNq
	sopggKfTZYTTCYmLzLXzi/Gjg9yuWHtjxvsEE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Jjb73OPq7nyn+mwHO2k7A0IXlurjh31YtHhfAm6FrByl6XOPTwxP5hrsSOW0y5qxyo
	ixWtcEs+WKqP+EcZ1YT5aZh/wGoq6YcJwX0cnmG4dsnUoCLkUW6U8cKsZU1ibocToYbH
	LxG+T0aceuY8Clhtd1cFyMEd6oDyfkoTEEm7E=
MIME-Version: 1.0
Received: by 10.100.244.32 with SMTP id r32mr1828715anh.28.1275131641915; Sat, 
	29 May 2010 04:14:01 -0700 (PDT)
Received: by 10.100.232.16 with HTTP; Sat, 29 May 2010 04:14:01 -0700 (PDT)
In-Reply-To: <htqn9k$gvu$1@dough.gmane.org>
References: <htqn9k$gvu$1@dough.gmane.org>
Date: Sat, 29 May 2010 13:14:01 +0200
Message-ID: <AANLkTinPePxmIwOptgdFv-4CkJWzixbLvB26pxBw1dec@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Faking sign offs is bad
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
X-List-Received-Date: Sat, 29 May 2010 11:18:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

The patch was sitting since long time (I had no time to test it
before) and recently udev has been changed. I wanted to give it a bump
before 'static' recipe renaming.

I'm sorry if its signature not conform.
My intent was to properly give credits to the author (koen).

Lesson: never commit at 2 o' clock..

Regards

Andrea


