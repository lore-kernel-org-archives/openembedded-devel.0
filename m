Return-Path: <prvs=678e712cc=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id ED5AA762B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 07:34:27 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApwEAEYC5FWsEApK/2dsb2JhbABehFgGxhYCgXQBAQEBAQGBC4QjAQEBAwEyAUUBEAsNCwkWDwkDAgECAUUGDQEFAgKIIg3BMAEBAQEBBQEBAQEehnCEe4ULBxeEFQEElUGOPocuF4kmiDWEJ2+BSIEFAQEB
X-IPAS-Result: ApwEAEYC5FWsEApK/2dsb2JhbABehFgGxhYCgXQBAQEBAQGBC4QjAQEBAwEyAUUBEAsNCwkWDwkDAgECAUUGDQEFAgKIIg3BMAEBAQEBBQEBAQEehnCEe4ULBxeEFQEElUGOPocuF4kmiDWEJ2+BSIEFAQEB
Message-ID: <55E4035F.6040608@skidata.com>
Date: Mon, 31 Aug 2015 09:33:51 +0200
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1A315F32-74AE-4B3B-A5B7-65A33C5A6BC7@gmail.com>
	<CAP9ODKrwYHeeUdcLCLm6Bsw26V4ypZA-kNDYoX=fA4bx_MYQ0Q@mail.gmail.com>
	<55E006B4.50103@skidata.com>
	<CAP9ODKrJz7h9XpTrJZ-k+3nu-W=eFCb4W=91WH_JivZopb6fCg@mail.gmail.com>
In-Reply-To: <CAP9ODKrJz7h9XpTrJZ-k+3nu-W=eFCb4W=91WH_JivZopb6fCg@mail.gmail.com>
X-Originating-IP: [172.16.60.30]
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: meta-java - recent commits break foreign (MY!) builds ...
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
X-List-Received-Date: Mon, 31 Aug 2015 07:34:32 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 08/28/2015 04:11 PM, Otavio Salvador wrote:
> On Fri, Aug 28, 2015 at 3:59 AM, Richard Leitner
> <richard.leitner@skidata.com> wrote:
>> I think we should keep (and UPDATE!) openjdk 6 & 7 as long as they get
>> support from RedHat and therefore IcedTea. There may be users relying on
>> the old java version for their long-term-supported products (so do we)!
>>
>> IMHO we should start with openjdk 6: remove the old versions and add the
>> latest (1.13.8)!
>>
>> What do you think? Any comments?
> 
> If you are willing to work on that, I have no problem.

As I mentioned, I will update openjdk-7 as long as I need it. If it's
okay for you I will send patches for these updates to the ml. From a
current point of view it looks like I will provide updates until end of
2016 at least.

> 
> The point is Java is complex and we have few people working on this so
> I prefer one well maintained version than 3 oddly ones.

I understand that. But currently I have no need for openjdk-8. Therefore
my focus is on keeping openjdk-7 up to date.


