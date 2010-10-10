Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1P4soc-0004aL-Hy
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Oct 2010 12:07:39 +0200
Received: (qmail 30673 invoked by uid 813007); 10 Oct 2010 10:07:11 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO ?192.168.1.144?)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 10 Oct 2010 10:07:11 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Modest 3.2
References: <1286704333-27208-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1286704333-27208-1-git-send-email-raj.khem@gmail.com>
Date: Sun, 10 Oct 2010 12:09:14 +0200
Message-Id: <1286705354.9551.2.camel@Nokia-N900>
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bitbake.conf: Increase IMAGE_EXTRA_SPACE 4 times
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
X-List-Received-Date: Sun, 10 Oct 2010 10:07:39 -0000
Content-Type: text/plain; charset=utf-8
Content-ID: <1286705353.9551.1.camel@Nokia-N900>
Content-Transfer-Encoding: 8bit

> * Building native-sdk-image or x11-image genext2fs fails
>     as it runs out of space. This change helps it with extra
>     space needs.

Out of space or out of inodes? Please check.




