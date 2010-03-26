Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Nv8Cx-0007KB-Kf
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Mar 2010 13:00:17 +0100
Received: from tamarin.localnet (123-192-181-204.dynamic.kbronet.com.tw
	[123.192.181.204])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 1864F1B10C79
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Mar 2010 12:00:56 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Mar 2010 12:56:48 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc8; KDE/4.4.1; i686; ; )
References: <1268826851-28042-1-git-send-email-ospite@studenti.unina.it>
	<201003220816.04657.holger+oe@freyther.de>
	<20100326125222.7c5a7e7f.ospite@studenti.unina.it>
In-Reply-To: <20100326125222.7c5a7e7f.ospite@studenti.unina.it>
MIME-Version: 1.0
Message-Id: <201003261256.48913.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] gnutls: fix do_configure by depending on gtk-doc
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
X-List-Received-Date: Fri, 26 Mar 2010 12:00:17 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

On Friday 26 March 2010 12:52:22 you wrote:

> > gtk-doc? Where is it installing its .m4 file?
> 
> I didn't investigate deeply the details, but with this patch
> gnutls_2.8.5.bb builds again, without this it doesn't and thus prevents
> even meta-toolchain to be built; this is reproducible when starting from
> a fresh setup (wiping out tmp/ I mean). The full log is here:
> http://tinderbox.openembedded.org/public/logs/task/5429228.txt

Okay, then

Acked-by: Holger Hans Peter Freyther <zecke@selfish.org>


