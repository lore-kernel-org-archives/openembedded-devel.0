Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id CEEFB72376
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 12:12:27 +0000 (UTC)
Received: by widdi4 with SMTP id di4so143637747wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 May 2015 05:12:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=55BdLg4McaVNJvdoKDgEfUsyu2Gr82PupQZyMsGNRLg=;
	b=jyzmXuugz5vmwsxHlDK0vAaklhda1v0QhrErtf0yrZwzH1l9TE05UxRDzWUqr/ke0Z
	AE3pDEnpDTuxAoJwW+Z0h2RAs0bohmJo+na4HIqpa4LM2mB/qomEuQwpKcIkUD9fP6Fx
	je81z9DhggJ45m2k+ZJR8QUUT25zjYu4eXUPWRkc/FSUJoCPpU7r6fPIm2WLGi2G+p4F
	1416O3GLrJ0Ua5GwB4IkNSRFAgzYrEcq6XSirJ8H/54p6B7ai1dTqILYGUr1HtixHuRj
	1Jtmydr7eV27nt0oPHPxHgMYUjDONrg8Hn+KZweImYiphQeUmr7YKGafvx6I2SDvZnXx
	XOOg==
X-Gm-Message-State: ALoCoQkMWFgtpV+dhkpFPowY6UseDC54RWT6SfECDBXLUnguGS7afaW5shTAgAwUtcaZQ3Di+NDI
X-Received: by 10.180.8.34 with SMTP id o2mr3538827wia.18.1430827948135;
	Tue, 05 May 2015 05:12:28 -0700 (PDT)
Received: from mobil-400-586.internal.dresearch-fe.de
	(pd95cbf07.dip0.t-ipconnect.de. [217.92.191.7])
	by mx.google.com with ESMTPSA id
	vz8sm25287261wjc.27.2015.05.05.05.12.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 May 2015 05:12:27 -0700 (PDT)
Message-ID: <5548B3A9.40301@dresearch-fe.de>
Date: Tue, 05 May 2015 14:12:25 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Armin Kuster <akuster808@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>
References: <1430483441-4566-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1430483441-4566-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [meta-ruby][PATCH] ruby: explicitly disable dtrace support
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
X-List-Received-Date: Tue, 05 May 2015 12:12:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 01.05.2015 14:30, Martin Jansa wrote:
> both 2.2.1 and 2.2.2 are failing on some hosts native builds with:
> ...

It would be really great if this patch could make it to the fido branch!

We are some of the mourners and cannot build fido at the moment. :(

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

