Received: from gnukia.org ([85.214.67.64] helo=cbs.gnukia.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tilman@baumann.name>) id 1TB7sE-0003Pw-LG
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 19:34:14 +0200
Received: from cbs.gnukia.org (cbs.gnukia.org [127.0.0.1])
	by localhost (Postfix) with ESMTP id A3701EC4003
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2012 19:06:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on cbs.gnukia.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=8.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.0.21] (mail.grandeye.com [82.16.22.188])
	by cbs.gnukia.org (Postfix) with ESMTPSA id 78A80EC4002
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2012 19:06:42 +0200 (CEST)
Date: Mon, 10 Sep 2012 18:12:52 +0100
From: Tilman Baumann <tilman@baumann.name>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Filtered: By ProxSMTP
Message-ID: <504E1F94.9000606@baumann.name>
X-Anti-Virus: Kaspersky Anti-Virus for Linux Mail Server 5.6.42/RELEASE,
	bases: 20111108 #5646748, check: 20120910 clean
Subject: minimal template layer for new machine support
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
X-List-Received-Date: Mon, 10 Sep 2012 17:34:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm working on a TI DM812x support overlay.
I guess what it comes down to is a new kernel recipe (based on TI's 
sources) and this funny two stage u-boot.
I think I can write the recipes. But what I don't quite see is how I 
would add a new supported machine in the first place?
I was trying to orient myself on a few existing machine support layers. 
But I think I'm still missing the point.
What are the minimal basics to implement? Where should I start?

Thanks for any help.

Cheers
  Tilman


