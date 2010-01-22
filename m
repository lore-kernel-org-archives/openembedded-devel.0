Received: from mail-gx0-f227.google.com ([209.85.217.227])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NYFkV-0007g9-8B
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 10:24:18 +0100
Received: by gxk27 with SMTP id 27so903476gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 01:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=/wN3+WxB4uoXGTFVpkHY4X4LPSKABOSR1rxe8IBV9Lo=;
	b=wyWUw0d3dleXH78Q199WSifXOLQsEaEVi56Z7fHqfmwnDS41gkNyRWtEpeJBJVCzgC
	EAuji5gp1rKOFQF6d8ruoqAwkW486JLY00qxNq/Uh4DTDEDx/pwnEDnJK8jZarMXm/yV
	5j0ocbGKKM9eVkxGkSDfQ7QvBf/JB7AWXd3MQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=IzAnYT8LXLlWxNkbGRIBNdXTylys/rVZKLi94Q0t9CEPTBQWMIzfhLndLHviy4AAlT
	RVJVTV4vk5cp1WgTH6hh7CU6TzPZ1X1aj/z8OIJCZe/Mi0UtzgB+iimCYD3gRXv13b70
	Dv4Rwi4LeIaJLuL0QS1mDmq0UPjb/UWMl6ToU=
Received: by 10.150.4.7 with SMTP id 7mr3663511ybd.241.1264152096574;
	Fri, 22 Jan 2010 01:21:36 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.71.84])
	by mx.google.com with ESMTPS id 6sm728063ywd.37.2010.01.22.01.21.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 22 Jan 2010 01:21:35 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u6w9m4x2mn1qzu@guohr-laptop-ubuntu>
	<19c1b8a91001212304l1bb94efdr81be0ea00b973118@mail.gmail.com>
	<op.u6w94dibmn1qzu@guohr-laptop-ubuntu>
	<201001221018.14750.holger+oe@freyther.de>
Date: Fri, 22 Jan 2010 17:21:26 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6xf90fjmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <201001221018.14750.holger+oe@freyther.de>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.217.227
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: how to generate files in site directory
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
X-List-Received-Date: Fri, 22 Jan 2010 09:24:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

It is what I want

=E5=9C=A8 Fri, 22 Jan 2010 17:18:14 +0800=EF=BC=8CHolger Hans Peter Frey=
ther  =

<holger+oe@freyther.de> =E5=86=99=E9=81=93:

> On Friday 22 January 2010 08:08:27 Guo Hongruan wrote:
>> Yeah, I am trying to do it this way, just hoping I will not forget so=
me
>> important values.
>>
>> It will be wonderful if there is some way to generate it automaticall=
y.
>
> See contrib/site-conf/README. You are invited to copy more/all macros =
 =

> used
> into this.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


