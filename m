Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OWIRe-0004nc-Gk for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 02:25:13 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OWIMu-0007VA-8w for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 02:20:04 +0200
Received: from cable-24-129-237-105.dyn.personainc.net ([24.129.237.105])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 02:20:04 +0200
Received: from samuel by cable-24-129-237-105.dyn.personainc.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 02:20:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Samuel Sieb <samuel@sieb.net>
Date: Tue, 6 Jul 2010 23:48:04 +0000 (UTC)
Message-ID: <loom.20100707T014705-193@post.gmane.org>
References: <1278458982-3362-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 24.129.237.105 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100611 Fedora/2.0.4-1.fc13 SeaMonkey/2.0.4)
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][v2] base.bbclass: re-add backward compatibility with	bitbake w.r.t decodeurl fix in bitbake
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
X-List-Received-Date: Wed, 07 Jul 2010 00:25:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Khem Raj <raj.khem <at> gmail.com> writes:

> 
> This patch seems to work with both bitbakes
> 
> Signed-off-by: Khem Raj <raj.khem <at> gmail.com>
> ---
>  classes/base.bbclass |   15 +++++++++++++--
>  1 files changed, 13 insertions(+), 2 deletions(-)
> 

This patch works for me using bitbake 1.8.18.



