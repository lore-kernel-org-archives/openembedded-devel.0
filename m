Received: from [62.169.194.61] (helo=cp3a.criticalpath.priv)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <skoroneos@digital-opsis.com>) id 1HS7AF-0007Ab-Hc
	for openembedded-devel@openembedded.org; Fri, 16 Mar 2007 08:47:52 +0100
Received: from dias (62.169.211.226) by cp3a.criticalpath.priv (7.3.118.3)
	id 45DC50A200128B12 for openembedded-devel@openembedded.org;
	Fri, 16 Mar 2007 09:46:59 +0200
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: <openembedded-devel@openembedded.org>
Date: Fri, 16 Mar 2007 09:47:50 +0200
Message-ID: <HOECLKEKOHLAMMGDLLBHGENDKGAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
In-Reply-To: <cf1872900703151326p5f7b0eccje25cfa7f49c6ffd5@mail.gmail.com>
Importance: Normal
Subject: Checking which packages build
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
X-List-Received-Date: Fri, 16 Mar 2007 07:47:53 -0000
Content-Type: text/plain;
	charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Greetings to all !

I have started from yesterday an effort to build all packages in OE one by
one in order to verify if they build or not and post the relative bug
report.
I will continue this during the weekend (as time permits)
Results from the build are also posted in Tinderbox
http://ewi546.ewi.utwente.nl/tinderbox/showbuilds.pl?tree=oplinux

I am building on an i686 (P4 Celeron @ 2.5 GHz) for x86 using gcc 4.1.1 and
libc 2.5

Please check the bugtracker, verify if the package build/fails for you and
submit any info and/or patches you might have.
Include info about your build machine, target and distro
Those with write access to the OE rep, plese do not push any changes
directly and please do not close any of the bugs until the process halts.

Thanks in advance to everyone for their time

Stelios S. Koroneos







