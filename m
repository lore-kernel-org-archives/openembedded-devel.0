Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id CA3F960557
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 03:56:05 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so179211739pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 May 2015 20:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=c6b5FwwJbONwoA5xb0wlWTyoq18kwEcG33XqykMyHW0=;
	b=0qCnRu19vVQHPQlM6Sp/XA5mpq9rY8fW/pB4YkK+YheHvBxiSs+O1mV3mOkO9VIU7r
	8iX96OSyrsHu5vrNj0S/2IDzwUYlfKK/u6Mvaq152gmTh22nW5nbclf4fOZ5hYKf3K5E
	FDJnWonb29ccGAtVi5L9iYd0hjcqXlRHMVxaKgHlyl/MWv/t7YEDKYs+3PM1RdY03Tid
	J+jTj7a7V+uBFxYdzv1k2rmTjngBeVNdPt0fK25NiAB3LXo0CYUABsN1yPI6J4x80fce
	K/fKdK1v2Zt0D641sHHnM+eBpwDcIk5wZfPcu/ol6HL2DGpNP1OZUu3ZIqlI6PcCV97i
	nzOA==
X-Received: by 10.66.179.81 with SMTP id de17mr47861205pac.59.1430798166675;
	Mon, 04 May 2015 20:56:06 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:84a:4937:3a73:d745?
	([2601:c:a700:3ba7:84a:4937:3a73:d745])
	by mx.google.com with ESMTPSA id
	xo3sm14197998pbb.74.2015.05.04.20.56.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 May 2015 20:56:05 -0700 (PDT)
Message-ID: <55483F50.5020803@gmail.com>
Date: Mon, 04 May 2015 20:56:00 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Odroid-xu3 support
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
X-List-Received-Date: Tue, 05 May 2015 03:56:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have added support for the Odroid XU3 board. This layer can be found 
at  https://github.com/akuster/meta-odroid. It supports XFCE graphics 
and has sdcard image support.

enjoy,
Armin

