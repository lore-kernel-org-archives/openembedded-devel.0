Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Pnu6R-0002e0-Az
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 15:36:07 +0100
Received: from p5b035f5a.dip.t-dialin.net ([91.3.95.90] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Pnu5J-0006Zv-7j by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 15:34:59 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1Pnu5I-0004kS-Rr
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 15:34:56 +0100
Date: Fri, 11 Feb 2011 15:34:56 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110211143456.GH9652@excalibur.local>
References: <1297429080-3986-1-git-send-email-obi@opendreambox.org>
	<1297429080-3986-2-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1297429080-3986-2-git-send-email-obi@opendreambox.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Subject: Re: [PATCH 2/5] wpa-supplicant-0.7.3: rename defconfig-gnutls to defconfig
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
X-List-Received-Date: Fri, 11 Feb 2011 14:36:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Fri, 2011-02-11 at 12:57, Andreas Oberritter wrote:
> * Use a more useful name for overrides in case gnutls is not to be used.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  .../wpa-supplicant/wpa-supplicant-0.7.3/defconfig  |  409 ++++++++++++++++++++
>  .../wpa-supplicant-0.7.3/defconfig-gnutls          |  409 --------------------
>  recipes/wpa-supplicant/wpa-supplicant-0.7.inc      |    4 +-
>  3 files changed, 411 insertions(+), 411 deletions(-)
>  create mode 100644 recipes/wpa-supplicant/wpa-supplicant-0.7.3/defconfig
>  delete mode 100644 recipes/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls

Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>

regards
Stefan Schmidt


