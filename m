Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JUn2N-0004g7-Mz
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Feb 2008 18:59:21 +0100
Received: from andromeda (e180130242.adsl.alicedsl.de [85.180.130.242])
	by drlauer-research.com (Postfix) with ESMTP id 0DE71584C98
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2008 19:04:47 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Feb 2008 18:58:44 +0100
User-Agent: KMail/1.9.9
MIME-Version: 1.0
Message-Id: <200802281858.44698.mickey@vanille-media.de>
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: who's creating /var and why no longer?
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
X-List-Received-Date: Thu, 28 Feb 2008 17:59:21 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

in the attempt to take care of 
http://bugs.openembedded.org/show_bug.cgi?id=3886 , I booted without psplash 
for the first time in months. I noticed populate-volatiles not working 
correctly because at the point of it running, /var is not there. This leads 
to /var/run/utmp not created etc. Anyone knows what's going on there?

-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de


