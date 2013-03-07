Received: from mail-ve0-f177.google.com ([209.85.128.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UDce1-0000Cr-GX
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 16:22:14 +0100
Received: by mail-ve0-f177.google.com with SMTP id m1so436597ves.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 07:05:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=DzAwr8k+aTcSxTZzjhDm1vm+OgBCARmueneM0zTeMz8=;
	b=dinh6imtj6WvWcGXdfUhMv+7GyoWMge2v9yAJtjxIDDEk1TG4Y7S+D993LvrYC2lpj
	pRDF5jPSCj93VxeadSeIIe07EuCY6Sk2AEe48yRJnMuW1CK7qMstv9WVqocUprngMvs7
	o6G2uAuuaV8xQ+3Bb0foBN6Yto8kEMtEHoaQL3pj19ATsZAR9/WCog8xMfBmN4SV/y6T
	AIRZ8C/570Dnjse3TMrwGTx8RLIHvTu6a9fTvWbx7HwUbsg857bwKdRa++oivTKYXdQq
	E7eE12Q39w+ZlwRR3a8iyGgsFNMdaYO9nqjBp4P2AV4DO4XsSz0JQaJm3WtDTYmSsuDS
	0pPw==
X-Received: by 10.58.94.234 with SMTP id df10mr13204844veb.4.1362668737013;
	Thu, 07 Mar 2013 07:05:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Thu, 7 Mar 2013 07:05:16 -0800 (PST)
In-Reply-To: <5138A92D.5030809@balister.org>
References: <1362649839-9160-1-git-send-email-koen@dominion.thruhere.net>
	<20130307130435.GI32228@jama.dyndns-home.com>
	<E780D109-3D15-488F-8CC9-F6829BEE90F1@dominion.thruhere.net>
	<9088096.rvOOlWx1VE@helios>
	<CAP9ODKp1bpin38S3QHaR1s47B9gSxmoMUckWY=NpS_FtB0rVYg@mail.gmail.com>
	<5138A92D.5030809@balister.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Mar 2013 15:05:16 +0000
Message-ID: <CAJTo0LbnE7DjdJL=9=LDA3kpxhAADJONAu-4Xdwohcno__xXcA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkKmFiZHUA1ippOEsc1lXDMGwHFE3GchhyaBtzw67Xp2LQ4vWTvQ/JWRb/w7jjFZiHBWTZi
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-kde][PATCH 3/3] README: update contributor list
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
X-List-Received-Date: Thu, 07 Mar 2013 15:22:16 -0000
Content-Type: text/plain; charset=UTF-8

On 7 March 2013 14:50, Philip Balister <philip@balister.org> wrote:
>> For me, codenames work fine but for users it is sometimes confusing as
>> the website and marketing people talk about Yocto 1.3 or 1.4 while the
>> involved people talk about codenames. So I find myself explaining it
>> over and over again.
>
> Add me to the list of people that find codenames confusing. I can't
> reliably list releases in order by name.

We really need a table on the wiki page listing all of them - I can
easily remember the current/previous/next names but after that I don't
remember them.

Ross


