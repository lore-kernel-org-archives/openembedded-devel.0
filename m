Return-Path: <andre.draszik@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 62D1079C40
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 14:29:22 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id x11-v6so1614975qkl.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Oct 2018 07:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=fWBx0m2mDzmsYg0Q1Jr0GSx7FB/3vt1rZyw9hFCWc04=;
	b=ULJZCa1zQADS6vq977Tn5gRyWOaXavgVROJdY4NWZ65j9oAEAe25MjtbMQlGGn+I0C
	uabaSQRfHweqqgx2Kcgyv1/avt4CcmHRwrWljliG5IKy8r6RL+LP+lSLILgA4hOzZTR6
	Ej7RlXRqWg7r5QUgtJCMCunHhGjMUmsbTAF4sqUBEnGN5Ilco+jPZiTLjFAqijBaanxt
	+Okzj+qVzf8XekgEsL52+P0Qh1vExLZnzv5NTNiSZbUy+JMd53kV6xhbMDbv+D5psdqw
	9gwNuKt2ED725sdyoVb+2Mu2JNILCygiOZkbHe1AAtUBoiYFBkQwLO15b+Pw9zcXpKX1
	bCzg==
X-Gm-Message-State: ABuFfogyaHC6YU9Uu40XytJDBirhsHjiVB8ZYgKjLNGGebZSBgyvrFW2
	RDXoB0g48GiUpoi5wxNU5HdHkf+u
X-Google-Smtp-Source: ACcGV60RtDBufi5agXRvHSbG/hOoMzQPTOk1k6J56yycS3Us85MqHaCApzXSv5b2qULQgz1ZGaxYYg==
X-Received: by 2002:a37:5803:: with SMTP id
	m3-v6mr29395771qkb.81.1539872963139; 
	Thu, 18 Oct 2018 07:29:23 -0700 (PDT)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	n3-v6sm12919355qkc.48.2018.10.18.07.29.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Oct 2018 07:29:22 -0700 (PDT)
Message-ID: <af0ffeb73026b1df4809bf1f378cf6729d7b35b2.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Oct 2018 15:29:20 +0100
In-Reply-To: <CA+chaQfcYFFVBMSC4D5yAeHy8_wviYy40C9vT1QHDfEsPfKLbg@mail.gmail.com>
References: <1539753685-18233-1-git-send-email-Qi.Chen@windriver.com>
	<CABPh3UO90oG9asuYcmbi6BsTg84Y1oSrfQFu+C16x-=rEuBfJA@mail.gmail.com>
	<CABPh3UOQCLzXK4CTGsQQw1YH_buPr=guuW+x6axW6nn_eCAw9A@mail.gmail.com>
	<CA+chaQfcYFFVBMSC4D5yAeHy8_wviYy40C9vT1QHDfEsPfKLbg@mail.gmail.com>
User-Agent: Evolution 3.30.1-1 
Mime-Version: 1.0
Subject: Re: [OE-core] [PATCH 1/2] systemd: upgrade to 239
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
X-List-Received-Date: Thu, 18 Oct 2018 14:29:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-10-18 at 12:55 +0200, Martin Jansa wrote:
> Using u-a for the systemd symlinks to systemctl seems like best solution
> to
> me, I've already suggested it in:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-October/156597.html

Yes, I'd support that.



Cheers,
Andre'



