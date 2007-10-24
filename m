Received: from [89.96.204.112] (helo=www-zirak-new.zirak.it)
	by linuxtogo.org with smtp (Exim 4.67) (envelope-from <phy@linux.it>)
	id 1IkoT7-0004n1-OH
	for openembedded-devel@openembedded.org; Thu, 25 Oct 2007 00:12:53 +0200
Received: (qmail 3701 invoked by uid 64017); 24 Oct 2007 21:59:14 -0000
Received: from 82.58.178.124 (filippo@zirak.it@82.58.178.124) by www-zirak-new
	(envelope-from <phy@linux.it>, uid 64011) with qmail-scanner-2.01 
	(uvscan: v5.1.00/v5052. bogofilter: 0.92.0. spamassassin: 3.0.4.  
	Clear:RC:1(82.58.178.124):. 
	Processed in 0.011623 secs); 24 Oct 2007 21:59:14 -0000
Received: from unknown (HELO ?192.168.1.6?) (filippo@zirak.it@82.58.178.124)
	by www-zirak-new.zirak.it with SMTP; 24 Oct 2007 21:59:14 -0000
Message-ID: <471FC1C0.4010103@linux.it>
Date: Thu, 25 Oct 2007 00:05:52 +0200
From: Filippo Basso <phy@linux.it>
User-Agent: IceDove 1.5.0.12 (X11/20070730)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: getting started - docbook
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Oct 2007 22:12:54 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit



    I have been going through the getting started wiki and noticed that a

    few points are out of date or wrong.

    Would you it be useful if I cleaned up the wiki and converted it to
    docbook for inclusion in the manual?  The gettingstarted link on
    oe.org could then refer to the cannonical gettingstarted instructions
    in the manual.

    Thanks
    David Farning


I'm writing few notes on a doc just for me, called "OE Journey",
explaining what are basic steps in OE, basic tasks, dependencies graphs,
few examples... now it's just 10 pages, can it be useful? Should I
continue in this ooffice doc or can be more useful to others if I change
format (eg. wiki)???

thank you,
    phy

P.S. also writing a simple .dot-graphviz files manipulator to produce
nice graph dependencies with base packages collapsed... (was trying
patching bitbake, but then it's much more confortable an interactive way
like I'm doing now, in php on my localhost)



