Received: from [209.85.216.194] (helo=mail-px0-f194.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1MAHH2-00088L-Sd
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 May 2009 07:38:29 +0200
Received: by pxi32 with SMTP id 32so4980330pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 May 2009 22:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=o1SzKSNQa4sP+X6XQ2iYCOhSsOkCe85HTiq9TQT0J38=;
	b=dxUPE/Fq5btpfQAbt1ZExm8beFkjXunuPlCKv3AeXxvVOULsm5rRiJ/90s2Ri6xRsI
	AiYXCxxM50ZiS+uQYklBdRRWu0HeEouZL0ay+hFdlErIy5TC9+baCrs1ne+GTPGoec7j
	/1x1uNA6mxZewMA4nolWWtjvimCYb8bXeulvQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=MhSglH6G6pp+YySTq38c4G06qy3B5fwT2lJ70zCz6Rbpq/ouZA385mHsFlfeq9WmoM
	RuSHTL3eNL3g9CEFmVsxH3jxDvWj/zbUU3dqrovmwqlVKE5tlZ++Jq+8V97gsaq8KAVp
	UFX15fY8L3pVmDhbXfvqOiE+cltdqz7KcPna4=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.231.7 with SMTP id d7mr1145901wfh.285.1243661396895; Fri, 
	29 May 2009 22:29:56 -0700 (PDT)
In-Reply-To: <loom.20090530T004559-114@post.gmane.org>
References: <Pine.LNX.4.64.0905260228240.6446@juice.ott.cti.com>
	<1243319696-16223-1-git-send-email-msmith@cbnco.com>
	<loom.20090530T004559-114@post.gmane.org>
Date: Fri, 29 May 2009 22:29:56 -0700
X-Google-Sender-Auth: abc54d67f4d136af
Message-ID: <b6ebd0a50905292229o2eb248f0le26870ccca102657@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 1/4] Remove references to base_set_filespath()from recipes that don't need it.
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
X-List-Received-Date: Sat, 30 May 2009 05:38:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, May 29, 2009 at 5:48 PM, Michael Smith <msmith@cbnco.com> wrote:
> Michael Smith <msmith <at> cbnco.com> writes:
>
>>
>> These recipes are covered by the default FILESPATHPKG setting.
>>
>> Signed-off-by: Michael Smith <msmith <at> cbnco.com>
>> ---
>
> ping
>
> (patchbundle here:
> http://patchwork.openembedded.org/bundle/msmith%40cbnco.com/nuke_base_set_filespath_usage/ )

Looks fine to me.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


