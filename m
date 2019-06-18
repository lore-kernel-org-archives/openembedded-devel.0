Return-Path: <sbabic@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 691E66D548
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 09:48:09 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 45Sjtx4mkNz1rbM7;
	Tue, 18 Jun 2019 11:48:09 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 45Sjtx4NcBz1qqkk;
	Tue, 18 Jun 2019 11:48:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id 0eacV21z0MA5; Tue, 18 Jun 2019 11:48:06 +0200 (CEST)
Received: from babic.homelinux.org (host-88-217-136-221.customer.m-online.net
	[88.217.136.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPS;
	Tue, 18 Jun 2019 11:48:06 +0200 (CEST)
Received: from localhost (mail.babic.homelinux.org [127.0.0.1])
	by babic.homelinux.org (Postfix) with ESMTP id C9090454045E;
	Tue, 18 Jun 2019 11:47:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at babic.homelinux.org
Received: from babic.homelinux.org ([IPv6:::1])
	by localhost (mail.babic.homelinux.org [IPv6:::1]) (amavisd-new,
	port 10024)
	with ESMTP id 1N-Otps7Iuas; Tue, 18 Jun 2019 11:47:51 +0200 (CEST)
Received: from [192.168.178.132] (papero.fritz.box [192.168.178.132])
	by babic.homelinux.org (Postfix) with ESMTP id 0C72645402A6;
	Tue, 18 Jun 2019 11:47:49 +0200 (CEST)
To: Khem Raj <raj.khem@gmail.com>, Stefano Babic <sbabic@denx.de>
References: <20190531085447.827-1-sbabic@denx.de>
	<CAMKF1spDK7+JRvnJMkWhA_RqPcZwwZ4_2xoLv=_RcewU+imfag@mail.gmail.com>
From: Stefano Babic <sbabic@denx.de>
Openpgp: preference=signencrypt
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
Message-ID: <9e82e2e5-dffa-49dd-cb9d-a8f3587f8f89@denx.de>
Date: Tue, 18 Jun 2019 11:47:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spDK7+JRvnJMkWhA_RqPcZwwZ4_2xoLv=_RcewU+imfag@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] systat: systemd never enables the service
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
X-List-Received-Date: Tue, 18 Jun 2019 09:48:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit

On 17/06/19 07:44, Khem Raj wrote:
> this is wrong ml for this package, please send this to oe-core ml.

Ouch...thanks Khem, I will repost.

Stefano

> 
> On Fri, May 31, 2019 at 2:04 AM Stefano Babic <sbabic@denx.de> wrote:
>>
>> Even if SYSTEMD_AUTO_ENABLE is set to "enable", the service is never
>> activated by systemd. The cause is the postinst function in the recipe:
>>
>>  pkg_postinst_${PN} () {
>>          if [ -n "$D" ]; then
>>                  exit 0
>>          fi
>>          if [ -e /etc/init.d/populate-volatile.sh ]; then
>>                  /etc/init.d/populate-volatile.sh update
>>          fi
>>  }
>>
>> This generates with activated systemd the following postinst script:
>>
>>         set -e
>>                 if [ -n "$D" ]; then
>>                         exit 0
>>                 fi
>>                 if [ -e /etc/init.d/populate-volatile.sh ]; then
>>                         /etc/init.d/populate-volatile.sh update
>>                 fi
>>         OPTS=""
>>
>>         if [ -n "$D" ]; then
>>             OPTS="--root=$D"
>>         fi
>>
>>         if type systemctl >/dev/null 2>/dev/null; then
>>                 if [ -z "$D" ]; then
>>                         systemctl daemon-reload
>>                 fi
>>
>>                 systemctl $OPTS enable sysstat.service
>>
>>                 if [ -z "$D" -a "enable" = "enable" ]; then
>>                         systemctl --no-block restart sysstat.service
>>                 fi
>>         fi
>>
>> Due to the exit statement, systemctl is never called and the service is
>> never enabled in rootfs.
>> Invert the logic for the check to let run the rest of postinst script.
>>
>> Signed-off-by: Stefano Babic <sbabic@denx.de>
>> ---
>>  meta/recipes-extended/sysstat/sysstat.inc | 11 +++++------
>>  1 file changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
>> index 0bc7e14d36..850a6d1465 100644
>> --- a/meta/recipes-extended/sysstat/sysstat.inc
>> +++ b/meta/recipes-extended/sysstat/sysstat.inc
>> @@ -51,12 +51,11 @@ do_install() {
>>  }
>>
>>  pkg_postinst_${PN} () {
>> -        if [ -n "$D" ]; then
>> -                exit 0
>> -        fi
>> -        if [ -e /etc/init.d/populate-volatile.sh ]; then
>> -                /etc/init.d/populate-volatile.sh update
>> -        fi
>> +       if [  ! -n "$D" ]; then
>> +               if [ -e /etc/init.d/populate-volatile.sh ]; then
>> +                       /etc/init.d/populate-volatile.sh update
>> +               fi
>> +       fi
>>  }
>>
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


-- 
=====================================================================
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-53 Fax: +49-8142-66989-80 Email: sbabic@denx.de
=====================================================================

