Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QYNPG-00016y-Sk
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jun 2011 21:11:39 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id E7E30799014; Sun, 19 Jun 2011 21:08:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.178.21] (dslb-088-071-183-050.pools.arcor-ip.net
	[88.71.183.50]) by gravedo.de (Postfix) with ESMTPSA id 3F0D779900F;
	Sun, 19 Jun 2011 21:08:09 +0200 (CEST)
Message-ID: <4DFE4918.9000800@gravedo.de>
Date: Sun, 19 Jun 2011 21:08:08 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110422 Lightning/1.0b2 Shredder/3.1.11pre
MIME-Version: 1.0
To: Paul Menzel <paulepanter@users.sourceforge.net>
References: <1308477368.18748.7.camel@mattotaupa>
In-Reply-To: <1308477368.18748.7.camel@mattotaupa>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] shiboken: Add `apiextrator-native` to `DEPENDS`
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
X-List-Received-Date: Sun, 19 Jun 2011 19:11:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.06.2011 11:56, Paul Menzel wrote:
> unfortunately I am not able to test this, because of Qt4 build problems [1]. 
> Could you please test this.

I gave this a quick run an I am fine with it. You can put my

Acked-by: Simon Busch <morphis@gravedo.de>

below the commit.

regards,
Simon



