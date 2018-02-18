Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f52.google.com (mail-pl0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id F22D071A72
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Feb 2018 21:44:11 +0000 (UTC)
Received: by mail-pl0-f52.google.com with SMTP id v3so4620251plg.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Feb 2018 13:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding:content-language;
	bh=CQHVmat9csIUAPtM2NlfVPZUtQqWev9u/w11rPXpGs0=;
	b=IGSp5hdexFhx6WHiTVaWaO/5EIGEByobokDf1VC9PaBoxStzDZ5eeYCHdYO5GL7pul
	hc+D3LFvwM5MbZcu2cel74RInHHsaUhl7f2odGO5VcviejLdLsOab+eOa7V890Q62NG6
	kGS3fz9YVR2VtZ76rJrP6ahrn/71OR43nE6aW5Taiom57al+IR/eV0rVSYRHSF3dnMtP
	ZOfBf79cVwhBdmKy+9SXO2mURayxarjwUmKN66YBAfJrF4pB6bkEYMB5oxTqkjj2bI9r
	MaT6ofgo0aY8f/npuzkmMA2klnKt0oy7jGpAsKj1ZrjxqA3+JNfBSVV9w98fw9nvpE6j
	smhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=CQHVmat9csIUAPtM2NlfVPZUtQqWev9u/w11rPXpGs0=;
	b=IZKokJvCIuBDSM0M6JhJr4xrvTS4QBccR03Z6tmOgCOVGHH8h8cKYPNOL0YcorofnY
	T3pdzov6JJ4dc6SoPovKbSFRgBD64ojvCLv+JKreKbmeWVAvXmHsLh8Tw+/KAs26b3Qf
	uSMPXORZya4YY6ZpZ1MJipn5Shxm+lNBSkuKh+VlzTkuVKftAUSzX+n+VvaHKvUCKuPA
	VNOeGzatbUQKHbpH+sspVL2x/A4x4ZZb3GlFMMs5ec+YgOq0oOVx2o9TxF3t5/BmTeyA
	DU4Ui259qPbIIjXYkdbS7zMtcIC1lJNezKrgpPqGp4XRV1SbR2EG8GTdRDVS6fsM+MKX
	EFCw==
X-Gm-Message-State: APf1xPDDR9HhNJyJgHyhkhAG4aiZ+KJr3aNZcR4rzmbYw9NMuDbgUc5i
	gE00bVOT/zKzh0UbGb9yv439tA==
X-Google-Smtp-Source: AH8x227jZFurkzch0oZ5vjpZzAU3fFNjql6/ybxBctYaFGew38r5BfjW1yyMpHoP87NdRVEELeRQgQ==
X-Received: by 2002:a17:902:590d:: with SMTP id
	o13-v6mr4978227pli.31.1518990252844; 
	Sun, 18 Feb 2018 13:44:12 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:445:eea1:c858:82d4?
	([2601:202:4000:1184:445:eea1:c858:82d4])
	by smtp.gmail.com with ESMTPSA id
	z127sm25750941pfb.130.2018.02.18.13.44.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Feb 2018 13:44:11 -0800 (PST)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <66a8df0c-b038-ec61-5223-62cbb58515df@gmail.com>
Date: Sun, 18 Feb 2018 13:44:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
Subject: world build
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
X-List-Received-Date: Sun, 18 Feb 2018 21:44:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

The world build is having issues again. The currently queue changes will
be delayed in being merged.

- Armin


