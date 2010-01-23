Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NYcjA-00007f-6a
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 10:56:27 +0100
Received: by yxe5 with SMTP id 5so1649118yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 01:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=pshf6/hugTd6yTknLKpQwOFm2HkpYsdMoFyYTg5SeBY=;
	b=tR7rWJA5OmU988WbxMUhkb+Z4fqPDaFhecXIWalB4OGkoBoOpnW3GoEq79Yr5XICt3
	88r/S4ibj5cHaERQVAyEzxqNNRpxX5GIPAjqzeQFnQIjOC69206xSc3x5pCyiRgaHh5L
	/5FvLNEnlEx3CwWIncRLlS5ngbP3ah8QuXr4Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=ZJ0BsXwTyETaHqn3NK2cpR41E9SHnHP1ff8lFYRB3wsQlEmVhBouiVY0ZkFqrDklM1
	wUP6SMLHOzbLLy4+di+mb+HTrgA0p4vKWiNPiw0RdOnTA2hXW6yO9Zw3/fv5h2iSxPxn
	wEVX5w4J0OFVkLsZq+IO/AX0AvbOm18Nuhl0U=
Received: by 10.91.17.25 with SMTP id u25mr3676213agi.68.1264240445174;
	Sat, 23 Jan 2010 01:54:05 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.71.84])
	by mx.google.com with ESMTPS id 4sm1097979ywd.44.2010.01.23.01.54.01
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Jan 2010 01:54:04 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <> <1264239785-28226-1-git-send-email-camelguo@gmail.com>
	<201001231050.38823.holger+oe@freyther.de>
Date: Sat, 23 Jan 2010 17:53:54 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6zcfwramn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <201001231050.38823.holger+oe@freyther.de>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] linux-storcenter: add fw-and-powerpc-install.patch
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
X-List-Received-Date: Sat, 23 Jan 2010 09:56:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

the building of linux-storcenter_2.6.27.7 failed due to lack of this pat=
ch

=E5=9C=A8 Sat, 23 Jan 2010 17:50:38 +0800=EF=BC=8CHolger Hans Peter Frey=
ther  =

<holger+oe@freyther.de> =E5=86=99=E9=81=93:

> On Saturday 23 January 2010 10:43:05 Guo Hongruan wrote:
>> * fw-and-powerpc-install.patch is included in SRC_URI of
>>  linux-storcenter_2.6.27.7.bb * but this patch is not located in
>>  linux-storcenter directory
>
>
> Your commit message does not answer what it is doing and why it is  =

> needed.
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


