Received: from hxhsvr03.internetintuitive.net ([80.254.228.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dokuwiki@keylevel.com>) id 1OPMVC-0002bT-6a
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 23:19:58 +0200
Received: from durham.keylevel.com ([109.224.134.115]:64459
	helo=[192.168.1.98])
	by hxhsvr03.internetintuitive.net with esmtpa (Exim 4.69)
	(envelope-from <dokuwiki@keylevel.com>) id 1OPMQr-0001VA-Nm
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 22:15:29 +0100
Message-Id: <4683CECD-A3F3-47B6-B862-AB6D23CEEB48@keylevel.com>
From: Chris Tapp <dokuwiki@keylevel.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1276807186.8606.1.camel@fred.uchi.de>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Thu, 17 Jun 2010 22:15:27 +0100
References: <89BAD49D-B779-4C20-BBC0-F220F8C440AA@keylevel.com>
	<1276807186.8606.1.camel@fred.uchi.de>
X-Mailer: Apple Mail (2.936)
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - hxhsvr03.internetintuitive.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - keylevel.com
X-SA-Exim-Connect-IP: 80.254.228.43
X-SA-Exim-Mail-From: dokuwiki@keylevel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: New user would like some help
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
X-List-Received-Date: Thu, 17 Jun 2010 21:19:58 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed
Content-Transfer-Encoding: 7bit

On 17 Jun 2010, at 21:39, Joerg Eesmann wrote:

> Hi,
> try libsdl, nothing with the suffix -native.
> The native-recipes are not cross-compiled, they will go to the staging
> directory, I think.

Thanks - that seems to have done the trick :-)

Chris



