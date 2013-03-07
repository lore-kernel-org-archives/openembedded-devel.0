Received: from mail-oa0-f44.google.com ([209.85.219.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UDcGK-0007Cy-LA
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 15:57:41 +0100
Received: by mail-oa0-f44.google.com with SMTP id h1so647598oag.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 06:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=w+pOc/+/kbz45gb5kyBhKuaUhCDb699rMtae5jVULts=;
	b=c15yK13xwOcZwWcfnbRAInNUYf/vK/YqAaPgmhZkJiYshHY96mL36Q+UZyHVQk0L2X
	ykzA2fU65kd8P6qahdCdHwqU6ukO+Pm23NcD9KBrG/pdHfaFytbigKS6FBlcmgDkhRE+
	VsfW1UfBSrJgf4/SABUwQ30DylMZuHZJxlo2k00cmknACSRzr4kmePADgqn6dUG+nzuU
	epBNoevAXarbiCbfpDvbwN3HkoT/YoLmnFisnCgR9ywTwUuYJet1gdcAX7STAyvi/xPg
	NvfRtwDy9kt5ZPWThRkvJd97O7Z5WnV3M0RIVLS81UY558uMuBF/Odm4zKy57Qmiv/2z
	7o8g==
MIME-Version: 1.0
X-Received: by 10.60.8.197 with SMTP id t5mr26911057oea.4.1362667267937; Thu,
	07 Mar 2013 06:41:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Thu, 7 Mar 2013 06:41:07 -0800 (PST)
In-Reply-To: <9088096.rvOOlWx1VE@helios>
References: <1362649839-9160-1-git-send-email-koen@dominion.thruhere.net>
	<20130307130435.GI32228@jama.dyndns-home.com>
	<E780D109-3D15-488F-8CC9-F6829BEE90F1@dominion.thruhere.net>
	<9088096.rvOOlWx1VE@helios>
Date: Thu, 7 Mar 2013 11:41:07 -0300
X-Google-Sender-Auth: j4CBzVxegJ-u1IouTdhkP6i5_EE
Message-ID: <CAP9ODKp1bpin38S3QHaR1s47B9gSxmoMUckWY=NpS_FtB0rVYg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [meta-kde][PATCH 3/3] README: update contributor list
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
X-List-Received-Date: Thu, 07 Mar 2013 14:57:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 7, 2013 at 11:35 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Thursday 07 March 2013 15:03:17 Koen Kooi wrote:
>> Op 7 mrt. 2013, om 14:04 heeft Martin Jansa <martin.jansa@gmail.com> het
>> volgende geschreven:
>> > It would be nice to know yocto-1.4 release name in advance and name it
>> > the same as branch in oe-core/meta-oe will be (denzil, danny, ...), but
>> > I guess it can be renamed later.
>>
>> For angstrom I'm going to use 'yocto-1.4' in the branch name, I have trouble
>> remembering which names maps to which release. And the Yocto compliance
>> program talks about 1.3, .14 etc, not about codenames.
>
> Wouldn't it be worth us trying to standardise rather than all doing our own
> thing and users having to figure out what matches up between different layers?
> If others feel the same as you, then maybe we should all be using that schema.

Or we use a codename or we don't.

For me, codenames work fine but for users it is sometimes confusing as
the website and marketing people talk about Yocto 1.3 or 1.4 while the
involved people talk about codenames. So I find myself explaining it
over and over again.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


