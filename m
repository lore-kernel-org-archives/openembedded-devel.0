Return-Path: <prvs=678e712cc=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id E7B3776F2D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 13:39:45 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqkHAIRY5FWsEApK/2dsb2JhbABehFgGxhwCgW8BAQEBAQGBC0EFg14BAQQyAUUBEAsNCwkWDwkDAgECAUUGDQEFAgKIL8RYAQEBAQEFAQEBAR6GcIR7hQsHF4QVAQSVQY4+hy4XjW+DbIQnb4FIgQUBAQE
X-IPAS-Result: AqkHAIRY5FWsEApK/2dsb2JhbABehFgGxhwCgW8BAQEBAQGBC0EFg14BAQQyAUUBEAsNCwkWDwkDAgECAUUGDQEFAgKIL8RYAQEBAQEFAQEBAR6GcIR7hQsHF4QVAQSVQY4+hy4XjW+DbIQnb4FIgQUBAQE
Message-ID: <55E458FD.9060009@skidata.com>
Date: Mon, 31 Aug 2015 15:39:09 +0200
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1A315F32-74AE-4B3B-A5B7-65A33C5A6BC7@gmail.com>
	<CAP9ODKrwYHeeUdcLCLm6Bsw26V4ypZA-kNDYoX=fA4bx_MYQ0Q@mail.gmail.com>
	<55E006B4.50103@skidata.com>
	<CAP9ODKrJz7h9XpTrJZ-k+3nu-W=eFCb4W=91WH_JivZopb6fCg@mail.gmail.com>
	<55E4035F.6040608@skidata.com>
	<CAP9ODKpz46jb4rEHTu1377uHZVpXUrnndOWHY0DWERQ0F30NEg@mail.gmail.com>
In-Reply-To: <CAP9ODKpz46jb4rEHTu1377uHZVpXUrnndOWHY0DWERQ0F30NEg@mail.gmail.com>
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
X-List-Received-Date: Mon, 31 Aug 2015 13:39:46 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 08/31/2015 03:06 PM, Otavio Salvador wrote:
> On Mon, Aug 31, 2015 at 4:33 AM, Richard Leitner
> <richard.leitner@skidata.com> wrote:
>>> The point is Java is complex and we have few people working on this so
>>> I prefer one well maintained version than 3 oddly ones.
>>
>> I understand that. But currently I have no need for openjdk-8. Therefore
>> my focus is on keeping openjdk-7 up to date.
> 
> Sure.
> 
> Specially if your app works with OpenJDK 8 I see no much benefit in
> keep using the old version. Do you see it differently?
> 

If we have verified that everything is working as expected with
openjdk-8 we will for sure think of updating to it. But as we have a
quite big application stack and long QA/testing phases this may take
some time.
Therefore we will stay (as far as I can currently tell) at least for
another year with openjdk-7.

