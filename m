Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N7x9B-0001IL-EJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Nov 2009 21:17:04 +0100
Received: by yxe5 with SMTP id 5so366161yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Nov 2009 12:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=diF9o0WEX4RKRerX4vK2GIWBBcU5k0n+/oTtDHHnDK8=;
	b=RQiRixMTkyL4TvfbmOP2sd46xY3wwvttb/ysiT0YFOgTh2LfsX6Tzq0MDCD8OrAnvB
	Cjwl8msNnmj6R1hs429Q5aw0QoREDNdqqmwe+mlHWbhCiYzOAccaadphZkYggP7YFdxh
	K+B4l1VKOopF9yNCUBJDa0AA/3qhdX4q1gOgs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=tJ6QGYURm2FfW8yG7YM/boknbPA+C3JGTre3m/hTgjwAKG6IZPOaMS3SMVfz2sWBre
	uP6g1lsKD3nWmDEHHIOxwfistl/l4P1KjfISsMgj/jIs6NsnpvLDLA/UHA1SRJQ5xH/9
	njEtLR8COu5uzfaKzeHrRMQM7J/m6+fT6/1WU=
MIME-Version: 1.0
Received: by 10.101.162.10 with SMTP id p10mr913565ano.92.1257884143372; Tue, 
	10 Nov 2009 12:15:43 -0800 (PST)
Date: Tue, 10 Nov 2009 21:15:43 +0100
Message-ID: <ac9c93b10911101215v6d52641tb71d919cb5de23e2@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: apache2 2.2.14
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
X-List-Received-Date: Tue, 10 Nov 2009 20:17:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

I tried to bring apache up to 2.2.14 but ran into problems.
I needed to add a patch in srclib/apr/configure.in but for some reason
the configure file in that dir is not regenerated.
As autotools is not really my league of sports, I'm asking for help here.

The recipe + patches can be found at
http://filebin.ca/umxxuc/2.2.14.tar (for the next 30 days)
Can someone have a look at it and come with a suggestion.

Thanks, Frans.


