Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1PQhmt-0001BF-1l
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Dec 2010 15:48:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 86FF7917CE4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 09:46:28 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15103-10 for <openembedded-devel@lists.openembedded.org>; 
	Thu,  9 Dec 2010 09:46:28 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 5B203912E23
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Dec 2010 09:46:28 -0500 (EST)
Message-ID: <4D00EBC4.1000006@cbnco.com>
Date: Thu, 09 Dec 2010 09:46:28 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1291817934-20226-1-git-send-email-msmith@cbnco.com>
	<20101209143811.GA31742@excalibur.local>
In-Reply-To: <20101209143811.GA31742@excalibur.local>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] iproute2: upgrade to 2.6.35.1
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
X-List-Received-Date: Thu, 09 Dec 2010 14:48:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Stefan Schmidt wrote:
> Hello.
> 
> On Wed, 2010-12-08 at 09:18, Michael Smith wrote:
>> Upgrade 2.6.35 to 2.6.35.1. The new version fixes "ip route get" and
>> "ip addr flush".
>>
>> Signed-off-by: Michael Smith <msmith@cbnco.com>
> 
> Acked-by: Stefan Schmidt <stefan@datenfreihafen.org>
> 
> Git hint of the day: Use -M for rename detection to make such patches a lot
> smaller and easier to review.

Yes, I'm forever forgetting the -M. Actually, "-M -C -C" is a bit better 
at finding copies. Thanks for the ack.

Mike


