Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1PpbXN-0008UZ-CT
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 08:10:57 +0100
Received: from [2001:638:602:1183:21f:16ff:fe0d:7d41] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1PpbWD-0006QR-Af by authid <stefan@sostec.de> with cram_md5;
	Wed, 16 Feb 2011 08:09:47 +0100
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>)
	id 1PpbW9-0002DF-Si; Wed, 16 Feb 2011 08:09:41 +0100
Date: Wed, 16 Feb 2011 08:09:41 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <20110216070941.GM14931@excalibur.local>
References: <1297825404-20674-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1297825404-20674-1-git-send-email-obi@opendreambox.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] wpa-supplicant-0.7.3: use MACHINE_ARCH
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
X-List-Received-Date: Wed, 16 Feb 2011 07:10:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2011-02-16 at 03:03, Andreas Oberritter wrote:
> * Because of madwifi, wpa-supplicant depends on COMBINED_FEATURES.
>   Thus, PACKAGE_ARCH must be set to MACHINE_ARCH.
> * Use INC_PR and bump it.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> CC: Stefan Schmidt <stefan@datenfreihafen.org>

Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>

regards
Stefan Schmidt


