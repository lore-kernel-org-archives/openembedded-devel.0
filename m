Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>)
	id 1LM3sH-0002Sq-Fg; Sun, 11 Jan 2009 18:13:21 +0100
Received: from p5b037f75.dip.t-dialin.net ([91.3.127.117] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1LM3m4-0001eK-DQ by authid <stefan@sostec.de> with cram_md5;
	Sun, 11 Jan 2009 18:06:59 +0100
Received: from stefan by excalibur.local with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>)
	id 1LM3m7-0005jj-3v; Sun, 11 Jan 2009 18:06:59 +0100
Date: Sun, 11 Jan 2009 18:06:59 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-commits@lists.openembedded.org
Message-ID: <20090111170659.GC17627@excalibur.local>
References: <20090111152021.47737188463@amethyst.openembedded.net>
MIME-Version: 1.0
In-Reply-To: <20090111152021.47737188463@amethyst.openembedded.net>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Cc: openembedded-devel@openembedded.org
Subject: Re: [oe-commits] Koen Kooi : mtd-utils: add 1.2.0+git for	ubifs-support
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
X-List-Received-Date: Sun, 11 Jan 2009 17:13:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sun, 2009-01-11 at 16:20, GIT User account wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: f8d4b8781f2b228754a448289f5b2a97844f50bc
> URL:    http://gitweb.openembedded.net/?p=openembedded.git&a=commit;h=f8d4b8781f2b228754a448289f5b2a97844f50bc
> 
> Author: Koen Kooi <koen@openembedded.org>
> Date:   Sun Jan 11 16:19:06 2009 +0100
> 
> mtd-utils: add 1.2.0+git for ubifs-support
> * no -native version added yet

Since this commit mtd-utils fails for me with:

| In file included from lpt.c:23:
| mkfs.ubifs.h:48:23: error: uuid/uuid.h: No such file or directory

regards
Stefan Schmidt


