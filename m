Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 443D16BA1D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Dec 2013 13:45:59 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 996D2F81208; Fri, 13 Dec 2013 06:45:58 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 01E09F81206;
	Fri, 13 Dec 2013 06:45:57 -0700 (MST)
Message-ID: <52AB0F97.7040004@mlbassoc.com>
Date: Fri, 13 Dec 2013 06:45:59 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1386931527-12034-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LbvjK-4j5dDzZuMk=osskjktH8doWfOERpo6BsRsC8m+g@mail.gmail.com>
In-Reply-To: <CAJTo0LbvjK-4j5dDzZuMk=osskjktH8doWfOERpo6BsRsC8m+g@mail.gmail.com>
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
X-List-Received-Date: Fri, 13 Dec 2013 13:46:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2013-12-13 04:14, Burton, Ross wrote:
> On 13 December 2013 10:45, Andreas Müller <schnitzeltony@googlemail.com> wrote:
>> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
>> ---
>>   .../connman/{connman_1.19.bbappend => connman_1.20.bbappend}              | 0
>
> For trivial appends like this you might want to start using bitbake's
> support for wildcards in bbappends.
>
> http://cgit.openembedded.org/bitbake/commit/?id=31bc9af9cd56e7b318924869970e850993fafc5f

Very nice - too bad this (and I'm sure many other innovations) was
not announced (or even discussed as far as I can see), so those of
us on the outside have no clue that they are there...

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

