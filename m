Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Owui9-0008MB-P6
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Sep 2010 12:32:07 +0200
Received: from [192.168.42.95] (mobile-out.siminn.is [212.30.211.225])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 75A371B10C05
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Sep 2010 10:33:30 +0000 (UTC)
Message-ID: <4C9494EC.4070309@freyther.de>
Date: Sat, 18 Sep 2010 18:31:08 +0800
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100908 Fedora/3.1.3-1.fc14 Lightning/1.0b2
	Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,
	RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_SORBS_WEB autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Question regarding the staging layout
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
X-List-Received-Date: Sat, 18 Sep 2010 10:32:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

I am seeing a lot of messages like:

/home/ich/build/arm/xscale/tmp/sysroots/i686-linux/usr/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
warning: libc.so, needed by
/home/ich/build/arm/xscale/tmp/sysroots/i686-linux/usr/armv5te/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/lib/libgcc_s.so,
not found (try using -rpath or -rpath-link)


is that to be expected?


