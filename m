Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1PITKm-0004CE-An
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 22:45:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 35B9B6FD28B;
	Tue, 16 Nov 2010 16:43:56 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18427-02; Tue, 16 Nov 2010 16:43:56 -0500 (EST)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id B48656ED6C6;
	Tue, 16 Nov 2010 16:43:55 -0500 (EST)
Message-ID: <4CE2FAF8.5010808@cbnco.com>
Date: Tue, 16 Nov 2010 16:43:20 -0500
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100228)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, =?ISO-8859-1?Q?Matthias_?=
	=?ISO-8859-1?Q?G=FCnther?= <matgnt@gmail.com>
References: <1289935585-26798-1-git-send-email-msmith@cbnco.com>
	<4CE2F4B4.5000105@mentor.com>
In-Reply-To: <4CE2F4B4.5000105@mentor.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux 2.6.32: update from 2.6.32.9 to 2.6.32.25
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
X-List-Received-Date: Tue, 16 Nov 2010 21:45:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> 
> While I like this conceptually, did you confirm that all of the machines 
> that have additional patches still patch cleanly?

I did not, but should have.

All patches still apply except for eee701 (applied upstream) and 
topas910 (some hunks rejected, some applied upstream).

Matthias, would you be able to rebase your topas910 patch against 2.6.32.25?

Thanks,
Mike


