Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id EF50F66007
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 11:13:32 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id n3so4041659wiv.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 04:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Elf3lUheG2yx65TekdzgcPSWB97HOmiCN+JJM3WmgsU=;
	b=Vr2j/wzLrsG2M8qc8kpNA6wIMjAKrOXkh3kX+bgBiTQCVZe8yh98zcmIS8lNJCFmYn
	+20JmlZ1V9DInerfhex/ss1gA/oY+ZErAJy61XKsA9+ncwsHrdBr4DOCM6unpjyCN3KR
	uNC14lU3yazFdLe4ifkte+1017P/eT2Pr5NIvkxS67AI+miCKOwrD21OO/9xub51P5nU
	FnjNfDZImgpjHKa9fKPANoeyA+OKGrA3SZs1K7/5/UoKACzBb3MmV57CF4nNUbZi/oal
	5P26RfyUTJ72Jhd0ADHijkYz84HHgJrSofWpZtX9NfXvZq+MSG6uas6o2a8uNpOX994S
	5ypQ==
X-Gm-Message-State: ALoCoQktz1so8nW5ifwy7mPs9Sl3zJWRDORdpRTd5UL2mXvd5PMwl/4oz2w+HlIc18c6Tm17rIdo
X-Received: by 10.194.89.168 with SMTP id bp8mr27084221wjb.73.1403522009747;
	Mon, 23 Jun 2014 04:13:29 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPSA id ge6sm12081181wic.0.2014.06.23.04.13.28
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 23 Jun 2014 04:13:29 -0700 (PDT)
Message-ID: <53A80BD5.6030208@dresearch-fe.de>
Date: Mon, 23 Jun 2014 13:13:25 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <536A7C42.6030502@balister.org>
	<20140511145337.GE22774@jama>	<20140616134850.GP2428@jama>	<CAP9ODKr8=FnXhWranpckyRrPrHzpfCW-fYLxF4S1o_7sYRMFVA@mail.gmail.com>	<CAOd_LFzTMonJL_17KyR6e-g8U_ByPRakj26n41qEY2-psOevsw@mail.gmail.com>	<CAP9ODKr1QTT++D-iiAwT5LgftiZdmzT34xMM_2dkHF5Ti99KnA@mail.gmail.com>	<CAOd_LFz4ArrStfheb4+KKhwhWPDft5BYjqNk7Y05Ja=oDk+ZSg@mail.gmail.com>	<20140618142125.GJ2117@jama>	<CAOd_LFxAsqciQfwvwmsHxwxSd7=4A27y2-tWqETU0GTBBG2ZGw@mail.gmail.com>	<53A7D3FE.30309@dresearch-fe.de>
	<20140623110143.GB2437@jama>
In-Reply-To: <20140623110143.GB2437@jama>
X-Enigmail-Version: 1.6
Subject: Re: daisy branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Mon, 23 Jun 2014 11:13:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23.06.2014 13:01, Martin Jansa wrote:
> On Mon, Jun 23, 2014 at 09:15:10AM +0200, Steffen Sledz wrote:
>> On 18.06.2014 16:34, Cliff Brake wrote:
>>> On Wed, Jun 18, 2014 at 10:21 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>>>> On Wed, Jun 18, 2014 at 10:04:52AM -0400, Cliff Brake wrote:
>>> 
>>>> 
>>>>> Otavio, Armin, would you like me to add your emails to the maintainer lists in these readme's as well?
>>>> 
>>>> Should I wait 1 more day before merging branch above for possible maintainer additions?
>>> 
>>> Yes, that would be a good idea.  I'll send a pull request tomorrow, or after I hear back from others.
>>> 
>>> If there are other outstanding daisy patches, please let me know.
>>> 
>>> As far as a procedure to merge changes, I propose that initially one of the branch maintainers sends a pull request to the maillist . Another maintainer ack the pull request, and then Martin (or other main branch maintainer) merges and pushes.  This will initially give us a little bit more review.  Eventually we may transition to one of us pushing changes directly after co-maintainer ack. The goal is obviously to keep daisy building and as stable as possible.
>> 
>> Ping!
>> 
>> My live555 patch is still waiting. :(
> 
> I've just merged it, but next time such patch needs to be merged in master first (where it was merged by me on Saturday) and then cherry-picked to release branch.

Great. Thx.

- -- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iEYEARECAAYFAlOoC9UACgkQlSfCk8EgCzgXeACfYz1WFqdiqGd5/ZG+UGklamDN
g9cAoNbUjNyNB68seAE+GahaDee57RFA
=+Dop
-----END PGP SIGNATURE-----

