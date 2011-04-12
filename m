Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Q9bUD-0002sc-K9
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2011 13:10:21 +0200
Received: from [2001:638:602:1183:389d:f73e:3ad8:812d] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Q9bS4-0004cM-NH by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Apr 2011 13:08:10 +0200
Received: from stefan by excalibur.local with local (Exim 4.75)
	(envelope-from <stefan@excalibur.local>) id 1Q9bS3-0007UX-LY
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2011 13:08:07 +0200
Date: Tue, 12 Apr 2011 13:08:07 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110412110807.GD17374@excalibur.local>
References: <1302543515-3845-1-git-send-email-anders@chargestorm.se>
MIME-Version: 1.0
In-Reply-To: <1302543515-3845-1-git-send-email-anders@chargestorm.se>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Subject: Re: [PATCHv3] lowpan-tools_0.2.2; : fix build with static libnl1
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
X-List-Received-Date: Tue, 12 Apr 2011 11:10:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2011-04-11 at 19:38, Anders Darander wrote:
> * add NL_CFLAGS to a few Makefiles.am (to find libnl header files)
> * add _GNU_SOURCE to a few Makefiles.am (to make struct ucread visible)
> * git version not fixed
> * build and runtime tested, although only in qemuarm
> 
> Signed-off-by: Anders Darander <anders@chargestorm.se>

Tested and pushed. Thanks for your contribution.

regards
Stefan Schmidt


