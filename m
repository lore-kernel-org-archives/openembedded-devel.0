Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SwhdP-0006WP-2m
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2012 00:43:19 +0200
Received: by pbbrq2 with SMTP id rq2so1580493pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Aug 2012 15:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=KxxqC4dRsL211de5nyp6wtfxDKdvo/fSt8ZMnYa9C2o=;
	b=yHhTRFTgq0ReAbDZVKOpAWlrVFmIJjVXojuwD/yEtbizvb7W6oMHDZtrmuzP+f9GYW
	IZFJwPrri2CK0KaDXqWnGmp++rZZHJ+8jxkLvYrrP+xhAAjSI8ouJJxIzWP6D59/UV3x
	cdu0nyy6AozOtH/0HjnI4ffNq+VfibfMsyF2rzi9UHxN/dgdSyzYEX+LthGYucurihyk
	h3+4CMSdLy5v+37I0GU0gOPgaz4ijaf/m8K8lxCnhZSsuZrDMwo1H1BuGZ5cbRVTUECH
	Sd9nYdT455t0y5muYSSvT3JryKgLXl5E+DxtTLc+lF92TI0Q31yCB0g/k25NqJUXwTBY
	BjkQ==
Received: by 10.68.224.225 with SMTP id rf1mr55358409pbc.55.1343860299284;
	Wed, 01 Aug 2012 15:31:39 -0700 (PDT)
Received: from [10.11.81.126] (corp.force10networks.com. [64.186.164.204])
	by mx.google.com with ESMTPS id gf3sm3385490pbc.74.2012.08.01.15.31.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 15:31:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKpjChnhxSDBHB-SqWmzUoFPfYOR6kFSNnJ99EWhV2JHow@mail.gmail.com>
Date: Wed, 1 Aug 2012 15:31:23 -0700
Message-Id: <2179B7BF-0046-4B2B-9D96-5899787D7E7D@gmail.com>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
	<1343760977-3290-7-git-send-email-raj.khem@gmail.com>
	<CAP9ODKpjChnhxSDBHB-SqWmzUoFPfYOR6kFSNnJ99EWhV2JHow@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1485)
Subject: Re: [meta-oe][PATCH V2 7/7] kernel.bbclass: Rename to machine_kernel_pr.bbclass which provides added functionality
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
X-List-Received-Date: Wed, 01 Aug 2012 22:43:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Aug 1, 2012, at 10:38 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:

> On Tue, Jul 31, 2012 at 3:56 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Diffing with the OE-Core's kernel.bbclass only difference is setting of
>> machine kernel pr. So lets convert it to a separate class which provides
>> the added functionality and let everyone use kernel.bbclass from kernel
> 
>    ^ from OE-Core?


yes. I will resend a V3 with corrected comment.
Thx



