Received: from [206.46.173.15] (helo=vms173015pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MRXiy-0000rx-0s
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Jul 2009 22:38:40 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KMW00FZO612WVZ2@vms173015.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	16 Jul 2009 15:24:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1C0F414AF5F; Thu,
	16 Jul 2009 16:24:38 -0400 (EDT)
Date: Thu, 16 Jul 2009 16:24:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090716202438.GC32273@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Busybox ifupdown usage
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
X-List-Received-Date: Thu, 16 Jul 2009 20:38:40 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Busybox has the following warning about using ifupdown:

http://git.busybox.net/busybox/tree/docs/ifupdown_design.txt

AFAICS, ifupdown from Busybox is used in most of the images. Are there any 
concerns? How valid is the warning above?

-- 
Denys


