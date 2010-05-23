Received: from smtp-4.concepts.nl ([213.197.30.111])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>) id 1OGHo0-00073D-IR
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 May 2010 22:29:53 +0200
Received: from c3404277.ftth.concepts.nl ([195.64.66.119]
	helo=mx1.grimmerink.nl) by smtp-4.concepts.nl with esmtp (Exim 4.69)
	(envelope-from <pieterg@gmx.com>)
	id 1OGHVF-0004NX-Sv; Sun, 23 May 2010 22:10:29 +0200
Received: from [10.9.0.12] (unknown [10.9.0.12])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.grimmerink.nl (Postfix) with ESMTPSA id 251946A138;
	Sun, 23 May 2010 22:10:25 +0200 (CEST)
From: pieterg <pieterg@gmx.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Sun, 23 May 2010 22:10:18 +0200
User-Agent: KMail/1.9.9
References: <a4b71a86a14f591edb468e79e6ed9d13dda96958.1274642314.git.enrico.scholz@sigma-chemnitz.de>
	<712988cd3a458edd17b46a35ae1a82969c45e4dc.1274642314.git.enrico.scholz@sigma-chemnitz.de>
In-Reply-To: <712988cd3a458edd17b46a35ae1a82969c45e4dc.1274642314.git.enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Message-Id: <201005232210.18644.pieterg@gmx.com>
X-Concepts-MailScanner-Information: Please contact abuse@concepts.nl for more
	information
X-Concepts-MailScanner-ID: 1OGHVF-0004NX-Sv
X-Concepts-MailScanner: Found to be clean
X-Concepts-MailScanner-SpamCheck: 
X-Concepts-MailScanner-From: pieterg@gmx.com
X-SA-Exim-Connect-IP: 213.197.30.111
X-SA-Exim-Mail-From: pieterg@gmx.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/3] freetype: enable bytecode interpreter
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
X-List-Received-Date: Sun, 23 May 2010 20:29:53 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday 23 May 2010 21:20:03 Enrico Scholz wrote:
> Bytecode stuff is patent encumbered so it can be enabled for
> non-enterprise distributions only.

The bytecode patents have expired, so there's no more need to use a 
conditional patch

http://lists.nongnu.org/archive/html/freetype-devel/2006-11/msg00006.html

Rgds, Pieter


