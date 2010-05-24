Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OGhEj-0002Td-6Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 01:39:09 +0200
Received: from gandalf.denix.org ([unknown] [71.255.238.44])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L2Y00EI26TABXB1@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	24 May 2010 18:34:28 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7211A14AF60; Mon,
	24 May 2010 19:34:22 -0400 (EDT)
Date: Mon, 24 May 2010 19:34:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100524233422.GK25484@denix.org>
References: <1274733028-13432-1-git-send-email-clarson@kergoth.com>
	<1274733028-13432-2-git-send-email-clarson@kergoth.com>
MIME-version: 1.0
In-reply-to: <1274733028-13432-2-git-send-email-clarson@kergoth.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.7
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 2/2] Make the do_patch apply=yes param implicit if	extension is .diff/.patch
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
X-List-Received-Date: Mon, 24 May 2010 23:39:10 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, May 24, 2010 at 01:30:28PM -0700, Chris Larson wrote:
> From: Chris Larson <chris_larson@mentor.com>
> 
> For .diff/.patch you need to apply manually, you can specify apply=no.
> 
> Signed-off-by: Chris Larson <chris_larson@mentor.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> diff --git a/classes/patch.bbclass b/classes/patch.bbclass
> index 6ef408f..5ad9c7c 100644
> --- a/classes/patch.bbclass
> +++ b/classes/patch.bbclass


