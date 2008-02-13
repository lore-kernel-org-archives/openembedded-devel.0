Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mickey@vanille-media.de>) id 1JPGtl-00067M-HO
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Feb 2008 13:39:37 +0100
Received: from andromeda (e180166131.adsl.alicedsl.de [85.180.166.131])
	by drlauer-research.com (Postfix) with ESMTP id 5E02E584BEB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Feb 2008 13:44:50 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Feb 2008 13:40:02 +0100
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Message-Id: <200802131340.02616.mickey@vanille-media.de>
Subject: tinylogin vs. busybox
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
X-List-Received-Date: Wed, 13 Feb 2008 12:39:37 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I just realized that we are still using tinylogin which has bugs and is dead. 
Newer busybox releases contain all the functionality. Anyone know a 
compelling reason to keep using tinylogin as the default in task-base? If 
not, I'd like to switch to busybox (after changing its defconfig) soon.

:M:
-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de


