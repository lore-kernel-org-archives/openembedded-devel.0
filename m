Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QZUja-0005S0-Lt
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jun 2011 23:13:14 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LN700IQGMQZ58E5@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	22 Jun 2011 16:09:11 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0E2A614AF5D; Wed,
	22 Jun 2011 17:08:59 -0400 (EDT)
Date: Wed, 22 Jun 2011 17:08:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110622210858.GG1324@denix.org>
References: <1308769321-26192-1-git-send-email-j-lance1@ti.com>
	<ittkfr$n5n$1@dough.gmane.org>
MIME-version: 1.0
In-reply-to: <ittkfr$n5n$1@dough.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH 1/1] matrix-tui: Update to arago toolchain
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
X-List-Received-Date: Wed, 22 Jun 2011 21:13:14 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Jun 22, 2011 at 10:48:59PM +0200, Koen Kooi wrote:
> On 22-06-11 21:02, Jeff Lance wrote:
> > * Modify to use arago MACHINE name for platforms
> 
> This seems to use OE machine names, not arago ones.

Technically correct. But since Arago is just an OE distro, the machine names 
are the same. It's like arguing that omap3evm is not Angstrom machine... :)

-- 
Denys


