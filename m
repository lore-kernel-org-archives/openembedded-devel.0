Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OvUAT-0002Tg-4D
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 13:59:25 +0200
Received: by gwb10 with SMTP id 10so1324653gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Sep 2010 04:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=HqWp4xS9iCvpPpWK+02a+zlMLjQmDnCFOkRX0zfnlsk=;
	b=PzsC8DHJ0xFS9J+xSRWcg6rXxaILMYSi3y8WMxHQRXytXZpzWjG5AS304GJCi0JOO8
	3ldq+yUpLYme3jU7W+mqFD6Y7h/VSL6xQWvi5g75Le4dcdxLDIv+JwXAQgs/r6ZnXBRv
	p2T3g9lIg9Mi8Mrya34U+u8gNX8N+LfKFLbv4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=PeW6GEmfjGm3XuRmOJ5J/DXqivoolqog6gVQ4cmeKedStEXc4tdB59DP7WK0gn6mf3
	m/Se1Hzr0ZUeUNYwSFtSfqgO0kQxl8ZIQqxXKVve4bAPW8l3+WKAwMBsFLBTAJdXwe2u
	jSP3JEvWiNb9Ejf9R3UPbAG2vZkX58CGI5jdY=
MIME-Version: 1.0
Received: by 10.100.153.15 with SMTP id a15mr963690ane.179.1284465507950; Tue,
	14 Sep 2010 04:58:27 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Tue, 14 Sep 2010 04:58:27 -0700 (PDT)
In-Reply-To: <4C8F5E55.9010906@balister.org>
References: <AANLkTi=6fss18KJvTBYf3oV1MXkgJwT7cqTRz4rK+aTx@mail.gmail.com>
	<4C8F5E55.9010906@balister.org>
Date: Tue, 14 Sep 2010 13:58:27 +0200
Message-ID: <AANLkTimRL_CpmXPfXi5HShYpMD4H5-=LyHhbnJZZF0A_@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-09-13
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
X-List-Received-Date: Tue, 14 Sep 2010 11:59:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

I had a problem with gnome-games and docbook for beagleboard-demo-image.
See http://thread.gmane.org/gmane.comp.handhelds.openembedded/36932

I didn't add this result to the wiki, since, as far as I am concerned,
this test was only a one-shot.

Frans


