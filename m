Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Oy6ka-00035A-0W
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 19:35:29 +0200
Received: from [192.168.42.217] (unknown [92.117.88.188])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 1609B1B10C07
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 17:37:54 +0000 (UTC)
Message-ID: <4C98ECCF.6010903@freyther.de>
Date: Wed, 22 Sep 2010 01:35:11 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100908 Fedora/3.1.3-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285081581-19915-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1285081581-19915-1-git-send-email-kergoth@gmail.com>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] utility-tasks.bbclass: drop mrproper task
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
X-List-Received-Date: Tue, 21 Sep 2010 17:35:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/21/2010 11:06 PM, Chris Larson wrote:
> From: Chris Larson <chris_larson@mentor.com>
> 
> This task is misleading and potentially quite harmful, as it wipes the entire
> DL_DIR, yet tasks are supposed to be recipe specific.  We have the proper
> distclean task to wipe sources for a recipe + run do_clean, and the user can
> always wipe all of DL_DIR manually if necessary.
> 
> Signed-off-by: Chris Larson <chris_larson@mentor.com>

Acked-by: Holger Hans Peter Freyther <holger@moiji-mobile.com>


