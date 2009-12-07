Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NHb2H-0007bi-SU for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 11:41:48 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NHb0f-0005BJ-0R
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 11:40:05 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 11:40:04 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Dec 2009 11:40:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 07 Dec 2009 11:39:00 +0100
Message-ID: <hfim04$osr$3@ger.gmane.org>
References: <1260139496-21442-1-git-send-email-leon@sidebranch.com>	<1260139496-21442-2-git-send-email-leon@sidebranch.com>	<1260139496-21442-3-git-send-email-leon@sidebranch.com>	<1260139496-21442-4-git-send-email-leon@sidebranch.com>	<1260139496-21442-5-git-send-email-leon@sidebranch.com>
	<1260139496-21442-6-git-send-email-leon@sidebranch.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <1260139496-21442-6-git-send-email-leon@sidebranch.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] binutils{, -cross}_nios2-2.15.bb: binutils for nios2.
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
X-List-Received-Date: Mon, 07 Dec 2009 10:41:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06-12-09 23:44, Leon Woestenberg wrote:
> This is from a non-upstream GIT'd fork of binutils, community
> maintained, as nios2 was never brought upstream into binutils.
>
> Tested-by: Walter Goossens<walter.goossens@axon.tv>
> Tested-by: Leon Woestenberg<leon@sidebranch.com>
> Signed-off-by: Leon Woestenberg<leon@sidebranch.com>
> ---
>   recipes/binutils/binutils-cross_nios2-2.15.bb |    8 +++++++
>   recipes/binutils/binutils_nios2-2.15.bb       |   26 +++++++++++++++++++++++++


That's bogus. Change that to 2.15-nios2 or put nios2 in PR, but don't 
screw up binutils versioning.

regards,

Koen



