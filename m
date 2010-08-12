Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OjV4o-0003fL-9j
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Aug 2010 12:32:00 +0200
Received: by gyd8 with SMTP id 8so347032gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Aug 2010 03:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=Fve7kVhGAvpOPi1i5TGIUzt8GGUuADvNr60WJZuwACs=;
	b=NGpWM56aar3NL0aJDYaF20h67fuHaVgarmEMu5ZzhpSRZAJmUHg5a+RmiqZ34Y+xuW
	LsJ15v+lhkVMTK7pK83M++2ChOMR0JaqkYYRlGQ9h+f5NHTgDHssKj/60HgYQbFPq78h
	EI3KxkzAxnhzQDdJzKUlUXN8t/lj4UBt2OQbY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=oZnZ8FZZxrI8wEF5FIOwd/5qmrvqqWjbUvxuHSwqabXENr2YxRyvM8NOKgoIBY+pbc
	wr+C13ZyibgHunJkH/gdJOdeHHGgdS7RtUYBy7/nBchoMXK+835x62NkVpYYccuplWdN
	lTtOh6KXtaYxGhiQfqCmWWeUmmfNb2d7CpIU8=
MIME-Version: 1.0
Received: by 10.150.202.9 with SMTP id z9mr60480ybf.124.1281609104434; Thu, 12
	Aug 2010 03:31:44 -0700 (PDT)
Received: by 10.150.53.9 with HTTP; Thu, 12 Aug 2010 03:31:44 -0700 (PDT)
Date: Thu, 12 Aug 2010 12:31:44 +0200
Message-ID: <AANLkTimWb7wC+KaptOZ13WfHeCe75ek4WjWPnL-2V5VR@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: urjtag git version pushed, still could use some autotools improvement
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
X-List-Received-Date: Thu, 12 Aug 2010 10:32:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I just pushed the git version of urjtag
(http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=44ded83e917c4d8b47b215648efc2860f794c764)

The recipe builds and works, but has some hacks to work around
autotools issues that were beyon my capabilities of fixing.
See http://permalink.gmane.org/gmane.comp.handhelds.openembedded/35345
for a description.

I would appreciate it if someone could have a peek at these.

Frans


