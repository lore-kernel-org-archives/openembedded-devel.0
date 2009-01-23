Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LQA3z-00076K-DS
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jan 2009 01:38:23 +0100
Received: from andromeda.vanille.de (e180170064.adsl.alicedsl.de
	[85.180.170.64])
	by drlauer-research.com (Postfix) with ESMTP id C5D9258416E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2009 01:52:26 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Jan 2009 01:31:09 +0100
User-Agent: KMail/1.9.10
MIME-Version: 1.0
Message-Id: <200901230131.09511.mickey@vanille-media.de>
Subject: Bugtracker Status
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
X-List-Received-Date: Fri, 23 Jan 2009 00:38:23 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi guys,

we have 1141 open bugs in the bugtracker, a couple of hundreds from ancient 
autobuilder builds, some more hundreds application specific bugs, and then 
some actual ones.

I think there are two ways to deal with the mess:

1.) Officially close the bugtracker down.

2.) Attack the situation.

I'm fine with either way, though if we'd go for 2.), I'd propose:

2.1.) Removing all autobuilder bugs completely (how can we script that?) and 
stop autobuilder automatically adding bugs. It was a great idea, but it 
didn't work out. We do not have enough manpower and it just messes up the 
bugtracker.
2.2.) Remove all software specific bugs that have an upstream and are not 
distribution-relevant, such as GPE, Opie, Kernel, etc.
2.3.) Reinstate the monthly bug squashing weekends.

Opinions?
-- 
:M:


