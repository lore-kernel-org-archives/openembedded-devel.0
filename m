Received: from leibniz.math.fu-berlin.de ([160.45.40.10]
	helo=mail.math.fu-berlin.de) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1OTsgD-0004NH-8k
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 10:30:04 +0200
Received: (qmail 25688 invoked from network); 30 Jun 2010 10:25:19 +0200
Received: from hydra.imp.fu-berlin.de (HELO hydra) (160.45.117.149)
	by leibniz.math.fu-berlin.de with SMTP; 30 Jun 2010 10:25:19 +0200
X-Virus-Scanned: Debian amavisd-new on 'hydra':10024 at mi.fu-berlin.de
Received: from math.fu-berlin.de ([160.45.40.10])
	by hydra (hydra.imp.fu-berlin.de [160.45.117.149]) (amavisd-new,
	port 10024) with SMTP id okiLehgrSbqf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 10:25:13 +0200 (CEST)
Received: (Qmail 25671 invoked from network); 30 Jun 2010 10:25:13 +0200
Received: From andorra.imp.fu-berlin.de (160.45.42.84)
	by leibniz.math.fu-berlin.de with SMTP; 30 Jun 2010 08:25:13 -0000
Received: from heinold by andorra.imp.fu-berlin.de with local (Exim 4.69 #1
	(Debian)) id 1OTsbZ-0004mk-6U
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 10:25:13 +0200
Date: Wed, 30 Jun 2010 10:25:13 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100630082512.GA17841@mi.fu-berlin.de>
References: <1277858503-27321-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1277858503-27321-1-git-send-email-joaohf@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-SA-Exim-Connect-IP: 160.45.40.10
X-SA-Exim-Mail-From: heinold@mi.fu-berlin.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,UNPARSEABLE_RELAY
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Fixes lksctp recipe
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
X-List-Received-Date: Wed, 30 Jun 2010 08:30:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 29, 2010 at 09:41:39PM -0300, Joao H. Freitas wrote:
> [PATCH 1/4] Add lksctp tools
> [PATCH 2/4] Remove mistake configs
> [PATCH 3/4] fix missing packages
> [PATCH 4/4] rename libsctp package
> 
> Thanks

Please use the git rebase -i and squash function.

We don't need the whole history how you envolved the package.

Thanks and bye Henning

-- 
IBM Certified Specialist - eserver i5 iSeries Technical Solutions Designer V5R3


