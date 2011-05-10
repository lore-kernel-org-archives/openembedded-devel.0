Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msmith@cbnco.com>) id 1QJph2-0005gC-FQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 May 2011 18:21:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 89725BE132C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 12:19:08 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25213-03 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 10 May 2011 12:19:08 -0400 (EDT)
Received: from [10.196.38.216] (unknown [74.198.164.88])
	by smtp.cbnco.com (Postfix) with ESMTPSA id DF040BC6D3A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 May 2011 12:19:07 -0400 (EDT)
Date: Tue, 10 May 2011 12:18:59 -0400
From: "Michael Smith" <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Mailer: LCG ProfiMail
Message-ID: <7005620369.989497139@cbnco.com>
References: <4DC8F3A2.2090005@nedap.com> <20110510100020.GA10493@mx.loc>
	<1305022004.8000.149.camel@phil-desktop>
	<20110510161532.GB10493@mx.loc>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: x86_64
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
X-List-Received-Date: Tue, 10 May 2011 16:21:52 -0000
Content-Type: text/plain; charset=utf-8; format=flowed

------- Original message -------
> From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> On Tue, May 10, 2011 at 11:06:44AM +0100, Phil Blundell wrote:
>>
>>"x86_64" seems to be what's currently used as the architecture name.  If
>
> That doesn't work as arch-dependent e.g. append, does it.
>
> FOO_append_x86_64 = '-mcpu=barcelona'

I believe it does work.

Mike 


