Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1P9CjP-0004p1-K4
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 10:12:14 +0200
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Fri, 22 Oct 2010 10:11:30 +0200
X-TM-IMSS-Message-ID: <1abf0bee00008b7f@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.0) id 1abf0bee00008b7f for
	<jaap.dejong@nedap.com>; Fri, 22 Oct 2010 10:11:32 +0100
Message-ID: <4CC14731.7070309@nedap.com>
Date: Fri, 22 Oct 2010 10:11:29 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.11) Gecko/20101006 Lightning/1.0b2 Thunderbird/3.1.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CC04756.2020004@nedap.com> <4CC13039.4020002@nedap.com>
	<20101022064239.GB3527@jama>
In-Reply-To: <20101022064239.GB3527@jama>
X-OriginalArrivalTime: 22 Oct 2010 08:11:30.0056 (UTC)
	FILETIME=[BB51F080:01CB71C0]
X-SA-Exim-Connect-IP: 213.160.213.92
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: failure building cacaoh-native
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
X-List-Received-Date: Fri, 22 Oct 2010 08:12:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm using libtool-2.4
The patch for cacaoh in a separate email.


On 10/22/2010 08:42 AM, Martin Jansa wrote:
> On Fri, Oct 22, 2010 at 08:33:29AM +0200, Jaap de Jong wrote:
>> The same applies for cacaoh-openjdk-native.inc and probably also for
>> cacaoh-cldc-native_0.98.bb
>> Patch will be:
> Can you send it as proper patch? Also please for previous cacaoh-native
> patch.
>
> http://wiki.openembedded.net/index.php/How_to_submit_a_patch_for_dummies
>
> BTW: are you using libtool-2.4 or old libtool-2.2.6b? Because I
> see this only since using libtool-2.4 and someone should check that this
> patch wont break build for people using 2.2.6b.
>
> Regards,
>


