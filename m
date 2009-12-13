Received: from libra.cs.put.poznan.pl ([150.254.30.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <przemyslaw.wesolek@cs.put.poznan.pl>)
	id 1NJtCO-0005wR-Gh for openembedded-devel@lists.openembedded.org;
	Sun, 13 Dec 2009 19:29:43 +0100
Received: from kas30pipe.localhost (unknown [127.0.0.1])
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 9D1989E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Dec 2009 18:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cs.put.poznan.pl
Received: from libra.cs.put.poznan.pl ([127.0.0.1])
	by localhost (libra.cs.put.poznan.pl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id FIMECllc2TG4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Dec 2009 19:26:17 +0100 (CET)
Received: from [192.168.0.100] (102-101.echostar.pl [213.156.102.101])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 0563C91
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Dec 2009 19:26:17 +0100 (CET)
Message-ID: <4B25322A.4020602@cs.put.poznan.pl>
Date: Sun, 13 Dec 2009 19:27:54 +0100
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BAY127-W32DC804131DD0AD0DBD49D88A0@phx.gbl>
In-Reply-To: <BAY127-W32DC804131DD0AD0DBD49D88A0@phx.gbl>
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0278], KAS30/Release
X-SpamTest-Info: Not protected
X-SA-Exim-Connect-IP: 150.254.30.30
X-SA-Exim-Mail-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problem using "bitbake"
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
X-List-Received-Date: Sun, 13 Dec 2009 18:29:43 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

saleh usman wrote:
> If I'll use "stars" where to specify image for which bitbake will build.

As usually, as the argument to bitbake command.

The stars in BBFILES are replacement for path parts. Just use the
correct prefix instead of "/stuff/openembedded/" and run 'bitbake
helloworld-image'.

Przemek



