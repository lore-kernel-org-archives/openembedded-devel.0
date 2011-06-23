Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QZpe1-0005A0-Tv
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Jun 2011 21:32:54 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 5C44015E0002; Thu, 23 Jun 2011 21:29:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.178.21] (dslb-088-070-150-144.pools.arcor-ip.net
	[88.70.150.144])
	by gravedo.de (Postfix) with ESMTPSA id ABECD15E0001;
	Thu, 23 Jun 2011 21:29:19 +0200 (CEST)
Message-ID: <4E03940E.2070107@gravedo.de>
Date: Thu, 23 Jun 2011 21:29:18 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110422 Lightning/1.0b2 Shredder/3.1.11pre
MIME-Version: 1.0
To: Paul Menzel <paulepanter@users.sourceforge.net>
References: <1308783078.21159.17.camel@mattotaupa>
In-Reply-To: <1308783078.21159.17.camel@mattotaupa>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: libfso-qt-embedded: Do not override `DEPENDS`
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
X-List-Received-Date: Thu, 23 Jun 2011 19:32:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.06.2011 00:51, Paul Menzel wrote:
> Date: Wed, 22 Jun 2011 23:41:38 +0200
> 
> Using `=` instead of `+=` overrides the dependencies declared in `libfso-qt.inc`.

Thanks Paul for spotting this! Feel free to put my

Acked-by: Simon Busch <morphis@gravedo.de>

below the patch and push it!

regards,
Simon



