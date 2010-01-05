Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NRyqy-00080b-VV
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 03:09:04 +0100
Received: by ywh8 with SMTP id 8so15677967ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2010 18:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:cc:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=/Cdi9brxy6WHX3CsxyyBml72FTl3/d2iEm6w/6zxCBc=;
	b=oiIE9PX9UH7ZK5yBCm79rNvTUgjcd7zSXdhc8Db5HsdPKPb07MfadnBz2Y55N3ozw+
	hQdC0bfRqipqt/I8JJPf3WJ9i8d4Bsnaq0wyA07rrwmVaSjKnDphwc6iYNJflHhOf4TS
	JeP8QuylDrFfIUAJnIyGTPx9IWOfjwQigWilM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:cc:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=POSnHyFyTh6hm5GC6X5eZ/xVDFp+2a6B3bG8nKiZ2z9VcaeOIiT3OVJBMy88A+Aicd
	coMbCNli7wbmWqtUUXx9zJfPOZO+bgHB0dg1LGDx5TVw52quyr1gMTM4CKsVjsQ+iz9D
	S1Ax33HRHqDhOs2RKMPdrV9qucTa3cDcuzmW8=
Received: by 10.150.250.1 with SMTP id x1mr21093382ybh.86.1262657217238;
	Mon, 04 Jan 2010 18:06:57 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.101.56])
	by mx.google.com with ESMTPS id 21sm7547945yxe.37.2010.01.04.18.06.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 04 Jan 2010 18:06:56 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u5zi1ghgmn1qzu@guohr-laptop-ubuntu>
	<201001040357.33204.holger+oe@freyther.de>
	<4B42044B.8050801@nospam.arcornews.de>
Date: Tue, 05 Jan 2010 10:06:47 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u51etl01mn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <4B42044B.8050801@nospam.arcornews.de>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Holger Freyther <freyther@inf.fu-berlin.de>
Subject: Re: why we don't setup a buildbot for openembedded QA?
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
X-List-Received-Date: Tue, 05 Jan 2010 02:09:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

No, I am not talking about tinderbox but buildbot. I want to setup a  =

public buildbot and validate every possible combinations of openembedded=
.  =

In another words, I want to do some QA jobs of openembedded.

Of course, I need help and support from all of you. I want a public serv=
er  =

which runs python and twist and I also want any volunteer can provide  =

their machine as build slaver when it is available.

Thanks a lot!

=E5=9C=A8 Mon, 04 Jan 2010 23:07:55 +0800=EF=BC=8CRolf Leggewie  =

<no2spam@nospam.arcornews.de> =E5=86=99=E9=81=93:

> Holger Hans Peter Freyther wrote:
>> The other is the tinderbox setup will soon gain a waterfall view[...]=

>
> I thought I updated the necessary code about a month ago, no? I'm not
> sure how the feature is supposed to be used, but isn't
> http://tinderbox.openembedded.net/waterfall/ what you are talking abou=
t?
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


