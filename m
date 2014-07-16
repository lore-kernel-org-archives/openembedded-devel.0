Return-Path: <akuster@mvista.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 49FDD65CE7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 06:20:37 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id et14so705866pad.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 23:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=USnQxxNXwPcICYmVK0kPkh4LkNj6SHvGl/5aZixrM3c=;
	b=Rlf93b3OKZjZPQnbc0CAYf9pYMZDIj2stktKB9DxfMfJDtcFUj3k/k0UHZdl95FxhQ
	47oc2ryuqoZVK5kNo/BcCbPLS+VOgsAVz0mbmSKPVY0FMzKNKIDKPE1ZKITMxF+A4l1I
	m6/24EK4yK2XQ2+XCQBjAQpGa3K/Qt4BPGM3OcTTcFppfRPhUWhzkAE/5dRl0aCURaVw
	NCW/MLODjpjQA2Pd9NIa2EXtYdA0PtmxMiVJMu4eEsDkLK1Ybz7QqkkSEQykpabvEijo
	ZuuR35XF+4eHVgspcozpTlf9KZphwnHsHKzgtcopExUGAIO4aigh8FxCPF0PxR4jdZH/
	fvRA==
X-Gm-Message-State: ALoCoQlC0l575JSY6whcenhMDD9BeD14y891ZWcgzvN1tEme7+zwBVC/+Vn8r6VUn+RKG93IfHjw
X-Received: by 10.66.119.136 with SMTP id ku8mr8349149pab.121.1405491638790;
	Tue, 15 Jul 2014 23:20:38 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	xk1sm66706918pac.21.2014.07.15.23.20.37 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jul 2014 23:20:38 -0700 (PDT)
Message-ID: <53C619B3.7050203@mvista.com>
Date: Tue, 15 Jul 2014 23:20:35 -0700
From: akuster <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: WIreshark 1.12.x
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
X-List-Received-Date: Wed, 16 Jul 2014 06:20:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello all,

I have the latest wireshark 1.12.0-rc2 building and working with gtk2. 
Is anyone else working on this? if not I can submit patches.

I am not sure which layer wireshark should swim in,  meta-networking or 
meta-security ?

- Armin

