Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1O2RFH-0001ly-22
	for Openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 17:44:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 220412C7F5
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 15:40:15 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ULwyfi9UD9vK
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 15:40:11 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id BA59D2C7DC
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 15:40:10 +0000 (UTC)
Message-ID: <4BC73399.1050605@gmail.com>
Date: Thu, 15 Apr 2010 17:41:13 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: Openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: xorg-lib switch to new style staging problem
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
X-List-Received-Date: Thu, 15 Apr 2010 15:44:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,
since this afternoon I am facing to this error
ERROR: '/openembedded/recipes/xorg-lib/xorg-headers-native.bb' failed

http://pastebin.com/BDkDy6D1

Maybe xorg-lib switch to new style staging doesn't work properly?
If not, could you please give me a hint about how to solve this problem?

TIA

/marco


