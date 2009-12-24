Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NNn7t-00023x-AS
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 13:49:12 +0100
Received: by pwi18 with SMTP id 18so4919317pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 04:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=5Aky4SEknRdF+KQ/5J10TsSE+uoNuSGS5G7oBTcDoGg=;
	b=ZaHfkSXCXqxjZWE1k/2HfQafdaj5q/mO4efu0GVFiVK5PnmcUSJpJm7KySPrrp4xs7
	AiYFNIDtAxrq77Wluvp2+yNsS/FRd1Qxa5mxeIiLcHTUFaDS5ksF2uTn8aHiYc7iYtew
	4CrvUpJi6FhBZ/E7yeL3tqMSWTXcmSLGAybm0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=JFPwSd7ZmyO/v9G6wRA9DDrsDT7AeSUViuTB6sURA8O04V/H5AlthhmLiDkYZgOo7C
	0XDrFtYN4wkT/IFKyjFY8zEocxF21PHhl+kxqmMJEi2nhfRX5/Wzsi8nYEPzCmx0sSYJ
	mpwqpksHToVOG6wpoZt03n0icAiUjPPaDz5y0=
Received: by 10.141.130.16 with SMTP id h16mr7898889rvn.38.1261658834793;
	Thu, 24 Dec 2009 04:47:14 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.101])
	by mx.google.com with ESMTPS id 22sm7758458pzk.14.2009.12.24.04.47.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Dec 2009 04:47:14 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1260868213-26276-1-git-send-email-camelguo@gmail.com>
	<200912241344.17294.holger+oe@freyther.de>
Date: Thu, 24 Dec 2009 20:47:03 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5f0gpkcmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <200912241344.17294.holger+oe@freyther.de>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Enable --ignore-deps options to access regular expression string
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
X-List-Received-Date: Thu, 24 Dec 2009 12:49:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

I am very happy  :)

=E5=9C=A8 Thu, 24 Dec 2009 20:44:17 +0800=EF=BC=8CHolger Hans Peter Frey=
ther  =

<holger+oe@freyther.de> =E5=86=99=E9=81=93:

> On Tuesday 15 December 2009 10:10:13 Guo Hongruan wrote:
>> 1. Add a function named re_match_strings(target,strings), to match
>>    target using the string in strings which can be regular expression=

>
> I pushed this to 1.10 and master of bitbake. thanks a lot
>
> regards
> 	z.
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


