Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1Mbwk0-0000M1-52
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Aug 2009 15:22:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id ED43553B8FA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2009 09:06:05 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11590-08 for <openembedded-devel@lists.openembedded.org>; 
	Fri, 14 Aug 2009 09:06:05 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 9927A53B825
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Aug 2009 09:06:05 -0400 (EDT)
Message-ID: <4A85613D.6050108@cbnco.com>
Date: Fri, 14 Aug 2009 09:06:05 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1250175641-4869-1-git-send-email-msmith@cbnco.com>	<1250175641-4869-2-git-send-email-msmith@cbnco.com>
	<20090813154310.GB8906@gmail.com>
In-Reply-To: <20090813154310.GB8906@gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH 2/4] gcc: fix libstdc/libgcc packaging on x86_64
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
X-List-Received-Date: Fri, 14 Aug 2009 13:22:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On (13/08/09 11:00), Michael Smith wrote:
 >> Bump INC_PR for recent gccs (4.3.3, 4.4.1). Hopefully no one is using
 >> older gcc for x86_64.

> this one looks ok. you need to install same for 4.3.4 atleast.

OK, I'll bump PR for 4.1.2, 4.2.[34], 4.3.[34], 4.4.1 in the next patch ver.

Mike


