Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1NvHOW-00011W-TT
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 22:48:47 +0100
Received: from p5b036e7d.dip.t-dialin.net ([91.3.110.125] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1NvHLQ-0001Bk-RI by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Mar 2010 22:45:35 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1NvHLP-0005WI-QQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 22:45:31 +0100
Date: Fri, 26 Mar 2010 22:45:31 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100326214531.GC18337@excalibur.local>
References: <974C3B6C9F0A4A43918BACCA33390AC270D44F345A@mail.microsol.ie>
MIME-Version: 1.0
In-Reply-To: <974C3B6C9F0A4A43918BACCA33390AC270D44F345A@mail.microsol.ie>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: twin-image & orpheus patch for gcc 4.3
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
X-List-Received-Date: Fri, 26 Mar 2010 21:48:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2009-05-28 at 15:09, Lucian Ion wrote:
> 
> I couldn't build twin-image today.
> 
> Then I found this patch:
> http://bugs.gentoo.org/61223
> 
> I've attached the solution to fix the problem.
> 
> orpheus-gcc-3.4.patch

Sorry for the very late reply. I just stumpled over it in our patchwork setup.

The patch you sent is going to be applied directly to orpheus. What we would
need for OE is a patch that adds it into our tree and modifies the recipe to
apply it. Care to resend such a patch?

regards
Stefan Schmidt


