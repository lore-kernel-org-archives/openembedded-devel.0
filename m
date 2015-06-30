Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0F47B7320D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 09:45:09 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so2258445qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jun 2015 02:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=t1T40kiZZkA4fPdZYoMKY++JqRIMfTbaWhjfo4bxEbg=;
	b=MZXwcTD1sdvBJwKYZUZLuIec4MT313EY0hv52VHS1qqQwRkutVQJ5xWnQ1tzKyBBYJ
	Gig1+fFYqwWplRirScltV77wcSuhhYnS8XcafAJmHBuhprNAotIKw6e/VGU3vQnRd8ao
	/FU2Lqq/RZhSFAM2oGlhaXXBnIOhoBbpdSyF2qI/j87BXs3JgszvpqmcjrOpWuRjajsQ
	xdSEPNmFGm6T2/MNTmbl31zG71jR/7qpuZi1hbY0kIeepazD060MfD8ilAmKvxv50Dyu
	YGCEbw7s5xgb95DUVTydB5sZRsfTwRCLK38zn9M9hcVlNUxAzBOgwQz6qDbMiTdegZvN
	EDiQ==
X-Gm-Message-State: ALoCoQmEk7CJGXQs+6104cH10E5hvKaqpQLhp82gqagfMugdnEzRNOGWrcfQEgVk3xyjHhxVIsQ7
X-Received: by 10.55.23.86 with SMTP id i83mr41046154qkh.100.1435657510652;
	Tue, 30 Jun 2015 02:45:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 30 Jun 2015 02:44:50 -0700 (PDT)
In-Reply-To: <5591E548.8090706@gmail.com>
References: <5591E548.8090706@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Jun 2015 10:44:50 +0100
Message-ID: <CAJTo0LbVgo+rn3rPPbj=ho-aDc6WuHTq83UcR8Y=HNAique81w@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] cmake update broke mariadb
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
X-List-Received-Date: Tue, 30 Jun 2015 09:45:11 -0000
Content-Type: text/plain; charset=UTF-8

On 30 June 2015 at 01:39, akuster808 <akuster808@gmail.com> wrote:

> eo-core commit f8661aa "cmake: Upgrade 2.8.12.2 -> 3.2.2" broke mariadb in
> meta-oe.
>
> DOes  the person who updated cmake need to fix this or the person who is
> feeling the pain will be fixing it ?
>

Depends on what the breakage is really.  Can you provide build logs?

Ross

