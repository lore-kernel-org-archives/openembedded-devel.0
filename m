Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1OMOaz-0002UU-7S
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 18:57:42 +0200
Received: (qmail 21508 invoked by uid 1003); 9 Jun 2010 16:53:17 -0000
Received: from localhost (HELO ?192.168.182.227?)
	(philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 9 Jun 2010 16:53:17 -0000
Message-ID: <4C0FC6F6.1050105@balister.org>
Date: Wed, 09 Jun 2010 12:53:10 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-3.fc13 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C0F9119.3000909@freyther.de>	<AANLkTikJJyDSd62eVkxlmfpjI7MgxhElzou8Kec2zcqQ@mail.gmail.com>
	<AANLkTinL7xDvSoHdsxgkSumCFQNg8r3YC30gJUBcA-jO@mail.gmail.com>
In-Reply-To: <AANLkTinL7xDvSoHdsxgkSumCFQNg8r3YC30gJUBcA-jO@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Meetings for the meeting of June
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
X-List-Received-Date: Wed, 09 Jun 2010 16:57:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2010 10:57 AM, Chris Larson wrote:
> On Wed, Jun 9, 2010 at 6:53 AM, Frans Meulenbroeks<
> fransmeulenbroeks@gmail.com>  wrote:
>
>> 2010/6/9 Holger Freyther<holger+oe@freyther.de<holger%2Boe@freyther.de>
>>> :
>>> We were carrying the org.openembedd.dev branch name from the monotone
>>> era into the git era and the TSC was asked to consider renaming it to
>>> 'master' which is the git default for the main development tree. Now the
>>> actual change on the server will be minor what is of a bigger concern
>>> are the existing users and documentation.
>>
>> Technically speaking I think we should have run an RFC for this before
>> it was brought to the table of the TSC.
>>
>> Personally the org.openembedded.dev branch name does not bother me
>> although I know master is the 'standard' git name.
>> Afaik renaming does not really solve a problem.
>>
>
> Personally, I have to type it at least a few times a day, it gets old, and I
> think its time we ditched monotone remnants where we're able to do so.

I'm with Chris. The name is long and annoying. It is time to drop the 
monotone/bitkeeper remnants.

Philip

>
> I am not too sure how much this affects the current users. Actually I
>> doubt if the change is bigger than the packages ->  recipes renaming
>> Isse is that if we do that we should make sure all relevant
>> documentation is updated, otherwise we only create confusion (which
>> might still creep up as people use old mailing list articles).
>>
>> Considering this, I am in favour of keeping things as they are.
>
>
> If we implement this, I don't really see a problem doing it for the users:
>
>
>>   >   c.) To ease this for existing users and to reduce the amount of
>>>       support org.openembedded.dev will track master and remains
>>>       available for a limited but long amount of time.
>>


