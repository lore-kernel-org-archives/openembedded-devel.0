Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1NuUXY-0004Hw-Dz
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 18:38:49 +0100
Received: from p5b03671c.dip.t-dialin.net ([91.3.103.28] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1NuUUU-0004zB-Jc by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Mar 2010 18:35:41 +0100
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1NuUUT-0008Q2-UC
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Mar 2010 18:35:37 +0100
Date: Wed, 24 Mar 2010 18:35:37 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100324173537.GA17800@excalibur.local>
References: <1269346975-842-2-git-send-email-khimov@altell.ru>
	<1269354368-20910-1-git-send-email-khimov@altell.ru>
	<1269354368-20910-2-git-send-email-khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <1269354368-20910-2-git-send-email-khimov@altell.ru>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] lowpan-tools: fix lowpan-tools-tests packaging
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
X-List-Received-Date: Wed, 24 Mar 2010 17:38:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2010-03-23 at 17:26, Roman I Khimov wrote:
> RDEPENDS on python, wants python-native at build time.
> 
> Signed-off-by: Roman I Khimov <khimov@altell.ru>

Sorry, I missed this one. I just updated to a newer SRCREV and fixed the SRC_URI
as well. You will need to rebase as the context of your changes hunks has
changed. Otherwise it looks good to me.

Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>

regards
Stefan Schmidt


