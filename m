Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1ObCbJ-00073T-6b
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 15:11:28 +0200
Received: (qmail 10405 invoked by uid 1003); 20 Jul 2010 13:11:00 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 20 Jul 2010 13:10:59 -0000
Message-ID: <4C45A062.6080606@balister.org>
Date: Tue, 20 Jul 2010 09:10:58 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100709204055.GA12163@excalibur.local>	<20100720070108.GE1512@excalibur.local>	<i23lkm$ftn$1@dough.gmane.org>
	<20100720084026.GI1512@excalibur.local>
In-Reply-To: <20100720084026.GI1512@excalibur.local>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] New stable branch (and maybe a new process?)
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
X-List-Received-Date: Tue, 20 Jul 2010 13:11:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/20/2010 04:40 AM, Stefan Schmidt wrote:
> Hello.
>
> On Tue, 2010-07-20 at 10:09, Koen Kooi wrote:
>> On 20-07-10 09:01, Stefan Schmidt wrote:
>>>
>>>  From the silence on this topic I gather that the interest to create a new branch
>>> or change the process is quite low.
>>
>> I have an interest in a new stable branch, but no interest in changing
>> the process.
>
> Fair enough. Lets handle the issues seperately for now.
>
>> The biggest problem is the .dev is halfway into big changes, e.g.
>> halfway into new-style staging,
>
> Agreed. While I think we are more then halfway through with this. Recipes are
> left but most of the active maintained are already done. NO numbers but my
> feeling here.
>
>> halfway into packaged-staging rework, halfway into nativesdk, etc.
>
> These both are ongoing for quite some time already. I have to admit that I lost
> track where they stand and what is still outstanding.
>
> So your suggestion is to wait until all three are done?

We should identify the work in progress in dev and decide which ones we 
should finish before creating a new staging. There is no sense making a 
new stable branch and then creating a major diversion from dev that will 
make maintaining both in parallel for as long as possible difficult.

Philip


