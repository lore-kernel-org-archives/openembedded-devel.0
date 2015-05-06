Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7EA8673755
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 20:17:56 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so5104081igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2015 13:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=YWmIy1kIrl9IIcOuNiD0avEvDgEqRKkUknQZPYCJPQ4=;
	b=SQY1I6gkkkdtVcWqXKXUVKSWccc6uAisM47qwHbh2j+za0O+NdExzZTq0oeg+fnDqM
	DDon6O0+Gp5grpczeEn9PRQsMbOqQrG+k5dGe1ANxjCIdDpBm27sf7LlHEtKs7yczAHd
	0adBz9PusOjn67+wZBu42lPmu1eJoCcCE18lTP0ZOvi4vWn4PxrPY5Bad6RAyXvPyBLn
	DUmBW11E6x/NHv1uVTeY/DUSiWXQzixUWXTi9bJ/5LGWkU68ymKvMVwEi4Uxb+j6QvrY
	S/b5BV5YGVeIw+6doMxBarUfQZ+MmLyReb7EI9cD17gRYtlxaaHjZsBunIbbvqk3mokv
	AImg==
X-Received: by 10.50.62.148 with SMTP id y20mr10316443igr.17.1430943477442;
	Wed, 06 May 2015 13:17:57 -0700 (PDT)
Received: from [192.168.141.85] ([66.49.234.10])
	by mx.google.com with ESMTPSA id pg7sm1502081igb.6.2015.05.06.13.17.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 May 2015 13:17:56 -0700 (PDT)
Message-ID: <554A76F1.8050407@gmail.com>
Date: Wed, 06 May 2015 16:17:53 -0400
From: Trevor Woerner <twoerner@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
References: <55483F50.5020803@gmail.com>
In-Reply-To: <55483F50.5020803@gmail.com>
Subject: Re: Odroid-xu3 support
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
X-List-Received-Date: Wed, 06 May 2015 20:17:57 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 05/04/15 23:56, akuster808 wrote:
> I have added support for the Odroid XU3 board. This layer can be found
> at  https://github.com/akuster/meta-odroid. It supports XFCE graphics
> and has sdcard image support.

Sounds great!

In addition to your meta-odroid there are also:
https://github.com/stoupa-cz/meta-odroid
https://github.com/MarkusEich/meta-odroid

Yours supports: odroid-xu3
stoupa-cz supports: odroid-c1, odroid-u2, odroid-xu
MarkusEich supports: odroid-u2, odroid-xu

It'd be nice if someone could put together one "meta-odroid" that would
support them all ;-) Or at least it'd be nice if at least one of them
was found via the layer index ;-)

