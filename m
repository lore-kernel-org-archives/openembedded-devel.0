Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E8A487EC54
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 18:52:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45jrzh3W3nz56;
	Tue,  9 Jul 2019 20:52:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562698369;
	bh=/Z8Dl2+dGTrx58FZp1g7FP35vv1RR3fFq/LeaFDS9XE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zm9NtrZmna10phevsXvPhT+pTXE4Y4TbqYn9K2np8AukOXYbeRScSRvoXr1EIX23s
	KP+nH9USEX6l/9W2lxMqJywMMD8GqLZ8wavWn6SGM7ev4BxxAmNmOLEGvEBIYQoGs7
	7E2+cufEwci97sth8qHc9YM0pRspqVJ5jaGR3CXnu2uaBkAhLEA5zClR2KsABXL3n5
	/dFifKDjYyIYoW8ml9KUECzdeItAm3TX5SYHTCu17e280CwAslAImhSrvBiTXkJsFH
	/CyE0Gs+fe6PAywNaM7r2Fez+n2tjD5ar1S3SMBrNbzM9dsR/ln7ZHRDuHPHzyzCcJ
	G2PFcZYY5Wg5rGsCo10EZbJNwQroK1syYcrc4CwSLhyrdgOHIvoY+YgSLRGExDGMRN
	m7nwUO4dOak+c+0mqhBaeVn9Lw0IQwdiXRzzhLJeubeZtKtksbzP1Bbe4wJ1h/toTx
	F0pORMUuzPnCGQvcuCo1t4OgkK11gxI0jWxBEjBSzks+r8NYVTjmVKO2jy5BEDBovy
	ujaVt/p496TAY9ge0ZE5wmtpqPgpiULVrOio84l6ZfvrqMSkJCybl5ZXEM5GF77Vwt
	En2Zm1pEkFPjAhdqthCyfSBbtEztLuEezNs+Ra5liux8xVy/4UzwjTEUjXjo1cogfi
	a0URIWi8JGVRcW388vfgFAzc=
Date: Tue, 9 Jul 2019 21:52:41 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190709185241.GB15450@localhost>
References: <1562032691-128301-1-git-send-email-changqing.li@windriver.com>
	<1562032691-128301-3-git-send-email-changqing.li@windriver.com>
	<CAMKF1sosi=qQyKEk6uHJKAWibFwpF7G2eTCwPrVEEe2zLubjzg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sosi=qQyKEk6uHJKAWibFwpF7G2eTCwPrVEEe2zLubjzg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 2/6 V2] libldb: upgrade 1.4.1 -> 1.5.4
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
X-List-Received-Date: Tue, 09 Jul 2019 18:52:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Jul 09, 2019 at 11:16:04AM -0700, Khem Raj wrote:
> there is another patch to upgrade to 1.6.3 I will take that

Please don't, see [1] for the rationale.

cu
Adrian

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2019-June/200359.html

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


