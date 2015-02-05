Return-Path: <ashcharles@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 180A671E68
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Feb 2015 19:21:54 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id hn18so47231472igb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Feb 2015 11:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=KLv3ZBKk1qnyWy5Jz/aGoF6JKHrYXp5/Np/dQe71N6o=;
	b=rsda563Pzkh4flN6SuX/uvqBK9yWX8DTQIpy+xl0D6YAlAXpVUVKofjZ22EGyAcwUG
	eiueQSXOtZkQfCoKs1aWu0Vf5nE8SkEXS8JraA+PbDSXDRCmK+x6aBCoQ4rF7ol1aDzb
	LgvJuTtNlpHCUfKCyvZu+zwkbE8Nar2qWADeihudp/6Ca0HYdcX/MA+6UZTkwUykXCg/
	3dvxfhdjBNGB2UY3uYfTuQPuH0ZOf7ZNAnd0Ulj6UOroUfWDsnbvGcM49JfvpspLl4ds
	rp0uQXYkwC++o71B89Ya4Ic2AsdVI8LoLzrsqRA9nZMMvM761Spftl3H1gVzPfQPAbCe
	X/hQ==
X-Received: by 10.43.89.68 with SMTP id bd4mr8887210icc.63.1423164116076; Thu,
	05 Feb 2015 11:21:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.8.166 with HTTP; Thu, 5 Feb 2015 11:21:25 -0800 (PST)
In-Reply-To: <CAHQecY68g7wjJMEV3ph3ZFqAH_tdQ0JcH1AkuJkgEwkW3rXu_A@mail.gmail.com>
References: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0D86B1@dor-sms-xch01.digi.com>
	<3777411.pG0mYOicST@peggleto-mobl5.ger.corp.intel.com>
	<DA8287CC96892A4EB4FCF4FB3FBDA1AB0D891E@dor-sms-xch01.digi.com>
	<3700387.1Q9y16bqhG@peggleto-mobl5.ger.corp.intel.com>
	<C89D77F8-3BC6-412A-B220-67AD52600F5F@gmail.com>
	<CAHQecY5gQE=3tgBfAUffiw=Q3wvY3x3wN07w4G_M+Hy83bQwqw@mail.gmail.com>
	<CAK8F28kB5SDdjm76_DgReMSFJuZ60-hpHjUhnAVkPw14eELpoA@mail.gmail.com>
	<CAHQecY68g7wjJMEV3ph3ZFqAH_tdQ0JcH1AkuJkgEwkW3rXu_A@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Thu, 5 Feb 2015 11:21:25 -0800
Message-ID: <CAK8F28nBxHXyCL3uXqRy0Hgp39Gpti08dt9-880=POigXLUSxg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, "Viguera,
	Javier" <Javier.Viguera@digi.com>
Subject: Re: [meta-networking] crda-1.1.3 broken in dylan, dora, daisy and dizzy
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
X-List-Received-Date: Thu, 05 Feb 2015 19:22:03 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 5, 2015 at 11:03 AM, Tom King <ka6sox@gmail.com> wrote:
> 150GB
Estimate of monthly bandwidth?

