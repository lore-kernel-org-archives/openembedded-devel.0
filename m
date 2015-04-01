Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 26CAB73C73
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2015 20:03:56 +0000 (UTC)
Received: by wixm2 with SMTP id m2so42757834wix.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 13:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=ZFo6OUWxaeyTlctfX/p21fDMVkdOqQPEruAgNAgw1/Y=;
	b=W3IEikyE6OeDtV/QSJ7FeJKpDsUVSLGvhfPMrjOhOT7ecen3bmPUWCcWZjJpEOh+fV
	bmZ/3aDW7EZUDAkl4CGEhAtlYAEF/ClLfwJt0v7OAOKTojGjZ1wP0N6xERypIz/Hxv4O
	r4bO8EEv4s/XTKbzS5rLAXJrZ5Iq9JKzCj+AO1HONDObCT78S+OdRvWv4sPdxey+mrR2
	Ntx+DUKgVycSUfxGQNB+9vuuxqX/yDJTCwgz4n1SuCC9fG3AuDNCJu/MXM7ylTT8mIZo
	0ut+ARiA/pcM0IxUF2bnTZHQ7tZ3NSr/tSDAO69LpS/0VRWSNzHTW7jLluiTHseZ5BuW
	vDwg==
X-Received: by 10.195.12.97 with SMTP id ep1mr88886218wjd.134.1427918637454;
	Wed, 01 Apr 2015 13:03:57 -0700 (PDT)
Received: from [192.168.50.199] (ip-84-119-99-153.unity-media.net.
	[84.119.99.153]) by mx.google.com with ESMTPSA id
	md2sm26893558wic.19.2015.04.01.13.03.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Apr 2015 13:03:56 -0700 (PDT)
Message-ID: <551C4F35.7020001@gmail.com>
Date: Wed, 01 Apr 2015 22:04:05 +0200
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Max Krummenacher <max.oss.09@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <CAD0=qkK3-x3CXStZkOVqOwfZioaLq+A9XwXehVT+HdLRzGPanw@mail.gmail.com>
	<CAEHkU3VM9sWOcBVynfQhesMXsXo5kQDabQuZLypxembQzfdePA@mail.gmail.com>
In-Reply-To: <CAEHkU3VM9sWOcBVynfQhesMXsXo5kQDabQuZLypxembQzfdePA@mail.gmail.com>
Subject: Re: [meta-java] Trying to update openjdk-7 to icedtea 2.5.4 and jdk75b13
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
X-List-Received-Date: Wed, 01 Apr 2015 20:03:57 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Max,

Am 01.04.2015 um 19:17 schrieb Max Krummenacher:
> Hi Sven
> 
> Maybe this pull request to the old meta-java repo location contains
> already contains some of the stuff you need.
> https://github.com/woglinde/meta-java/pull/62

Thanks, I will have a look at this.
Did you have the same problem with rmic as well?

> 
> Regards
> Max
> 
Cheers,
Sven


