Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f44.google.com (mail-vb0-f44.google.com
	[209.85.212.44])
	by mail.openembedded.org (Postfix) with ESMTP id E9DB96100B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 08:32:13 +0000 (UTC)
Received: by mail-vb0-f44.google.com with SMTP id e13so692899vbg.31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 01:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=ZZ0nU8PlxBFQOmh+Mr5gBI4Myt+ej+cqSNpp7iXN2eg=;
	b=OqNeMMCvckzfvsApRTNImdHlaWyM6aoZI4SA3DfsJYPosa2m1ovVsDQdPCT1J52i3+
	+eK8WVoMILUbuo2zOh5EwEgU5XioeuZv7R9e41lpqc8nU+oMTcFc3UuhNEuZr9fjf+ev
	+hkBGcBX3RWGDfdInCLpEKMS42KRsL5dYLOu2QGtTjXko80SWrFADZ1nszRb6Gp0KXQm
	vqqD2QbgtIFdPJMiccF/yAVcOChqB/b1hvwoFTl6ow83+A53QU8kAq1ifNBOI2c5ouIg
	ImS5lT1Zz8082um3jiD1dSWrtLw52s089lcTTrpjgR9+aDcaKR6kgaZwtbKNLNcSg2xj
	0eqw==
X-Gm-Message-State: ALoCoQmezxLvlVwh1asGmbwr4/FBs42URBERmpPIQ89Mj+d6Lo/VJxrGyNzaRpDx+QKZZWwr16gr
X-Received: by 10.220.74.69 with SMTP id t5mr10946771vcj.18.1379061134888;
	Fri, 13 Sep 2013 01:32:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 13 Sep 2013 01:31:54 -0700 (PDT)
In-Reply-To: <449257A2-5983-492C-BB40-0CA231F01535@gmail.com>
References: <CAJTo0LZQM09ue4aWs-H4K94f+CsFUeTbFDA5mH4+aQQ=HdcHOQ@mail.gmail.com>
	<449257A2-5983-492C-BB40-0CA231F01535@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Sep 2013 09:31:54 +0100
Message-ID: <CAJTo0LYNBydCL14nJc2Wir2KwUJCG+BV3__92h81TREdZ+D-PQ@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Does meta-oe want imake?
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
X-List-Received-Date: Fri, 13 Sep 2013 08:32:14 -0000
Content-Type: text/plain; charset=UTF-8

On 13 September 2013 07:12, Khem Raj <raj.khem@gmail.com> wrote:
> How about anjuta-remote-run.bb as well ?

Ha, yes.  Anything else people have found from ten years ago?

Ross

