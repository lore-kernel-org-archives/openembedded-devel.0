Return-Path: <pirobk@gmail.com>
Received: from mail-bk0-f53.google.com (mail-bk0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id A62CA65E80
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 15:07:28 +0000 (UTC)
Received: by mail-bk0-f53.google.com with SMTP id r7so3085096bkg.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Apr 2014 08:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=M9xgU2sSiKwsVm1bw4dIpk3RwSn3sbU3AMpxRzeRAHI=;
	b=f8lAYVDshBApjCp0AEfMR3DMZfCdQzP1oUh0c3jM7r1nx6Uwv5Uy2eL5TdmU5qgoAd
	qkpOgjs5P/LqHy3YHwp0/GC8QpFDmayveK3REn7ehHJ0JliiY7/flqPjHmlnfmoimXfk
	1DpuMMlETOzNsGCs9mWTG0sfyGBz/oaZKE3LNyddHd4e6vPVbnmtkMWMdp219QUA5WRO
	VRr9kwyu5UkdX4Kur09n5hymSjJvuo7olTQrztYWeGGJnvp+5myj+YLnvJupJKp/ghIX
	GwlZBUqNYnq3+Ze3Uboz6V7D+XSreMFc+rXR+ZwcmGMNG6+enD7aMlrdeK5caVlgrETo
	uIQg==
X-Received: by 10.205.73.200 with SMTP id yt8mr293036bkb.54.1397488048366;
	Mon, 14 Apr 2014 08:07:28 -0700 (PDT)
Received: from [192.168.1.149] (p5DCFD29F.dip0.t-ipconnect.de.
	[93.207.210.159])
	by mx.google.com with ESMTPSA id ez1sm17394612bkb.2.2014.04.14.08.07.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Apr 2014 08:07:27 -0700 (PDT)
Message-ID: <534BF9AE.10104@gmail.com>
Date: Mon, 14 Apr 2014 17:07:26 +0200
From: =?ISO-8859-1?Q?Bj=F6rn_Krombholz?= <pirobk@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1397233423-26218-1-git-send-email-b.krombholz@pironex.de>	<20140411182042.GU2132@jama>
	<20140414132858.GB2132@jama>
In-Reply-To: <20140414132858.GB2132@jama>
Subject: Re: [meta-oe][PATCH 1/1] qwt-e: qwt 6.1.0 FTBFS fix for qt-embedded targets
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
X-List-Received-Date: Mon, 14 Apr 2014 15:07:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 04/14/2014 03:28 PM, Martin Jansa wrote:
> On Fri, Apr 11, 2014 at 08:20:42PM +0200, Martin Jansa wrote:
>> On Fri, Apr 11, 2014 at 06:23:43PM +0200, Björn Krombholz wrote:
>>> ---
>>> for yocto-1.4 branch, 1.5 is still on qwt 6.0.1
>
> meta-oe/master also has qwt 6.0.1, where is patch for 6.1.0?

Args, sorry - mixed up OE's meta-oe with Angstrom's variant.

So the 6.1 commit is:

7703a14b39a4d599df057c0a3d587238d26f00c4

in branch: angstrom-staging-yocto1.4


-- 
Björn Krombholz
pironex GmbH -- http://www.pironex.de

