Received: from libra.cs.put.poznan.pl ([150.254.30.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <przemyslaw.wesolek@cs.put.poznan.pl>)
	id 1NFEsC-00061j-Tz for openembedded-devel@lists.openembedded.org;
	Mon, 30 Nov 2009 23:37:40 +0100
Received: from kas30pipe.localhost (unknown [127.0.0.1])
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 3689D90
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2009 22:36:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cs.put.poznan.pl
Received: from libra.cs.put.poznan.pl ([127.0.0.1])
	by localhost (libra.cs.put.poznan.pl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 5kXCWigB58e0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2009 23:36:01 +0100 (CET)
Received: from [192.168.0.100] (103-9.echostar.pl [213.156.103.9])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id E7CEE8F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Nov 2009 23:36:00 +0100 (CET)
Message-ID: <4B1448D1.2000905@cs.put.poznan.pl>
Date: Mon, 30 Nov 2009 23:36:01 +0100
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.3.1259492402.612.openembedded-devel@lists.openembedded.org>
	<1259504704.24812.2.camel@gregoire-laptop>
In-Reply-To: <1259504704.24812.2.camel@gregoire-laptop>
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0278], KAS30/Release
X-SpamTest-Info: Not protected
X-SA-Exim-Connect-IP: 150.254.30.30
X-SA-Exim-Mail-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Boost compilation error
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
X-List-Received-Date: Mon, 30 Nov 2009 22:37:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Gregoire Gentil wrote:
> Hello,
> 
> I get this error when building latest of boost:
> http://pastebin.com/m6bb87892
> I'm on Ubuntu 9.10 with gcc4.4.
> The do compile is here:
> http://pastebin.com/m1822da98
> 
> I didn't have such problem on Ubuntu 9.04.
> 
> Any idea if I'm doing something wrong or if the latest commit on boost
> has a problem?

I can only say it works for me on Ubuntu 9.10.

Przemek



