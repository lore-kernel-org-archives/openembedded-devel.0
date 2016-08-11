Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id BCB9A77206
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 11:46:57 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id o80so10330253wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Aug 2016 04:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=kJ5rGomhOe0SfCQJ88nNP29q2htHffx7LCwUwy/w8Oo=;
	b=WQHeF5Iklo4tioNWw+LgBIpIztW39B4RxaE+gdjOGcTlYA/GPNIfWtQ/Uz9r2ueKEN
	9XxRcqLX75frHb8lFo10qG4+zu8heq9UjG2+K4R6Qbmightu+9OgcsbfqoYwxi1UYJy/
	pqXSPIVRSExJ9GZ+Dsj47VvVO85xDuniZkeQJZ/t3BUGWNIWx0Y2umlJZhY2HEH28tHX
	RWhEEbo2OBMY6jFKJPU179Sr84jQvwW3xaokaTXDHJvPl33sHZcBf/YB2AMnO/bl/VOv
	6ZKNc59x1Lc/TvOXKBpxbPI3Bw3zsdxLXjMrK7LeX4bZcqmS3Oj0RRMoZoBX67kTyhPi
	pcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=kJ5rGomhOe0SfCQJ88nNP29q2htHffx7LCwUwy/w8Oo=;
	b=d4IetPk7XjIz/9yKDQmgAFXbLZGzJtezK22OYZ+OdB2wrPrBRv+jRoq2kdJIqShgni
	iXTdSKGV5lwwYyzF9O09FGRXOuEQ8xmb0Q/osS/f43iCztITIubC0BYkUykZ1NEeDXXO
	uian7fZRZNG4dh/08753QACUBvJuzLTHj48w8Do7u6ok+3k7JQ8TMUi9HlXV7Mf/v8hP
	ohkuPlMRsl1etCCP4+daO6aXoLv/ro+970rShC5+CY7oCze5PWuv0QpDpJAWG/b5YXxi
	8/XFgiwJ9xJWb1tErgDS2NtWf7SE3Uf5SXhZ05yjPcAYuPKfQXUQJ8AiiuM5O3Tgfar5
	rLrA==
X-Gm-Message-State: AEkoout9F9WDktTu7bPJzB7anFKhYSn0O1Y2qFbaSyzgDHzCrtrjZTRUrfLk7r8PDDMWGTKgFxc3X/2duK8b0Q==
X-Received: by 10.194.185.116 with SMTP id fb20mr11047568wjc.32.1470916017461; 
	Thu, 11 Aug 2016 04:46:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.139.148 with HTTP; Thu, 11 Aug 2016 04:46:36 -0700 (PDT)
In-Reply-To: <20160811114455.7awdrth4kx43m24z@jama>
References: <1470910246-952-1-git-send-email-ricardo.ribalda@gmail.com>
	<20160811114455.7awdrth4kx43m24z@jama>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 11 Aug 2016 13:46:36 +0200
Message-ID: <CAPybu_2rirHuw9W1Z3Fq5UJjJ+nCXQ3-RTZr=3fESt-d=JTfkA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] gflags: New recipe
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
X-List-Received-Date: Thu, 11 Aug 2016 11:46:58 -0000
Content-Type: text/plain; charset=UTF-8

Hi Martin

On Thu, Aug 11, 2016 at 1:44 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> +SRC_URI = "git://github.com/gflags/gflags.git;;nobranch=1"
>
> It's in "release" branch, so I'll replace ;;nobranch=1 with ;branch=release when cherry-picking.
Thanks!

