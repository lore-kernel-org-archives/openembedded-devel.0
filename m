Return-Path: <sbabic@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 61CBB7FC8B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 15:22:25 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 47Wn4L147cz1rjXn;
	Mon,  9 Dec 2019 16:22:26 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 47Wn4L0BJlz1rh9x;
	Mon,  9 Dec 2019 16:22:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id OhwYdm7yunXS; Mon,  9 Dec 2019 16:22:24 +0100 (CET)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Mon,  9 Dec 2019 16:22:24 +0100 (CET)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id 45FCE4540415;
	Mon,  9 Dec 2019 16:22:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([IPv6:::1])
	by localhost (mail.babic.homelinux.org [IPv6:::1]) (amavisd-new,
	port 10024)
	with ESMTP id NpcfVDTdLBas; Mon,  9 Dec 2019 16:22:21 +0100 (CET)
Received: from [192.168.178.132] (papero.fritz.box [192.168.178.132])
	by babic.homelinux.org (Postfix) with ESMTP id 5720D45400CA;
	Mon,  9 Dec 2019 16:22:21 +0100 (CET)
To: Adrian Bunk <bunk@stusta.de>, Stefano Babic <sbabic@denx.de>
References: <20191209144601.21938-1-brgl@bgdev.pl>
	<c8092805-82d6-9cbf-83de-d7a8b8bc0062@denx.de>
	<20191209151451.GC5701@localhost>
From: Stefano Babic <sbabic@denx.de>
Autocrypt: addr=sbabic@denx.de; prefer-encrypt=mutual; keydata=
	xsDiBEfdB5IRBADkpYcnh2BoAkGD5p186ysEkWlcp5DU07m7BKzvkEMRhFjeFUOU0klKNmh0
	ZM6rKpYpAYPYBm9YahMyqvj9DmLrZ4yfJ5MssvW9SRETmHpva+h1rN+DzmEcwrqZmLG1JWGy
	LA5ruJaFSzxJHBoROoog1NDMbNDB8A9F7VKrePfkVwCgmODpW/uh2IuMYLVidzDeuvo7alED
	/iV8rwU7C+eBcKy2htuDsEmsqlkBxIDM7IO6h5XxdyqbZOYizuBP3Ksb6xK54weEaB5aQs7S
	8N9Soi0p1Xh0LMWj6PBCzTC4LF+OCGEMBPc6bBHNzivChgztJlUMioCDSVpOXB/QpBaK302G
	yP5WdmcB1Jn6neq/YRlxHN38MV2yA/46jnzeUotL9LliVZKA/ql4GmyWg2Ae1BUiCqEJQNwl
	knGJOmIS4uABLArB5HjsfDU5hA9FORaNGCIiZlezBkZ3JXA2uQMQhfgqBXrZt4j1fcw9I7E+
	7IZ2kSCeTPZFLd5FiGQPDOm3Z9eHrpK6pmBGMeBG0pDgUEbN9awyLNBLj80eU3RlZmFubyBC
	YWJpYyA8c2JhYmljQGRlbnguZGU+wmMEExECACMCGwMGCwkIBwMCBBUCCAMEFgIDAQIeAQIX
	gAUCT9deSgIZAQAKCRD09WXkmmjvppF1AKCRl8d49K4yxWzdBVRTTWG55cyo/gCfRD1RAttl
	R1ofs2wGLHNtXousyL3OwU0ER90HmBAIAIFfX4bKnOmCyB3nPh+jbXZuBSMZTuyDEnguRxl5
	N8Q0ayofQwucCBjXYv65sQ9Rq6FNhEnWqUZBu8A5CwvSakOFOGNC5ta/8VxVRLh0Z0ZTgEep
	SKiPonJyacCbmgWDECdVrKowV7QB9be3Wu67uAZ74rPw2Kd7f0FKnL3djvVRMaBWFIpyQ6SE
	bGOCJjhRQ5L1pIM1Soko+reU7eO+1g6IBw6YkFJisdQE6fzTwaSqUKPPsQLz/W03invQltOb
	Eg7ZwtFs0DFonr1DMm57ksiEhW6SN1wylRO/JzRYG1Qe7u1EVln6iV3ilBvbbfkyRssk4/0e
	kicpSnQknA72YOMAAwYH+QGpAiQ4hAMHrp1bUrtyGXYdeQpYufIZAM4etOnBy/G+e1nfu6y+
	jH4SN9sVK7bwBBAbhEJqkqR5LVsFIRapThJQOWB11rQxLpwkBU9wao/pRM+o95ujGo32WUzf
	wWrzWrkTDy7vMCZuUOLVi4n1GZlUAwpG4rzb6UxPC6GWymkVWGgXp1NC58og5i3Y+rKT7+Xi
	XT2BtvC6PDepoH4JhD+9OkHQO6UfTxPSmtgNbTgtl6L6tj+bm5dOHgkPJFMkEiG8qhUZYQzb
	bYz37orRbA72M2bxK76e9QKn0mVu+d/YCd8wRcvvJbGsozpzcxPvD5Wy5RNJCES8McPtAseU
	tMfCSQQYEQIACQUCR90HmAIbDAAKCRD09WXkmmjvpv+3AJ9RakBsH1j0X/Kxp6t2lf0VUfS2
	qACfZ+J6ktk8PKNuyHf0J/I0mbCrhV4=
Message-ID: <e2b8239f-8d8e-c200-c072-eaa69c819f7e@denx.de>
Date: Mon, 9 Dec 2019 16:22:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191209151451.GC5701@localhost>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] librsync: new package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Dec 2019 15:22:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit

On 09/12/19 16:14, Adrian Bunk wrote:
> On Mon, Dec 09, 2019 at 03:53:33PM +0100, Stefano Babic wrote:
>> ...
>> Don't you have any depends from zlib / bzip ? cmake tests it, if you do
>> not add it, build will be fine but without support.
>> ...
> 
> Is it also working for you?
> https://github.com/librsync/librsync/blob/master/CMakeLists.txt#L53-L57
> https://github.com/librsync/librsync/issues/8

Oh, good catch, I was not aware of it. I guess not, because I saw the
dependencies when I wrote the recipe, but I *never* set ENABLE_COMPRESSION..

Stefano


-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

