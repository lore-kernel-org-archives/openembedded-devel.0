Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PKX4w-0005Fk-6t
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 15:09:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id A94D3314AEC8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 15:07:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id A5f0tuSrGts7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 15:07:52 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id AFA42314A8FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 15:07:52 +0100 (CET)
Message-ID: <4CEA7937.2070005@opendreambox.org>
Date: Mon, 22 Nov 2010 15:07:51 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1290383951-6683-1-git-send-email-obi@opendreambox.org>
	<AANLkTinS-eXbu8JVq-eAt5+x=yu_rWZHRHSLJ4J3pCSt@mail.gmail.com>
In-Reply-To: <AANLkTinS-eXbu8JVq-eAt5+x=yu_rWZHRHSLJ4J3pCSt@mail.gmail.com>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] gtk+-1.2: convert to new style staging (fixes xmms build)
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
X-List-Received-Date: Mon, 22 Nov 2010 14:10:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/22/2010 07:27 AM, Khem Raj wrote:
> On Sun, Nov 21, 2010 at 3:59 PM, Andreas Oberritter
> <obi@opendreambox.org> wrote:
>> * gtk+-1.2 didn't install its pkg-config file, but gtk-config
>>  depended on it and went crazy without it. xmms uses gtk-config.
>>
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> Tested-by: Yury Bushmelev <jay4mail@gmail.com>
> 
> while you are at it can you fix the license field to be more
> precise too ?

COPYING says LGPLv2, which could also mean LGPLv2+. Since I personally
don't care which of both it is, I won't read the detailed license text
and source code. Therefore no patch wrt. the license field.

> You dont have to resend the patch for review
> thanks for nailing it down
> 
> Acked-by: Khem Raj <raj.khem@gmail.com>

Please apply the patches. My SSH key still hasn't been activated.

Regards,
Andreas


