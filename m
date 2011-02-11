Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Pnu5p-0006qA-Q8
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 15:35:33 +0100
Received: from p5b035f5a.dip.t-dialin.net ([91.3.95.90] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Pnu4h-0006Zm-LA by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 15:34:26 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1Pnu4h-0004kM-6j
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 15:34:19 +0100
Date: Fri, 11 Feb 2011 15:34:19 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110211143419.GG9652@excalibur.local>
References: <1297429080-3986-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1297429080-3986-1-git-send-email-obi@opendreambox.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Subject: Re: [PATCH 1/5] wpa-supplicant-0.7.3: remove unused files
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
X-List-Received-Date: Fri, 11 Feb 2011 14:35:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Fri, 2011-02-11 at 12:57, Andreas Oberritter wrote:
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
>  .../wpa-supplicant/wpa-supplicant-0.7.3/defconfig  |  157 ----------------
>  .../wpa-supplicant/wpa-supplicant-0.7.3/init.sh    |   50 ------
>  .../wpa_supplicant-0.5.7-always-scan.patch         |   12 --
>  ...a_supplicant-fix-deprecated-dbus-function.patch |  187 --------------------
>  .../wpa_supplicant_default.conf                    |   13 --
>  5 files changed, 0 insertions(+), 419 deletions(-)
>  delete mode 100644 recipes/wpa-supplicant/wpa-supplicant-0.7.3/defconfig
>  delete mode 100644 recipes/wpa-supplicant/wpa-supplicant-0.7.3/init.sh
>  delete mode 100644 recipes/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-0.5.7-always-scan.patch
>  delete mode 100644 recipes/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant-fix-deprecated-dbus-function.patch
>  delete mode 100644 recipes/wpa-supplicant/wpa-supplicant-0.7.3/wpa_supplicant_default.conf

Thanks for cleaning this up.

Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>

regards
Stefan Schmidt


