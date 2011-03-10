Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pxh6r-0000gH-7D
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 15:45:01 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pxh5D-0006Tq-Og from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 06:43:19 -0800
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 10 Mar 2011 06:42:18 -0800
Received: from [172.30.80.238] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Thu, 10 Mar 2011 06:42:17 -0800
Message-ID: <4D78E340.9090403@mentor.com>
Date: Thu, 10 Mar 2011 07:42:08 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <ila904$dhj$1@dough.gmane.org>
In-Reply-To: <ila904$dhj$1@dough.gmane.org>
X-OriginalArrivalTime: 10 Mar 2011 14:42:18.0391 (UTC)
	FILETIME=[5B092A70:01CBDF31]
Subject: Re: [2011.03-maintenance] Pull request
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
X-List-Received-Date: Thu, 10 Mar 2011 14:45:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2011 03:26 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Tom,
>
> Please pull the 3 commits from here:
>
> URI: git://dominion.thruhere.net/var/cache/git/openembedded.git
> Branch: 2011.03-maintenance
>
> Koen Kooi (3):
>        angstrom feed scripts: Upload to the EU mirror by default
>        x-load: fall back to xM when detecting beagleboard revisions
>        xmms: bandaid some more host path leakage
>
> You can view the branch online at
> http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=2011.03-maintenance
>
> The first patch is some housekeeping to have the angstrom autobuilders
> upload to the correct location, a modified backport.
>
> The second patch is to make the new beagleboard xM revision C boot,
> plain cherry-pick from .dev.
>
> And the third patch is to fix -L/usr/lib breakage I noticed when doing a
> build from scratch, plain cherry-pick from .dev.

Applied, thanks.

-- 
Tom Rini
Mentor Graphics Corporation


