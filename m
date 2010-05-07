Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OAKqo-0005bA-Ee
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 12:32:10 +0200
Received: from w0968.wlan.rz.tu-bs.de ([134.169.203.206] helo=excalibur)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OAKn6-0004GO-Q8 by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 May 2010 12:28:23 +0200
Received: from stefan by excalibur with local (Exim 4.71)
	(envelope-from <stefan@excalibur.local>) id 1OAKn5-0007Y3-Dm
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 12:28:19 +0200
Date: Fri, 7 May 2010 12:28:19 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100507102819.GE18308@excalibur.local>
References: <1272425953-19544-1-git-send-email-jacob@technosorcery.net>
MIME-Version: 1.0
In-Reply-To: <1272425953-19544-1-git-send-email-jacob@technosorcery.net>
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
Subject: Re: [PATCH] Add missing opening <varlistentry> tag in the user manual.
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
X-List-Received-Date: Fri, 07 May 2010 10:32:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2010-04-27 at 20:39, Jacob Helwig wrote:
> While we're here, remove the straggling hard-tabs.
> 
> Signed-off-by: Jacob Helwig <jacob@technosorcery.net>

I applied and pushed this. Thanks for your contribution.
> ---
> 
> I hope this is the right way to submit a documentation fix.  If not, please
> point me at the FM, since I didn't find it in looking through the Wiki, or the
> repo.

Thats the right way. I just added a "usermanual" prefix to your patch subject
line to make it more clear for people what part of our repo it changes when
browsing git log.

regards
Stefan Schmidt


