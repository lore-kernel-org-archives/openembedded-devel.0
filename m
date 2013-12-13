Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3596E6BA1D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2013 13:57:22 +0000 (UTC)
Message-ID: <52AB1242.1030409@communistcode.co.uk>
Date: Fri, 13 Dec 2013 13:57:22 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1386931527-12034-1-git-send-email-schnitzeltony@googlemail.com>	<CAJTo0LbvjK-4j5dDzZuMk=osskjktH8doWfOERpo6BsRsC8m+g@mail.gmail.com>
	<52AB0F97.7040004@mlbassoc.com>
In-Reply-To: <52AB0F97.7040004@mlbassoc.com>
Subject: Re: [meta-systemd] connman: follow oe-core to 1.20
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Dec 2013 13:57:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/12/13 13:45, Gary Thomas wrote:
> On 2013-12-13 04:14, Burton, Ross wrote:
>> On 13 December 2013 10:45, Andreas Müller
>> <schnitzeltony@googlemail.com> wrote:
>>> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
>>> ---
>>>   .../connman/{connman_1.19.bbappend =>
>>> connman_1.20.bbappend}              | 0
>>
>> For trivial appends like this you might want to start using bitbake's
>> support for wildcards in bbappends.
>>
>> http://cgit.openembedded.org/bitbake/commit/?id=31bc9af9cd56e7b318924869970e850993fafc5f
>>
> 
> Very nice - too bad this (and I'm sure many other innovations) was
> not announced (or even discussed as far as I can see), so those of
> us on the outside have no clue that they are there...
> 

This one went to the bitbake devel list, if you follow that list then
you can keep an eye on bitbake improvements.

http://patchwork.openembedded.org/patch/62171/


-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 

