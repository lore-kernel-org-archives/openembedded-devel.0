Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1OunDb-0004VG-Co
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Sep 2010 16:07:45 +0200
Received: from [192.168.42.31] (unknown [92.116.249.73])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 847AF1B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Sep 2010 14:08:49 +0000 (UTC)
Message-ID: <4C8CDE80.8020001@freyther.de>
Date: Sun, 12 Sep 2010 22:06:56 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.7) Gecko/20100720 Fedora/3.1.1-1.fc13 Lightning/1.0b2
	Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C8CA2DC.40707@freyther.de> <i6ieq6$sld$2@dough.gmane.org>
In-Reply-To: <i6ieq6$sld$2@dough.gmane.org>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] insane.bbclass: Enable the insane.bbclass for everyone in a warning mode
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
X-List-Received-Date: Sun, 12 Sep 2010 14:07:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 09/12/2010 07:50 PM, Koen Kooi wrote:


> Can you change the comment to something like:
> 
> # Log QA errors and abort the build when encountering them
> 
> So that it's clear what the 2 vars do?


true.

BTW: why is packagehistory disabled? Was it ever enabled?


