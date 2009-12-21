Received: from libra.cs.put.poznan.pl ([150.254.30.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <przemyslaw.wesolek@cs.put.poznan.pl>)
	id 1NMfAA-0005zC-Eu for openembedded-devel@lists.openembedded.org;
	Mon, 21 Dec 2009 11:06:53 +0100
Received: from kas30pipe.localhost (unknown [127.0.0.1])
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id 6E264A7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2009 10:02:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cs.put.poznan.pl
Received: from libra.cs.put.poznan.pl ([127.0.0.1])
	by localhost (libra.cs.put.poznan.pl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id Qd2axnh-fPk4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2009 11:02:08 +0100 (CET)
Received: from [150.254.31.31] (idss-pw.cs.put.poznan.pl [150.254.31.31])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by libra.cs.put.poznan.pl (Postfix on VMS) with ESMTP id E0E70A5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Dec 2009 11:02:04 +0100 (CET)
Message-ID: <4B2F4847.7070700@cs.put.poznan.pl>
Date: Mon, 21 Dec 2009 11:04:55 +0100
From: Przemyslaw Wesolek <przemyslaw.wesolek@cs.put.poznan.pl>
Organization: Poznan University of Technology
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1986479129.867281259879607562.JavaMail.root@sz0029a.westchester.pa.mail.comcast.net>	<4B1916FD.7080905@cs.put.poznan.pl>
	<loom.20091220T090122-975@post.gmane.org>
In-Reply-To: <loom.20091220T090122-975@post.gmane.org>
X-Enigmail-Version: 0.96.0
X-SpamTest-Version: SMTP-Filter Version 3.0.0 [0278], KAS30/Release
X-SpamTest-Info: Not protected
X-SA-Exim-Connect-IP: 150.254.30.30
X-SA-Exim-Mail-From: przemyslaw.wesolek@cs.put.poznan.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: minimal xwindows
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
X-List-Received-Date: Mon, 21 Dec 2009 10:06:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

John Buckley wrote:
> Question:  How do I get the Xserver to run in the background as a service so I
> can then run my application.  Or, do I just run 'X' and launch my application
> using the script .xinitrc or .xsession?

I don't know details, as I used Xfbdev, but running Xserver in the
background is as simple as appending ampersand (&) to the command line, like

  Xserver &

Przemek



