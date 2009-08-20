Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1Me6e8-0000mX-85
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 14:21:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 099A5542F47
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 08:04:19 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10012-08 for <openembedded-devel@lists.openembedded.org>; 
	Thu, 20 Aug 2009 08:04:18 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id D26E4542159
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 08:04:18 -0400 (EDT)
Date: Thu, 20 Aug 2009 08:04:18 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1250738680-20274-1-git-send-email-clarson@mvista.com>
Message-ID: <Pine.LNX.4.64.0908200802190.3621@juice.ott.cti.com>
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] cross.bbclass: keep TARGET_SYS & TARGET_PREFIX independent.
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
X-List-Received-Date: Thu, 20 Aug 2009 12:21:36 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 19 Aug 2009, Chris Larson wrote:

> Signed-off-by: Chris Larson <clarson@mvista.com>
> ---
>  classes/cross.bbclass |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)

Hi Chris,

Can you explain for a crosscompile noob -- when would TARGET_PREFIX != 
${TARGET_SYS}-? I understand they're separate variables so they COULD be 
different; just wondering why someone would set them that way.

Thanks,
Mike


