Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 70C686D7F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 17:04:12 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id uq10so9132919igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 09:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=sl289B++Q2o+sChZYjFcVOgtcv3wXF3FSCwmI8WEgH4=;
	b=cQDxbmfq8/UNQFzTO23ESocPiIyAuFpHWdhLAD5OpCLsw+kf96jAjb/JjGq7j8SbI5
	41R9z94LMnpl44ENOdXfcP33lCVFM1RcQoqUaWC1eJGJsePxi2fIZU+99uu1AZjaQlVM
	XqEJEtSf2BTDbox4eID1tk6hWWCNMUI1VM9tPqhR/C0wFYBXRrAOk7kh2S3rcufSJ1A4
	J0qDDVO1gETwyOtAXCZyi/gttBUzNIHJoT+pR5HyaAOgCvcEM4Q5tcX0NAADASuM0cJs
	++pL81yvqIuL6vAMBOiqL+UU0J8zvE0XQMDYkoUnRudEHphloqCsRYkqX2FN9FZTAcRA
	zvSA==
X-Received: by 10.43.153.68 with SMTP id kz4mr20987430icc.29.1392138253037;
	Tue, 11 Feb 2014 09:04:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.8.137 with HTTP; Tue, 11 Feb 2014 09:03:42 -0800 (PST)
In-Reply-To: <CAMCfZKF7dxy+y8mx_qiM2T9xVNqdLLZ7DX_KjzT9piDqApEpeQ@mail.gmail.com>
References: <CANx9H-DMjo0JaHyGqgxh31wX77Z_OmpjF=cgAayLKyYcKLenxw@mail.gmail.com>
	<FC0A8257-46FF-46AD-8061-AD3396E8B243@gmail.com>
	<CAMCfZKH74FMry8-LvajWMEMbx0fEF2OzmZV+iDCkZ6djUCXsrA@mail.gmail.com>
	<CAMKF1sq=9ycj9XRr9PrMopyy9qpHg_cyxy_6fH++Nq6MqsGU8g@mail.gmail.com>
	<CAMCfZKF7dxy+y8mx_qiM2T9xVNqdLLZ7DX_KjzT9piDqApEpeQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Feb 2014 09:03:42 -0800
Message-ID: <CAMKF1sqrgQCf+EegF3qqe4chVBmO+qBDnhGD76uDX+mxOrV2cA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: xbmc build failing
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
X-List-Received-Date: Tue, 11 Feb 2014 17:04:12 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 11, 2014 at 7:14 AM, Diego Sueiro <diego.sueiro@gmail.com> wrote:
> Angstrom:
> ANGSTROM_GCC_VERSION_arm                         ?= "linaro-4.8%"
> Poky
> GCCVERSION ?= "4.8%"

OK how about eglibc

