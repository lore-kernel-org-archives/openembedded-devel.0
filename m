Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id ACBE87C788
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 09:00:26 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1gw1GN-0007FK-69; Tue, 19 Feb 2019 10:00:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LGAjjeEDKVAW02qXwGIKcLu/JROXA4Yibg8p+ahNoKU=;
	b=KDXglKTfbQjPngTiG8X90WRCHD
	48fRT0AyVXCTUKNCg/AQs88xkMO/p5P7s8AVvmxtaeU5iWTdbNdIcz6yjj12KJYKPZT1BQ+Yf8eMs
	U+CjUOEGLcdeWEZ9aqR359baAY90ViCtahZ8mCfjYzPFaK+oaAK0WEEpLZ0cbkbhr5vLMuFhRgSGI
	aoP1tXwitO/ZXGphfJ+ISN9UtgA/MJY/+YJw5Dz2KigW5g784Ok59j8WkNJ4SOUny76pUAx5bPdgH
	xLxDYJnWxnztZ6RtLgYea3pD3Nb82cufVQiTzBagotUSt8rVbJIPJ0dMxtRt2DxbT8CYV+Z8+dLdG
	NyNK1z6Q==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <zboszor@pr.hu>)
	id 1gw1GI-0002wI-7d; Tue, 19 Feb 2019 10:00:25 +0100
To: Khem Raj <raj.khem@gmail.com>
References: <20190216170354.10645-1-zboszor@pr.hu>
	<20190218104704.14623-1-zboszor@pr.hu>
	<CAMKF1spwdGaXKr51oZM-g5Pmw8jNsUQLOs=DRsOfD3pYfAYRZg@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Message-ID: <5ed76350-b384-bfa8-5e21-5373a9bf4a91@pr.hu>
Date: Tue, 19 Feb 2019 10:00:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spwdGaXKr51oZM-g5Pmw8jNsUQLOs=DRsOfD3pYfAYRZg@mail.gmail.com>
X-Spam-Score: -1.3 (-)
X-Scan-Signature: 61dc834c4512bbdac06a43d8f23e4555
X-Spam-Tracer: backend.mail.pr.hu -1.3 20190219090025Z
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-initramfs][PATCH 0/6 v2] Run dracut from rootfs
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
X-List-Received-Date: Tue, 19 Feb 2019 09:00:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Please fix the author for my patches in Patchwork and in GIT history.

Who is this William A. Kennington III who claimed ownership over my patches?

2019. 02. 19. 8:01 keltezéssel, Khem Raj írta:
> https://errors.yoctoproject.org/Errors/Details/228793/
> 
> On Mon, Feb 18, 2019 at 2:47 AM Böszörményi Zoltán <zboszor@pr.hu> wrote:
>>
>> This patchset adds the necessary pieces to create the initramfs
>> with dracut during do_rootfs.
>>
>> The 6th patch references a GitHub branch for which a pull request
>> was made against dracut. See https://github.com/dracutdevs/dracut/pull/535
>>
>> Best regards,
>> Zoltán Böszörményi
>>
>>
> 


