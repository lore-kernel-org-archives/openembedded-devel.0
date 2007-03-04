Received: from [69.17.117.4] (helo=mail2.sea5.speakeasy.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <erik@hovland.org>) id 1HNutb-00036e-3Q
	for openembedded-devel@openembedded.org; Sun, 04 Mar 2007 18:53:19 +0100
Received: (qmail 22120 invoked from network); 4 Mar 2007 17:53:17 -0000
Received: from dsl092-045-201.lax1.dsl.speakeasy.net (HELO speakeasy.net)
	([66.92.45.201]) (envelope-sender <erik@hovland.org>)
	by mail2.sea5.speakeasy.net (qmail-ldap-1.03) with SMTP
	for <openembedded-devel@lists.openembedded.org>;
	4 Mar 2007 17:53:17 -0000
Received: by speakeasy.net (nbSMTP-1.00) for uid 1000
	erik@hovland.org; Sun,  4 Mar 2007 09:53:17 -0800 (PST)
Date: Sun, 4 Mar 2007 09:53:17 -0800
From: Erik Hovland <erik@hovland.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070304175316.GA4152@hovland.org>
References: <3812EAEB-7EFE-40F3-8311-1047D0540BD6@selfish.org>
MIME-Version: 1.0
In-Reply-To: <3812EAEB-7EFE-40F3-8311-1047D0540BD6@selfish.org>
User-Agent: Mutt/1.5.13 (2006-08-11)
Subject: Re: Recent wordpress attacks and md5sum
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Mar 2007 17:53:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 04, 2007 at 05:54:08PM +0100, Holger Freyther wrote:
> PPS: Yeah md5 is cracked, so is the sha family, any other options?

Use sha256sum? NIST strongly encourages users to switch to sha-256 now
until they finish their hash competition.

sha256sum does come with modern versions of coreutils. SHA-256 should
not be compromised yet...

E

-- 
Erik Hovland
mail: erik@hovland.org
web: http://hovland.org/
PGP/GPG public key available on request



