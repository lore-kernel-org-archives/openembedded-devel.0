Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1PJRXJ-0004ae-Do
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 15:01:58 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PJRWC-00034l-Or from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 06:00:48 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 19 Nov 2010 06:00:48 -0800
Received: from [172.30.6.141] ([172.30.6.141]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 19 Nov 2010 07:00:47 -0700
Message-ID: <4CE6830D.3080206@mentor.com>
Date: Fri, 19 Nov 2010 07:00:45 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.15) Gecko/20101027 Lightning/1.0b1 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTi=REDDr=0wv9oQDEyUPAYh1KUyDq_p=q0s-0WAy@mail.gmail.com>
	<1290108449-14749-2-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1290108449-14749-2-git-send-email-rep.dot.nop@gmail.com>
X-OriginalArrivalTime: 19 Nov 2010 14:00:47.0577 (UTC)
	FILETIME=[2A8ADC90:01CB87F2]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] e2fsprogs: add 1.41.12, remove old versions
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
X-List-Received-Date: Fri, 19 Nov 2010 14:01:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/2010 12:27 PM, Bernhard Reutner-Fischer wrote:
> Signed-off-by: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>
> ---
>   recipes/e2fsprogs/e2fsprogs_1.41.12.bb |   10 ++++++++++
>   recipes/e2fsprogs/e2fsprogs_1.41.9.bb  |   10 ----------
>   2 files changed, 10 insertions(+), 10 deletions(-)
>   create mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.12.bb
>   delete mode 100644 recipes/e2fsprogs/e2fsprogs_1.41.9.bb

Acked-by: Tom Rini <tom_rini@mentor.com>

-- 
Tom Rini
Mentor Graphics Corporation


