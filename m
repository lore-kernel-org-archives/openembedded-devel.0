Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Pu6Uc-00058N-GE
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 18:02:42 +0100
Received: from [89.204.137.77] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Pu6TE-0000MT-Nf by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Feb 2011 18:01:19 +0100
Received: from stefan by excalibur.local with local (Exim 4.74)
	(envelope-from <stefan@excalibur.local>) id 1Pu6TA-0001Kr-IE
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 18:01:12 +0100
Date: Mon, 28 Feb 2011 18:01:11 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110228170111.GB4192@excalibur.local>
References: <4D6BBFDE.2090406@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4D6BBFDE.2090406@mentor.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Subject: Re: Release-2011.03 status
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
X-List-Received-Date: Mon, 28 Feb 2011 17:02:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Mon, 2011-02-28 at 08:31, Tom Rini wrote:
> 
> So, my current plan of attack is to do what I've said before and
> merge the libvpx work-around, tag, revert the libvpx work-around
> (per Khem's request).  And I plan to do this tomorrow unless people
> shout about wanting to fix something they know is broken and need a
> little more time.

For llvm and thus openjdk-6 we need the patch merged I posted today. I'm not
completely sure that it is the best solutions thats why I posted it instead of
just commit it.

regards
Stefan Schmidt


