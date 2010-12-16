Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PT9h8-0004YR-Ri
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 10:00:15 +0100
Received: by iwn8 with SMTP id 8so3241342iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Dec 2010 00:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=R0bYXQJII2LuZJupEijjC5CTG5lFbU7G7mOA0TJtZ+k=;
	b=vvWjqHX6N16qPKIQdBiLR8q/HjV6WImfuHn9QGA1gkMwkVcGmnSfYgr+lm40/BxygZ
	B3NuDLjYGBobqIcFxxhsoWtVrY61CK+oafEmTRKBu/NN008QPKilcbdWx+8Vg8mYZ57J
	wNxpqITfnpG3GrCTiI3EJf/Fkr7dfXaPo7ztw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ae8shTusZhH3v1uyJuzLSs1anvla73bBgmIMHHU20cQVZ4F14NGeaY0f25eWsV+k+A
	MQ41wSvvh5iZi1+QNvHlGiwlXZ092oWPWbal7Xaw7ZBNXuUtu0rVhIcOzOuWwPT5Ud7r
	ZverOncX9zhjzLgPt5kjVReCKOxoIeibVj/7I=
MIME-Version: 1.0
Received: by 10.231.31.1 with SMTP id w1mr6029165ibc.7.1292489917689; Thu, 16
	Dec 2010 00:58:37 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Thu, 16 Dec 2010 00:58:37 -0800 (PST)
In-Reply-To: <4D095CA5.5020400@balister.org>
References: <E1PSZng-0001y3-K3@melo.openembedded.org>
	<20101214205943.GF6662@jama> <4D07DF4B.7000800@balister.org>
	<20101214215011.GG6662@jama> <4D095CA5.5020400@balister.org>
Date: Thu, 16 Dec 2010 09:58:37 +0100
Message-ID: <AANLkTikKhNKT4kB4BC5Tog8bJvtzTyto9s7hRoPNW_TE@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Steve Sakoman : coreutils: experimental coreutils fix
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
X-List-Received-Date: Thu, 16 Dec 2010 09:00:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/16 Philip Balister <philip@balister.org>:
> On 12/14/2010 04:50 PM, Martin Jansa wrote:
>>
>> Then please remove all older coreutils versions which doesn't provide
>> complete set of bindir_progs, base_bindir_progs, sbindir_progs, because
>> ie coreutils-6.0 now breaks ie timeout:
>
> So it looks like we can remove the coreutils-7.2 directory since there is no
> recipe for it. Does anyone object to removing coreutils-6.0?
>
> Philip

You have my ack to remove both.
Frans


