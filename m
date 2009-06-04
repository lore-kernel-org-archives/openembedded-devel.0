Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MCGct-00079P-IX
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jun 2009 19:21:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 1C615310886
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2009 13:12:11 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 00488-10 for <openembedded-devel@lists.openembedded.org>; 
	Thu,  4 Jun 2009 13:12:11 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id F27EC308226
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2009 13:12:10 -0400 (EDT)
Message-ID: <4A28006A.3090003@cbnco.com>
Date: Thu, 04 Jun 2009 13:12:10 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.21 (X11/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
	<h08u4t$oui$1@ger.gmane.org>
In-Reply-To: <h08u4t$oui$1@ger.gmane.org>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: Set of patches for stable/2009
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
X-List-Received-Date: Thu, 04 Jun 2009 17:21:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> On 04-06-09 18:38, Marcin Juszkiewicz wrote:

> patch 98 is broken 'vim' doesn't exist, '/usr/bin/vim' does.

Hey yeah. I screwed that up; my prefix is "" not "/usr" so it worked for 
me anyway. I'll fix that for dev. (patch # is actually 86 in Marcin's list)

Mike


