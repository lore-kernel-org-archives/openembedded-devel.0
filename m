Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1KvGYm-0007nd-Kk
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Oct 2008 20:18:33 +0100
Received: from p5b035f05.dip.t-dialin.net ([91.3.95.5]
	helo=dodger.lab.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1KvGXo-0007tC-3k by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2008 20:17:30 +0100
Received: from stefan by dodger.lab.datenfreihafen.org with local (Exim 4.69)
	(envelope-from <stefan@dodger.lab.datenfreihafen.org>)
	id 1KvGYR-000510-Fz for openembedded-devel@lists.openembedded.org;
	Wed, 29 Oct 2008 20:18:09 +0100
Date: Wed, 29 Oct 2008 20:18:07 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081029191807.GA7080@dodger.lab.datenfreihafen.org>
References: <4908950C.6030406@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4908950C.6030406@linux.intel.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: Small url fix for xerces-c
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
X-List-Received-Date: Wed, 29 Oct 2008 19:18:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2008-10-29 at 16:53, Joshua Lock wrote:
> 
> I noticed the url in the xerces-c recipe is incorrect. Patch attached.

I checked and commited it:
http://git.openembedded.net/?p=openembedded.git;a=commitdiff;h=714e2cace5819ff64b04f870506dbfca9bd1c557

I also added a follow up patch with the needed checksums for this new location.

Thanks for your contribution.

regards
Stefan Schmidt


