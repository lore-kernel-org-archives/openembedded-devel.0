Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9872A600B3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 18:56:07 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id 184so83954887pff.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2016 11:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=0AJfFS0L2kR7n9awfWaf168TOoZfDPySqJscuEL1yHE=;
	b=YqAIWrEbMs95cUCzJzES4MA4nZs1sPdnSLfyByF53uENFFUXsz9VLlUvz6tL7pR4kV
	Nee6+HzQu0u6heNZMlIsl6U+KgWv/r7OPD3ohlMshR+HKy/KlxBrKesNQUUlA2CmEXDa
	pUmF8mcmWlK8suXzCMwo5dSRkrr5kIrpyHr2gXkb+4FUsrL2vjZipwGwscN8Chs07g29
	ueAaQ7U0Afn++U3B1qMLBMi1b/5tPWQRLORCkjYzWn+8Lorvakrlf+qWkvjK/r4AtV0m
	lmJQONHFN0hIe4jNNuCbskpTDojz052xObvyqdFY8Mt9yp0Eh9vJHTXD146ha7GDW21y
	+plQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=0AJfFS0L2kR7n9awfWaf168TOoZfDPySqJscuEL1yHE=;
	b=id+lrBJBSVbiyus+CTAOJFSrdq442Ac9noBi6WLNxYHoqP8LBFq5l2Z/hlTPQwsfsq
	Q5ADkxpYrthkWx+ZoLeGJunKjYdYhNef270sZLA6rQ2naYT1Jds+nctJRYqyjfPm7GFf
	n28RYCMx8kGWnh5li4B+oW85X6zByAxRG4oc/1XERfPjwp0Gxn3lXsG7kaEqTDzYL9UR
	o4JZtcyFDBJjbBMHkXkTnXZCgNHkQ+D/UpFeP/vgahy1F8O8G0WmEOpI+qhokKzwA8Qg
	VBVij1KrvWt/QfEM4mv/vqTV6i8cyduOkUvOb38KC3xHDNnsOaoREmuBvP0rXPRQga02
	AnIw==
X-Gm-Message-State: AOPr4FVlD6/cRRP5Zr/oMsI/+2nInDbanhdTfAxOXld5j8ss6NDpjjOKTCfH3I/t7Hd8Zg==
X-Received: by 10.98.8.219 with SMTP id 88mr51663159pfi.51.1461005768734;
	Mon, 18 Apr 2016 11:56:08 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:f54b:b8cc:b5b1:49c1?
	([2601:202:4000:1239:f54b:b8cc:b5b1:49c1])
	by smtp.googlemail.com with ESMTPSA id
	x184sm8657961pfb.53.2016.04.18.11.56.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2016 11:56:07 -0700 (PDT)
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <57152DC6.3040100@gmail.com>
Date: Mon, 18 Apr 2016 11:56:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Subject: patch requests for meta-openembedded jethro
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
X-List-Received-Date: Mon, 18 Apr 2016 18:56:09 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

I am staging patches for another jethro update

https://github.com/akuster/meta-openembedded/tree/akuster/jethro-next

c305ac5d2f5285d5eec8952a4ca7f3b4f89aed96..5e36615e77df2111c680d1f828b99e00bde7f1e6


If you sent a patch for jethro and you don't see in in the branch above,
please let me know.

regards,
Armin

