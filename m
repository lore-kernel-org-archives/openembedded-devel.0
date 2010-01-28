Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1NaSDE-00028v-Mr
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jan 2010 12:07:04 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id B0960110009A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2010 12:04:39 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 40D401100094
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2010 12:04:39 +0100 (CET)
Received: from rhein.familie-heinold.de (f052238210.adsl.alicedsl.de
	[78.52.238.210]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2010 12:04:39 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 880DE3C0C3; Thu, 28 Jan 2010 12:04:38 +0100 (CET)
Date: Thu, 28 Jan 2010 12:04:38 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100128110438.GA18170@rhein.zuhause.netz>
References: <6C2434209962DC46B88345CA85C334A28596C7F9D3@Courier.syntech.org>
	<1264196828.26541.14.camel@mattotaupa.wohnung.familie-menzel.net>
	<6C2434209962DC46B88345CA85C334A28596C7FB21@Courier.syntech.org>
MIME-Version: 1.0
In-Reply-To: <6C2434209962DC46B88345CA85C334A28596C7FB21@Courier.syntech.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 85.214.48.103
X-SA-Exim-Mail-From: heinold@inf.fu-berlin.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Difficulties building java
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
X-List-Received-Date: Thu, 28 Jan 2010 11:07:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 27, 2010 at 04:49:13PM -0500, Mark Butsch wrote:
> I forgot to mention that I am using "stable/2009" branch.

Hm seems stable branch is not in the right shape for java stuff.
> 
> I have been trying different combinations of PREFERRED_PROVIDERS and VERSIONS with no success.
> 
> I searched my openembedded email archive and found someone had a similar error back in June of 2009,
> But there was no solution posted.
> 
> I also found a wiki article that described using the Jalimo-Overlay to build OpenJDK, but I haven't had any
> Success with it either.
> Is the Jalimo-Overlay required to build Java in OE or only in certain cases?

Only the openjdk recipes are left in the jalimo svn all other was merged into dev. So you might need
a checkout before this merge for the stable oe branch to work.
> 
> Still confused,
> 
> Mark

Sorry,

we dont have yet the time to work on the stable branch to get java into shape.

Bye Henning


