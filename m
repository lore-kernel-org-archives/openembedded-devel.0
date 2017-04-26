Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 28C7F77D20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 20:24:51 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id a188so5206557pfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 13:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=ZlKhrMsqabiXR8pKaHlryW3sgI8m260p+dxH6pMZdz8=;
	b=FPXkjxWpD3++oLjgrKG7xTBOvgAfnQU68zFk//BUiV/D9Jlp41dTGVxy+tUziJF4Cp
	QQzCeQIf7rXzy7AaablxyEV/bVV/LqthSgPTthM+qjoYy32r1/7VThLbzoUQIl7Fa/yg
	rMCMPWrq0vg0TLvV97LbwEG4azFvHv92BJKlrWKpKBza/LoBPX+DMKyte7/ZEU7QspWQ
	NuXCefuMlSyWr+ldx053GQvzPefLjjXiC3g0OV3q/QhrhgoFrrSk9JlmHu4E5qPGHbFg
	yT6mUI1TO/rV/170Ab4R/ArsNeHfpAnkgu8LNbgnSnUfazgwq1VA7zf+MEXQ5lVhaQ1Y
	ogeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=ZlKhrMsqabiXR8pKaHlryW3sgI8m260p+dxH6pMZdz8=;
	b=CToZt04GmBK0c4X+8uDoFpwGjOVlc81lZKGcbdgfoqKkORaghD6aSB0FSZUNKMMKZF
	vdGl0Mmd9zJucz3ZdenbE/YOcIWMlGaF/tY+sJrj/l2Cp4KTV/j3osZ3R3KDSVwajaO5
	oz2VD2HbXsZAuIRAbLcKWpGiuJ7Qf+tZt0P/qNhsGmp/lf18Pi6b/a4gCgePQhuZB26q
	QY4+d6cxbafikHs2icDFD11jb1tAKiHqqzrEs4r8gcFhZm2N9RXbtQgqN9b9OMeZFzLR
	vcUtJ8RKN+u827EtBkiDdvJbw0H9ccdrGxNf4zSn+xx90svVr2mKFmt7akEAUSZxHmuT
	i2LQ==
X-Gm-Message-State: AN3rC/4gn+qd7KSXx4iWcsiqF+G7LhX6iGW2z09K9ZxMDzn169V3+mm9
	QTswUcVh2E/2dw==
X-Received: by 10.99.152.87 with SMTP id l23mr1749939pgo.59.1493238293336;
	Wed, 26 Apr 2017 13:24:53 -0700 (PDT)
Received: from Akusters-laptop.local ([2601:202:4001:9ea0:8483:ff95:723b:6318])
	by smtp.googlemail.com with ESMTPSA id
	x9sm262267pff.98.2017.04.26.13.24.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Apr 2017 13:24:52 -0700 (PDT)
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20170426184422.GG3258@jama>
From: akuster808 <akuster808@gmail.com>
Message-ID: <a05fd59e-cbf1-291c-c2fa-63d3ba5b1d6e@gmail.com>
Date: Wed, 26 Apr 2017 13:24:51 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170426184422.GG3258@jama>
Subject: Re: pyro branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Wed, 26 Apr 2017 20:24:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 4/26/17 11:44 AM, Martin Jansa wrote:
> Hello,
>
> as every 6 months I'm looking for some volunteer(s) to step-up and
> maintain "pyro" release branch.
put me down. I will be sending patches shortly.
-armin
>
> You can sign-up by replying to this thread and then one of you need to
> send README update like this:
> https://github.com/openembedded/meta-openembedded/commit/3082e30da58df0711182cf114c71a8c6a093aeae
>
> More details in thread searching for daisy maintainer:
> http://lists.openembedded.org/pipermail/openembedded-devel/2014-April/095601.html
> http://lists.openembedded.org/pipermail/openembedded-devel/2014-May/095694.html
> or dizzy maintainer:
> http://lists.openembedded.org/pipermail/openembedded-devel/2014-October/098441.html
> or fido maintainer:
> http://lists.openembedded.org/pipermail/openembedded-devel/2015-March/100901.html
> or jethro maintainer:
> http://lists.openembedded.org/pipermail/openembedded-devel/2015-October/103810.html
> or krogoth maintainer:
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-April/106952.html
> or morty maintainer:
> http://lists.openembedded.org/pipermail/openembedded-devel/2016-October/109452.html
>
> Regards,
>
>


