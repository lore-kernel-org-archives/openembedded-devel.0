Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NT9uf-0005nT-6x
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2010 09:09:44 +0100
Received: by pwi18 with SMTP id 18so12391632pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jan 2010 00:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=MrcOy9bbG9g0KTqRnGH6C8bkFcsJCSMGQuwCCRoYEho=;
	b=V7W5zX5X32JiOAgIfcvgbIe5OlLXPcarqHS5DzwU7sPqKiYU/RPzcrEayBowFYNcsS
	3Hy8uhsSJnA7La/BXkyK0RrVlM64GvbILixcHAxetoMiXepWe7ZKwvS6O8zq1hyAu16S
	NXU8lgCKQZAILCJQx3UBklVx0fhnCg/kM4MwU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=LbeU7y1P7ZHC44XGaWMaoeEoyiMn5cSwCs3lXYob95Qqi1f++ch9UUqvQaFsGWwZ1b
	Vs5FWJQ8rrcn8r790m1ttNQ1lydlGWhQSw7TO4hn6+1Ne3fOuA6oDhNqOMFFpoztsa0V
	GHRK6FnheI20PFUOy2uCXxMUmv7QMprVWzX9g=
Received: by 10.140.58.17 with SMTP id g17mr5885820rva.56.1262938054594;
	Fri, 08 Jan 2010 00:07:34 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.54.97.2])
	by mx.google.com with ESMTPS id 21sm18505101pzk.11.2010.01.08.00.07.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 Jan 2010 00:07:33 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <4B46E623.9030005@gmail.com>
Date: Fri, 08 Jan 2010 16:07:28 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u57fiqskmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <4B46E623.9030005@gmail.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How to extract OE cross toolchain?
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
X-List-Received-Date: Fri, 08 Jan 2010 08:09:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

bitbake meta-toolchain

You can export toolchain and header files, libraries for application  =

development.

Hope it is what you want.

=E5=9C=A8 Fri, 08 Jan 2010 16:00:35 +0800=EF=BC=8CDmitry Vinokurov  =

<d.vinokuroff@gmail.com> =E5=86=99=E9=81=93:

> Hello,
>
> I've got an OE building host and some development hosts with same  =

> hardware platform and same GNU/Linux distribution. I wonder, is it  =

> possible to extract cross toolchain, builded on OE host, to deb packag=
e  =

> for example?
>
> Thanks.
>


-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


