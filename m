Received: from outbound.icp-qv1-irony-out2.iinet.net.au ([203.59.1.107])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gbj@theforce.com.au>) id 1NfYf6-0006K0-2t
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 14:00:55 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApIBAPKMc0t8lJcQ/2dsb2JhbAAHkyHFZoRWBA
X-IronPort-AV: E=Sophos;i="4.49,452,1262534400"; d="scan'208";a="605135867"
Received: from unknown (HELO [10.1.1.8]) ([124.148.151.16])
	by outbound.icp-qv1-irony-out2.iinet.net.au with ESMTP;
	11 Feb 2010 20:55:11 +0800
Message-ID: <4B73FE28.3080703@theforce.com.au>
Date: Thu, 11 Feb 2010 23:55:04 +1100
From: Grahame Jordan <gbj@theforce.com.au>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 203.59.1.107
X-SA-Exim-Mail-From: gbj@theforce.com.au
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: gnumeric not building
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
X-List-Received-Date: Thu, 11 Feb 2010 13:00:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

While building omap3-desktop-image gnumeric failed looking for 
gnumeric-stock-pixbufs.h
| application.c:26:44: error: pixmaps/gnumeric-stock-pixbufs.h: No such 
file or directory

This file is in my older repository so I copied it over and it now compiles.
Should this file be put back?

Thanks

Grahame Jordan


