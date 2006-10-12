Received: from [69.57.146.91] (helo=srv02.velocera.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <marc@levelstar.com>) id 1GY4Jg-0001pU-4H
	for openembedded-devel@openembedded.org; Thu, 12 Oct 2006 19:25:56 +0200
Received: from Marc (pbx.levelstar.com [65.121.41.186] (may be forged))
	(authenticated bits=0)
	by srv02.velocera.com (8.13.1/8.13.1) with ESMTP id k9CHI7Cq032635
	for <openembedded-devel@openembedded.org>;
	Thu, 12 Oct 2006 12:18:10 -0500
Message-Id: <200610121718.k9CHI7Cq032635@srv02.velocera.com>
From: "Marc Mulcahy" <marc@levelstar.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@openembedded.org>
Date: Thu, 12 Oct 2006 11:19:33 -0600
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook, Build 11.0.5510
Thread-Index: AcbuIpWx+4H5bgtJQqyOdTOx1dfGRg==
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.2962
Subject: Timezones package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Oct 2006 17:25:57 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all:

I'm building for an ARM-based system (XScale pxa270).  When Building the
timezones package works fine, but when attempting to install the
timezone-america package, it complains about a missing dependency on
timezone-dbg, which as far as I can tell doesn't exist.  I couldn't tell how
the timezone-dbg dependency was getting added to the timezone-* packages.
Any ideas?

Marc	



