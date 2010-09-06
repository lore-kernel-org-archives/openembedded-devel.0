Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1OseXb-0001BC-03
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 18:27:31 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id B0524275D105; Mon,  6 Sep 2010 18:26:53 +0200 (CEST)
Received: from [192.168.1.142] (p5489D4B7.dip.t-dialin.net [84.137.212.183])
	by gravedo.de (Postfix) with ESMTPSA id 3007C275CCC2
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Sep 2010 18:26:52 +0200 (CEST)
Message-ID: <4C85164B.4050704@gravedo.de>
Date: Mon, 06 Sep 2010 18:26:51 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.9) Gecko/20100903 Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinxEPBjSeAwF+MWJB-tyX1WMoeW+oMCUR84EKZg@mail.gmail.com>
In-Reply-To: <AANLkTinxEPBjSeAwF+MWJB-tyX1WMoeW+oMCUR84EKZg@mail.gmail.com>
X-Enigmail-Version: 1.1.2
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] xserver-xorg-conf/palmpre/xorg.conf
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
X-List-Received-Date: Mon, 06 Sep 2010 16:27:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06.09.2010 17:57, Peter Klassen wrote:
> Hey devs,
> 
> attached to this mail you will find a pathch for xorg-conf
> to support palm pre.
> This is my very first patch ever, so I hope I havent't build in any
> faux pas
> 
> best
> Peter

You should change the commit line to something like "xserver-xorg-conf:
add xorg.conf for palmpre machine" to indicate which recipe your are
changing with this patch. If you change this detail:
Acked-by: Simon Busch <morphis@gravedo.de>

regards,
morphis


