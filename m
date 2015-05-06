Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id D55FB73C8C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 May 2015 20:24:53 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so19738565pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2015 13:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=sRPO5wZH7dvc2ZJ+ZbOQiQWD25yweEzFnD4kI6fwwMw=;
	b=n8UsuKBAuf6USOk8xoDwhkgnM2MVfGrubFio3Os85AxLEncymuNimSzi/E+ibq8c2a
	vCgnCopkIszr3kPbwWTbwU3BxWF37iTDXMc+2DpuKOa6dKjBENIoLTKt2hd6qeCCU++j
	wllYQ8RmNpVFOpmgRMdQk1I6FA20I01sap1pzHGqVDZVC1RhBmgrlxWay9na/8D0FYU7
	mKwOkS3IzC2tXg+9JRXjB712rvO+XoFIV4n6XFT3B/1B5nUl8lEwz5bzH3+14/PRy8mN
	tYSFOBcBRrm3wCbDub2EL4kDS9hAeillO3c41NmBZCucKvKpAEe0VQLuMrOXij1OC3WH
	4f4g==
X-Received: by 10.66.150.196 with SMTP id uk4mr912025pab.54.1430943894688;
	Wed, 06 May 2015 13:24:54 -0700 (PDT)
Received: from [10.22.11.251] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id as1sm2670444pbc.39.2015.05.06.13.24.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 May 2015 13:24:53 -0700 (PDT)
Message-ID: <554A7893.3060701@gmail.com>
Date: Wed, 06 May 2015 13:24:51 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
References: <55483F50.5020803@gmail.com> <554A76F1.8050407@gmail.com>
In-Reply-To: <554A76F1.8050407@gmail.com>
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
X-List-Received-Date: Wed, 06 May 2015 20:24:54 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 05/06/2015 01:17 PM, Trevor Woerner wrote:
> On 05/04/15 23:56, akuster808 wrote:
>> I have added support for the Odroid XU3 board. This layer can be found
>> at  https://github.com/akuster/meta-odroid. It supports XFCE graphics
>> and has sdcard image support.
>
> Sounds great!
>
Thanks.

> In addition to your meta-odroid there are also:
> https://github.com/stoupa-cz/meta-odroid
> https://github.com/MarkusEich/meta-odroid
>
> Yours supports: odroid-xu3
> stoupa-cz supports: odroid-c1, odroid-u2, odroid-xu
> MarkusEich supports: odroid-u2, odroid-xu
>
> It'd be nice if someone could put together one "meta-odroid" that would
> support them all ;-)

Yep. looking into that.

Or at least it'd be nice if at least one of them
> was found via the layer index ;-)

that is the goal.

regards,
Armin
>

