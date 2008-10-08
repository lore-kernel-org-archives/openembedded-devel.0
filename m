Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jluebbe@lasnet.de>) id 1KnWCw-0006SL-6p
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Oct 2008 12:23:54 +0200
Received: from vpn.apm.etc.tu-bs.de ([134.169.172.70] helo=[172.30.2.1])
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1KnW8P-00007Z-SG by authid <jluebbe@lasnet.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Oct 2008 12:19:16 +0200
From: Jan Luebbe <jluebbe@lasnet.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1206919092.4838.23.camel@dax.rpnet.com>
References: <1206919092.4838.23.camel@dax.rpnet.com>
Date: Wed, 08 Oct 2008 12:18:18 +0200
Message-Id: <1223461098.6097.166.camel@polaris>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: Old bitkeeper repository
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
X-List-Received-Date: Wed, 08 Oct 2008 10:23:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2008-03-31 at 00:18 +0100, Richard Purdie wrote:
> Hi,
> 
> I've been experimenting with the bitkeeper cvs dump we have of the OE
> repository that was there. I'm planning on turning this into a git
> repository so we can more easily see what was in there.

Which scripts/tools and source data did you use to generate this
repository
(http://git.openembedded.net/?p=org.openembedded.rp-bkcvs.git;a=summary)?

I've been trying to reproduce it to be able to integrate it during the
switch to git. I'm using a oe-bitkeeper-cvs-export.tar.bz2 with the
md5sum fd83dccf5a74198f7e1417d97d6c6520 as source.

Jan



