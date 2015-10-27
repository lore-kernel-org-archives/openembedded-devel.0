Return-Path: <mail@webthatworks.it>
Received: from smtp209.alice.it (smtp209.alice.it [82.57.200.105])
	by mail.openembedded.org (Postfix) with ESMTP id 12AF275CC2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 10:41:05 +0000 (UTC)
Received: from caronte.home.webthatworks.it (87.9.24.221) by smtp209.alice.it
	(8.6.060.28)
	id 55BB67B20CE11A90 for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2015 11:41:00 +0100
Received: from gloom.home.webthatworks.it (gloom.home.webthatworks.it
	[192.168.1.14])
	by caronte.home.webthatworks.it (Postfix) with ESMTP id A93A96FE21C6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 11:40:59 +0100 (CET)
Received: from [IPv6:::1] (localhost [IPv6:::1])
	by gloom.home.webthatworks.it (Postfix) with ESMTP id 8CF765E01FB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 11:40:58 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
References: <562EB36A.1010109@webthatworks.it>
	<CAP71WjyyrqEGtdfN1mzrwaH=YGAC4zdz5QwFH-aSxNzgXr=4JA@mail.gmail.com>
From: Ivan Sergio Borgonovo <mail@webthatworks.it>
Organization: http://www.WebThatWorks.it
Message-ID: <562F54BA.2070905@webthatworks.it>
Date: Tue, 27 Oct 2015 11:40:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAP71WjyyrqEGtdfN1mzrwaH=YGAC4zdz5QwFH-aSxNzgXr=4JA@mail.gmail.com>
Subject: Re: checking if a patch was approved
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
X-List-Received-Date: Tue, 27 Oct 2015 10:41:08 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/2015 08:12 AM, Nicolas Dechesne wrote:
> On Tue, Oct 27, 2015 at 12:12 AM, Ivan Sergio Borgonovo
> <mail@webthatworks.it> wrote:
>> I saw many patch passing by and I submitted a couple about
>> meta-toolchain-qt5.
>> I didn't see any message from Otavio or Martin "approving" a patches.
>>
>> How can I check if it was approved other than pulling from the repo/checking
>> github?
>>
>> Or if there is no place to check... consider this a ping ;)

> all commits are published on
> openembedded-commits@lists.openembedded.org mailing list, and in

thanks, actually my commit was for meta-qt5.
But still I haven't seen any feedback on this mailing list to guess if 
the commit was actually approved or not.

I haven't seen any "approval" feedback even for other commits. Maybe 
because the patches submitted were coming from known developers and the 
assumption is that if there is no request to fix something the patches 
are going to be queued to be committed by default.

I'm really not asking for any special attention, I just would like to 
know what I've to expect and check if I did the right thing and if I've 
to do anything else to see my patch committed.

Martin Jansa actually noticed a first revision of my patch and gave some 
feedback to fix stuff and things have been fixed (hopefully) and I 
submitted a second release.

thanks

-- 
Ivan Sergio Borgonovo
http://www.webthatworks.it


