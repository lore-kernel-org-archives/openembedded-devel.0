Received: from [78.47.116.19] (helo=sirius.lasnet.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1L4IQu-00089c-8j
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Nov 2008 18:07:40 +0100
Received: from p5b037722.dip.t-dialin.net ([91.3.119.34] helo=localhost)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1L4IOB-0006L9-8P by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Nov 2008 18:04:53 +0100
Received: from stefan by localhost with local (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1L4IOA-0002hg-5D
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Nov 2008 18:04:50 +0100
Date: Sun, 23 Nov 2008 18:04:50 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081123170450.GB10050@datenfreihafen.org>
References: <ggc0uc$kvv$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <ggc0uc$kvv$1@ger.gmane.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.3
Subject: Re: Versioning and upgrade paths
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
X-List-Received-Date: Sun, 23 Nov 2008 17:07:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sun, 2008-11-23 at 17:38, Koen Kooi wrote:
>
> I noticed people adding recipes with PVs in the form of '2.6.28rc4',  
> which is wrong:
>
> '2.6.28rc4' will sort higher than '2.6.28', so upgrading to the release  
> from the RC will be impossible.

Yeah, that was me. :)

Thanks for fixing. Read and understand the versioning policy now.

regards
Stefan Schmidt


