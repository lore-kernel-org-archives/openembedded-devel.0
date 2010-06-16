Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OOum9-0000AZ-0c
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 17:44:04 +0200
Received: from p5b0334c5.dip.t-dialin.net ([91.3.52.197] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OOuhb-000230-5g by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jun 2010 17:38:58 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1OOuhY-0002Qd-Jy
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 17:38:52 +0200
Date: Wed, 16 Jun 2010 17:38:51 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100616153851.GE20969@excalibur.local>
References: <1276625727-22991-1-git-send-email-stefan@datenfreihafen.org>
	<1276625727-22991-2-git-send-email-stefan@datenfreihafen.org>
	<hva6if$vtv$1@dough.gmane.org>
	<20100616150958.GC20969@excalibur.local>
	<hvapp0$9vs$1@dough.gmane.org> <4C18ECD5.9040108@mentor.com>
MIME-Version: 1.0
In-Reply-To: <4C18ECD5.9040108@mentor.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH][STABLE 1/4] bug20/xorg.conf: update to use tslib driver for touchscreen input device.
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
X-List-Received-Date: Wed, 16 Jun 2010 15:44:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2010-06-16 at 08:25, Tom Rini wrote:
> Koen Kooi wrote:
> >
> >On 16-06-10 17:09, Stefan Schmidt wrote:
> >>Hello.
> >>
> >>On Wed, 2010-06-16 at 11:46, Koen Kooi wrote:
> >>>On 15-06-10 20:15, Stefan Schmidt wrote:
> >>>>From: Ken Gilmer <ken@buglabs.net>
> >>>>
> >>>>
> >>>>Signed-off-by: Ken Gilmer <ken@buglabs.net>
> >>>>Signed-off-by: Stefan Schmidt <stefan@buglabs.net>
> >>>Acked-by: Koen Kooi <koen@openembedded.org>
> >>Just to make sure I understand the stable process correctly. As this patches
> >>don't touch anything in the core system I'm fine apply them to stable myself
> >>after fetching them with the ACK form patchwork, right?
> >
> >Not quite, you need 2 acks from maintainers of the stable branch (which
> >I think includes Marcin, Denys and me).
> >But given the low impact of these patches and the general stagnation of
> >stable/2009, I think it's safe to apply these.
> 
> My understanding was that it depends on the area.  I didn't ack the
> bug20 specific stuff since that's got a maintainer listed (or am I
> confusing bug boards?) who should ack them.

That would be Marcin. I'm now doing the job at buglabs for bug20 he did for the
earlier bug. I hope he is still around to ACK the patches. :)

regards
Stefan Schmidt


