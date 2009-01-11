Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1LM4p8-0003ne-EB
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jan 2009 19:14:10 +0100
Received: from p5b037f75.dip.t-dialin.net ([91.3.127.117] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1LM4is-00039j-H2 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jan 2009 19:07:48 +0100
Received: from stefan by excalibur.local with local (Exim 4.69)
	(envelope-from <stefan@excalibur.local>) id 1LM4ir-0006Ux-Nh
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Jan 2009 19:07:41 +0100
Date: Sun, 11 Jan 2009 19:07:41 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090111180741.GF17627@excalibur.local>
References: <20090111152021.47737188463@amethyst.openembedded.net>
	<20090111170659.GC17627@excalibur.local>
	<gkdanl$3ht$1@ger.gmane.org>
	<20090111175759.GE17627@excalibur.local>
MIME-Version: 1.0
In-Reply-To: <20090111175759.GE17627@excalibur.local>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: Koen Kooi : mtd-utils: add 1.2.0+git for ubifs-support
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
X-List-Received-Date: Sun, 11 Jan 2009 18:14:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sun, 2009-01-11 at 18:57, Stefan Schmidt wrote:
> 
> On Sun, 2009-01-11 at 18:36, Koen Kooi wrote:
> > On 11-01-09 18:06, Stefan Schmidt wrote:
> 
> Now the install of efsprogs-libs fails:
> 
> | making install-shlibs in lib/et
> | make[1]: Entering directory
> `/home/stefan/Projekte/OpenEmbedded/build/openmoko/tmp/work/armv4t-angstrom-linux-gnueabi/e2fsprogs-libs-1.39-r1/e2fsprogs-libs-1.39/lib/et'
> |       MKINSTALLDIRS /usr/lib /usr/lib
> | make[1]: MKINSTALLDIRS@: Command not found
> 
> Do you use e2fsprogs-libs-1.42.2 or e2fsprogs-libs-1.39?

With 1.42.2 it works fine here. Bumped preferred version for the om stuff.

regards
Stefan Schmidt


