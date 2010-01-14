Received: from mail-qy0-f176.google.com ([209.85.221.176])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NVQ9C-0005rX-Pe
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 14:54:06 +0100
Received: by qyk6 with SMTP id 6so11571658qyk.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 05:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=HUKCFhFz9yJVOkC72DZANBy8lGPng+419Ft+DUt5wZw=;
	b=GI8OFJENytVyYWkp4sI7lPh94PTb2T9uA/KlyoGkRznT5fP2crPDyaECZbaTB+g3PF
	mhrNCIQe6pwIfodP8PlvuIKxjg8xPMNcjVkIpMsBpBe+T1f3wYtuK9kcvxl4NUO9sF2L
	5wRnQVKjACnj20bMMLuE3s7/AcXAMtONYXQmM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=ZBUSbb5yBY63cjqLmPZE6A1wXJnmErcviETk6j+EUmcM/myNQlg1i1wjNMywlQXYWR
	nn59KoTrV1l56Sd6biGn/DLVd0o9dvD8tYCe1p5qXPQt1SeUhiSNPHuhkhu/4W4DUM4V
	XIEEhm1MRuCOHyIsVQj5sqiTMLz6tAfdPW7II=
Received: by 10.229.102.165 with SMTP id g37mr485410qco.65.1263477111345;
	Thu, 14 Jan 2010 05:51:51 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.75])
	by mx.google.com with ESMTPS id 4sm147893ywi.54.2010.01.14.05.51.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 14 Jan 2010 05:51:50 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1263421337.3575.3.camel@dax.rpnet.com>
Date: Thu, 14 Jan 2010 21:51:38 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6izgcdsmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <1263421337.3575.3.camel@dax.rpnet.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.221.176
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: TSC Meeting 7/1/2010
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
X-List-Received-Date: Thu, 14 Jan 2010 13:54:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

=E5=9C=A8 Thu, 14 Jan 2010 06:22:17 +0800=EF=BC=8CRichard Purdie <rpurdi=
e@rpsys.net>  =

=E5=86=99=E9=81=93:

> The QA issues are not something the TSC can really "rule" on. Yes
> testing is good but we have no hardware or human resources we can assi=
gn
> to this. Where a regression is identified as being from a particular
> commit, it is expected the regression should be fixed though.

The first goal of QA could be making sure that every (machine, distro,  =

libc) combinations with default configuration will be built smoothly. In=
  =

fact, I am trying to test them.

To achieve this goal, we don't need lots of human resources but several =
 =

computers. We can develop a automation test Mechanism just like auttest =
 =

using by linux kernel developing.

Thanks a lot!

-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


