Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1Me6eo-0006LJ-Do
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 14:22:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 6FB7252D452
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 08:05:01 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10302-03 for <openembedded-devel@lists.openembedded.org>; 
	Thu, 20 Aug 2009 08:05:01 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 39E7251E590
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 08:05:01 -0400 (EDT)
Date: Thu, 20 Aug 2009 08:05:01 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1250738680-20274-5-git-send-email-clarson@mvista.com>
Message-ID: <Pine.LNX.4.64.0908200804480.3621@juice.ott.cti.com>
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
	<1250738680-20274-2-git-send-email-clarson@mvista.com>
	<1250738680-20274-3-git-send-email-clarson@mvista.com>
	<1250738680-20274-4-git-send-email-clarson@mvista.com>
	<1250738680-20274-5-git-send-email-clarson@mvista.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] kernel.bbclass: Install & package symvers as /boot/Module.symvers-<ver>.
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
X-List-Received-Date: Thu, 20 Aug 2009 12:22:19 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 19 Aug 2009, Chris Larson wrote:

> Signed-off-by: Chris Larson <clarson@mvista.com>
> ---
>  classes/kernel.bbclass |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)

Acked-by: Michael Smith <msmith@cbnco.com>


