Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 95F3F60F09
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Sep 2013 09:40:48 +0000 (UTC)
Received: from [192.168.101.5] (afplatform.bmw-carit.intra [192.168.101.5])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 2D7A840072
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Sep 2013 10:37:09 +0200 (CEST)
Message-ID: <5245529F.5080201@oss.bmw-carit.de>
Date: Fri, 27 Sep 2013 11:40:47 +0200
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1380031928-29350-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>	<1380031928-29350-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<054B3A27-3D25-4794-A81B-9C78A920FDC1@gmail.com>
In-Reply-To: <054B3A27-3D25-4794-A81B-9C78A920FDC1@gmail.com>
Subject: Re: [meta-oe][PATCH 2/2] opencv: adding libeigen dependency
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
X-List-Received-Date: Fri, 27 Sep 2013 09:40:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/24/2013 06:09 PM, Khem Raj wrote:
> Lukas
>
> Thanks for patch. while you are at it. Can you convert this to be a PACKAGECONFIG as well ?
>
>
Hi Khem,

I have just created a patch for this to be a PACKAGECONFIG. Now, I only 
have to test and review them. Expect the revised patches next week.

Lukas

