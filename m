Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OYkWT-0006Pb-0q
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 20:48:05 +0200
Received: from p5b034ad5.dip.t-dialin.net ([91.3.74.213] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OYkWQ-0002dB-3m by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jul 2010 20:48:04 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1OYkWP-0001Ad-0S
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 20:48:01 +0200
Date: Tue, 13 Jul 2010 20:48:00 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100713184800.GB1947@excalibur.local>
References: <1278447438-27251-1-git-send-email-stefan@datenfreihafen.org>
	<4C3395A0.7060702@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4C3395A0.7060702@mentor.com>
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
Subject: Re: [PATCH][STABLE 1/3] shadow: Disable email checking completely
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
X-List-Received-Date: Tue, 13 Jul 2010 18:48:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Tue, 2010-07-06 at 13:44, Tom Rini wrote:
> Stefan Schmidt wrote:
> >From: Stefan Schmidt <stefan@buglabs.net>
> >
> >This allows faster login due to not checking for new emails. Adjust PR to 14 as
> >stable is behind .dev here.
> >
> >Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
> 
> Acked-by: Tom Rini <tom_rini@mentor.com>

Thanks. May I could motivate someone else to review and give an ack here. Also
the other patches in this set are out for review as well. :)

regards
Stefan Schmidt


