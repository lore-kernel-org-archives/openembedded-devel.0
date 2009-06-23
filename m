Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MIvS5-0002sQ-5u
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Jun 2009 04:09:37 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLO002EH5GZZWN0@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	22 Jun 2009 20:58:12 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AF9B114AF5F; Mon,
	22 Jun 2009 21:58:11 -0400 (EDT)
Date: Mon, 22 Jun 2009 21:58:11 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090623015811.GC14716@denix.org>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
	<1245664435-30183-7-git-send-email-marcin@juszkiewicz.com.pl>
MIME-version: 1.0
In-reply-to: <1245664435-30183-7-git-send-email-marcin@juszkiewicz.com.pl>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 030/125] libiconv: 1.12 has GPLv3 binaries	LGPLv2.1 libraries
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
X-List-Received-Date: Tue, 23 Jun 2009 02:09:37 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

> libiconv: 1.12 has GPLv3 binaries LGPLv2.1 libraries
> +LICENSE = "GPLv3 LGPLv2"

Since we have separate license files for LGPLv2 and LGPLv2.1 (and they are 
sligtly different), shouldn't we set the LICENSE variable accordingly?

-- 
Denys


