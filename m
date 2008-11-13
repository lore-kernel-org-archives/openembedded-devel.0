Received: from [209.85.198.250] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1L0eDU-0000dh-R2
	for openembedded-devel@openembedded.org; Thu, 13 Nov 2008 16:34:45 +0100
Received: by rv-out-0708.google.com with SMTP id k29so1100843rvb.0
	for <openembedded-devel@openembedded.org>;
	Thu, 13 Nov 2008 07:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=F1dUL5jMJzjXDK7b7BbLG6kuK8t3EgnVS0Ncu8EvPaA=;
	b=EjGYsKxpOlXAFnh5apnCfDwAAz0VzoKbT55W74l4tB+6De3uTBiqoSHTLLqF8QmNTK
	lzEORQep2liDz5h2WhGX9iRIHxc4XIAMH7sEzgAuVSzSlpKIoEFlANw+oIOez/LLnRPH
	uKJ99ntfzqnoIfyCDYYbDpbZSHqSyoFhdIr9k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=ILA/A2iVyNXXLuA3Yv3C/JKNXzdzyjRZiGHtsYLzqBoR8s/32NiOyYade1Mh4xCh7k
	eNMmmBvcZP4Qs4Z4gMc+Ktp8BFcexWOa1EuBiMREU8iYcLN0HOi6+RBmRx5fWIGF49Fn
	UqmkEcHkXvR7XCW0gEeS/luk23F8xlgMAwUgk=
Received: by 10.140.201.6 with SMTP id y6mr5543340rvf.298.1226590361427;
	Thu, 13 Nov 2008 07:32:41 -0800 (PST)
Received: by 10.141.193.4 with HTTP; Thu, 13 Nov 2008 07:32:41 -0800 (PST)
Message-ID: <f96d234e0811130732o3e1f43bbt68d3a9c215e2bada@mail.gmail.com>
Date: Thu, 13 Nov 2008 10:32:41 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1226236934.5378.7.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <20081023230928.GA21151@denix.org>
	<f96d234e0810240638u1026aec9y6b258bba5708315f@mail.gmail.com>
	<1224861430.6356.20.camel@dax.rpnet.com>
	<f96d234e0811071157j71bc59bbjf71e865c32e40a81@mail.gmail.com>
	<1226236934.5378.7.camel@dax.rpnet.com>
Cc: openembedded-devel@openembedded.org
Subject: Re: RFC: Add http_proxy and ftp_proxy to BitBake white list
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Nov 2008 15:34:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sun, Nov 9, 2008 at 8:22 AM, Richard Purdie <rpurdie@rpsys.net> wrote:

> Hopefully this clears up the intent of the patches, the improvements are
> based on real world usage problems.

Thanks for explaining.  I'll do some more testing and would be glad to
help with documentation once things are merged to upstream bitbake.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


