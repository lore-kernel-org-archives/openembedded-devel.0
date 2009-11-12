Received: from [72.167.82.84] (helo=p3plsmtpa01-04.prod.phx3.secureserver.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1N8erF-0002at-Mg
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 19:57:29 +0100
Received: (qmail 8584 invoked from network); 12 Nov 2009 18:49:25 -0000
Received: from unknown (75.49.209.68)
	by p3plsmtpa01-04.prod.phx3.secureserver.net (72.167.82.84) with ESMTP;
	12 Nov 2009 18:49:25 -0000
Message-ID: <4AFC58B0.3080000@mwester.net>
Date: Thu, 12 Nov 2009 12:49:20 -0600
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.0911120045170.1265@localhost>	<200911120656.41249.holger+oe@freyther.de>	<200911120722.09166.holger+oe@freyther.de>	<alpine.LFD.2.00.0911120125380.1977@localhost>	<ac9c93b10911120015j5b8cbc07j30f57f2dc68987ca@mail.gmail.com>	<alpine.LFD.2.00.0911120727540.7268@localhost>
	<ac9c93b10911120447k496f094bg478dc05ae612b4a9@mail.gmail.com>
In-Reply-To: <ac9c93b10911120447k496f094bg478dc05ae612b4a9@mail.gmail.com>
X-SA-Exim-Connect-IP: 72.167.82.84
X-SA-Exim-Mail-From: mike@mwester.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: xterm: either fix it, or remove it. please.
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
X-List-Received-Date: Thu, 12 Nov 2009 18:57:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:

> So it is not really fedora specific, but it is SELinux specific.
> Do we want to support SELinux as build host ?

Do we want to?  Yes, it would be a nice thing to support.

Is it practical?  I think the answer is no.  In my experience, tools
like selinux have a tendency to require inordinate amounts of
administrative burden that just isn't practical in a development
environment.  I think requiring that selinux be disabled on build hosts
is a reasonable requirement, and will avoid wasting a lot of cycles that
should be spent on OE, and not on administration (or sending lots of
emails).

-Mike (mwester)





