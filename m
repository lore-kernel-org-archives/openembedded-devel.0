Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1PBVHx-0005OI-FA
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 18:25:17 +0200
Received: from [82.113.106.5] (helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1PBVGJ-0002Lb-3K by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Oct 2010 18:24:35 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1PBVGG-0006Vj-Lg
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 18:23:32 +0200
Date: Thu, 28 Oct 2010 18:23:30 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101028162330.GM3311@excalibur.local>
References: <4CC14738.9070309@nedap.com>
	<20101028062422.GJ3311@excalibur.local>
	<AANLkTim8XTQBvv0vsZ6w4RwFWHDC3cnxa-NAa7BZcZUK@mail.gmail.com>
	<20101028074407.GK3311@excalibur.local>
	<4CC98280.2010706@nedap.com>
MIME-Version: 1.0
In-Reply-To: <4CC98280.2010706@nedap.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,RCVD_IN_SORBS_WEB,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cacaoh: patches to get do_install do its work
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
X-List-Received-Date: Thu, 28 Oct 2010 16:25:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Thu, 2010-10-28 at 16:02, Jaap de Jong wrote:
>
> my initial patch was only intended to show the error I got while
> building openjdk-6 and I hoped to trigger the maintainers to get it
> fixed.
> If this patch has caused any inconvenience to anyone, I apologize for that.

Not a big deal. It broke for me, but thanks to Enricos and Khems hints I was
able to fix it for me. I'm pushing my fix right now. Testing on your setup would
be appreciated.

regards
Stefan Schmidt


