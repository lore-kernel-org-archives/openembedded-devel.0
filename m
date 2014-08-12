Return-Path: <amey.patil@sjsu.edu>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4A8D665C70
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 23:07:53 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id t59so8131729yho.39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 16:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sjsu.edu; s=google;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=BMuwdlOBOwSo1I8g+CWhZXExITMCV42rkpZbDf3VJdQ=;
	b=MMIFhnek8l1DzfMel8bG2n9/zJ45eirFX2wD5TiBVCPsm7x8EmSlrNFbzEst4JM2vq
	O4ZuFwIquwvSZ4nGCvrjZyx7q76A/sFbwoOF66a69QdXDxXZc3CgU+iGETxcmknyKLdM
	8lARJyG3Qflx84vF4BwhtGhuCF5XfsenKV1tU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=BMuwdlOBOwSo1I8g+CWhZXExITMCV42rkpZbDf3VJdQ=;
	b=CxN8vKpu/dtU1/HLpODzvTQBuaXnWEMr8OZuCb26gm+h8s8ott1FvSmuS5aTSaRvlV
	ms4EsCUg1qr7ZikbFWPuKkdJCTxKk+e99pNXNvE+kXAGs3hsfYSjtt+6yqUcDwpCdpGk
	WuXSwh594KQPYveNmJldhxahxI1RHfY4JYtMR/dANpFijpd2SWr+5JCPNtyLNwJDiD4L
	QIrMIlEuypKMZdqN2Sia0rr2Tnw2xWPFpOVF85UmCubt4oZ/tTOuDCWmpS+NLK02YKn/
	Kf4RhEiltKk45Sqm/WPYYGzIheBYDgmjZdsJnFNkC0yY0ZNKtT9uA0rlkvXU9Vn+x+hb
	MmkQ==
X-Gm-Message-State: ALoCoQl5CC3KhtNcp/cu517owXNVpfcwQWRIk/3TOiygxVhKaOmbxLwTE4Lx/BbN6uDUaSgbtlhT
MIME-Version: 1.0
X-Received: by 10.236.55.195 with SMTP id k43mr1001852yhc.135.1407884873718;
	Tue, 12 Aug 2014 16:07:53 -0700 (PDT)
Received: by 10.170.114.19 with HTTP; Tue, 12 Aug 2014 16:07:53 -0700 (PDT)
Date: Tue, 12 Aug 2014 16:07:53 -0700
Message-ID: <CADJ8CoM1iHzedFROL50wR0GQfZnSeL8sUn_gFb=wdYz8nmChvA@mail.gmail.com>
From: Amey Patil <amey.patil@sjsu.edu>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Doubts regarding the final Image file
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
X-List-Received-Date: Tue, 12 Aug 2014 23:07:57 -0000
Content-Type: text/plain; charset=UTF-8

Hi,
I am a beginner in this Yocto stuff.

My objective: Angstrom operating system with built in Qt5 libraries on
Beaglebone Black.
My source:
http://www.ics.com/blog/beaglebone-black-low-cost-embedded-platform-part-3#.U-lfAv7fEew

I was expecting when I do "bitbake" (the final step), I will get a image
file which I will copy to a memory card and flash the on board eMMC of
Beaglebone black with it.
But I dont see an image. :(

Please guide.

Sincere Regards,
Amey Patil

