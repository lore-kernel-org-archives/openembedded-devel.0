Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 07D3173CF2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Aug 2015 00:43:12 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so30999439pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2015 17:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=pRyGp1jDrYR/7rK0W6Pq/YXBh/GITiC2oUEEK6jENvY=;
	b=QyrqB1E4cf5OEsWfBQAHAYWiLwcgZNDYAjnjipKpJoMzkzoP39wuG1gyygOV+o93Tz
	KQPzfzTriqYBmjpyhtn6LoGP0XyyjYfu0aRaN4CtvbqWOxwDDSE3hcWPjBWnk8ppDaj/
	EeoHB/VZrfMNMzGx0Gq3H6q/QJAV4aJ4obsKqcWwblrqX40PSAL+QGdypRO/4HLt8nqj
	eiy7vBD2PQU3HWG214pVIPRfIOU7oMPVgrAS8DjXjtixWIUPTsweufdjmhwTWMruh7DK
	rcnGSVnTx5CJPZOLwfjfzrrfeFvFmFdXX3c/X0gJc+PpZcxpKEyajLIg69wriVX5kBSF
	Gihg==
X-Received: by 10.66.222.161 with SMTP id qn1mr11985097pac.66.1440117792851;
	Thu, 20 Aug 2015 17:43:12 -0700 (PDT)
Received: from [10.43.100.29] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by smtp.googlemail.com with ESMTPSA id
	im2sm5630378pbc.34.2015.08.20.17.43.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Aug 2015 17:43:11 -0700 (PDT)
Message-ID: <55D6741E.7050106@gmail.com>
Date: Thu, 20 Aug 2015 17:43:10 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <CAP9ODKrP8H-mSZf0k0sJLKRRgLS=sDk4Vwv1Jx+qH5e3PZ-=mw@mail.gmail.com>
In-Reply-To: <CAP9ODKrP8H-mSZf0k0sJLKRRgLS=sDk4Vwv1Jx+qH5e3PZ-=mw@mail.gmail.com>
Subject: Re: Backport for Fido
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
X-List-Received-Date: Fri, 21 Aug 2015 00:43:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/20/2015 04:22 PM, Otavio Salvador wrote:
> Hello Martin,
>
> Please backport 6ea7ac016987832e51b0721ce5a52dd4e2f3d0a4 for fido, of meta-oe.

Acked-by: Armin Kuster <akuster808@gmail.com>

>
> Thanks in advance,
>

