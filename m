Received: from [160.45.40.10] (helo=mail.math.fu-berlin.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1N63Ba-00082u-7T
	for openembedded-devel@openembedded.org; Thu, 05 Nov 2009 15:19:41 +0100
Received: (qmail 11817 invoked from network); 5 Nov 2009 15:06:25 +0100
Received: from luzin.mi.fu-berlin.de (HELO mi.fu-berlin.de) (160.45.117.148)
	by leibniz.math.fu-berlin.de with SMTP; 5 Nov 2009 15:06:25 +0100
Received: (qmail 22771 invoked by uid 9804); 5 Nov 2009 15:06:26 +0100
Received: from localhost (HELO mi.fu-berlin.de) (127.0.0.1)
	by localhost with SMTP; 5 Nov 2009 15:06:17 +0100
Received: (qmail 22754 invoked by uid 9804); 5 Nov 2009 15:06:17 +0100
Received: from leibniz.math.fu-berlin.de (HELO math.fu-berlin.de)
	(160.45.40.10)
	by luzin.mi.fu-berlin.de with SMTP; 5 Nov 2009 15:06:17 +0100
Received: (qmail 11800 invoked from network); 5 Nov 2009 15:06:17 +0100
Received: from omsk.imp.fu-berlin.de (160.45.45.210)
	by leibniz.math.fu-berlin.de with SMTP; 5 Nov 2009 14:06:17 -0000
Received: from heinold by omsk.imp.fu-berlin.de with local (Exim 4.69 #1
	(Debian)) id 1N62yf-0007JL-70
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2009 15:06:17 +0100
Date: Thu, 5 Nov 2009 15:06:17 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091105140617.GA27537@mi.fu-berlin.de>
References: <1257427464-316-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
X-Envelope-Sender: heinold@mi.fu-berlin.de
X-Virus-Scanned: by AMaViS
	0.3.12pre7-L41+ClamAV[22757](NAI-uvscan@mi.fu-berlin.de)
X-Remote-IP: 160.45.45.210
MIME-Version: 1.0
In-Reply-To: <1257427464-316-1-git-send-email-przemyslaw.wesolek@cs.put.poznan.pl>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-SA-Exim-Connect-IP: 160.45.40.10
X-SA-Exim-Mail-From: heinold@mi.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] boost-1.33.1: Corrected GNU_HASH error.
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
X-List-Received-Date: Thu, 05 Nov 2009 14:19:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

thanks for the patch, but I wonder who is using this older version. Mainly 1.3.36 is used.
I prefer and started to fix the apps in oe which are using boost, to get working with 1.4 and
would be much help if more people joins at this. So in the end we can remove all the 1.3 boost recipe.

Bye Henning


