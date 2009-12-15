Received: from mail-px0-f183.google.com ([209.85.216.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NKUco-0003KA-U4
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Dec 2009 11:27:30 +0100
Received: by pxi13 with SMTP id 13so2863803pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2009 02:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:mime-version:content-transfer-encoding:from:organization
	:date:message-id:in-reply-to:user-agent;
	bh=NfqoWNN+RChbyRPRpmQX0PJ8lYgXe3TGUBzBm29qKB8=;
	b=FjeZyvJDrSwJtdE64/Xp9yoEI0slaVhpZX29H3+J7CD9l5GaZjbNp9ItlI65uR1bKR
	7UqaUMNEozB4n1sP7B9X+CuFFgmqs7TnfXU7YCTvSr8SIiF4iCkNSy7HnV/eiUhgj7AI
	QZygyHJE9wfbV4io0mFquQSj3Gf7d2ehnrx4U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:mime-version
	:content-transfer-encoding:from:organization:date:message-id
	:in-reply-to:user-agent;
	b=t5qL/euHCI4VBIXbzKfo1fXFlrrtRjswYrdjM1TYF/swqZP86qPZ9MVh1XDPz55iio
	IRJvorhMkW49QDMgebkSBKaMRCidMqWuLaHyGaZkvQgQ4tlSZDLeCNiOlkL3tfLjNm4y
	m1ueH3XJTOgLAxjHz0krxAQRy9WG4KHZWPv04=
Received: by 10.142.65.22 with SMTP id n22mr1121567wfa.32.1260872739677;
	Tue, 15 Dec 2009 02:25:39 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.68.164])
	by mx.google.com with ESMTPS id 23sm5788361pzk.0.2009.12.15.02.25.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 15 Dec 2009 02:25:39 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u4y295q0mn1qzu@guohr-laptop-ubuntu>
	<1260871055.779.337.camel@mill.internal.reciva.com>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Date: Tue, 15 Dec 2009 18:25:28 +0800
Message-ID: <op.u4y5wqaymn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <1260871055.779.337.camel@mill.internal.reciva.com>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Compile eglibc for x86 failed.
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
X-List-Received-Date: Tue, 15 Dec 2009 10:27:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

Yes, it works OK on my site.

=E5=9C=A8 Tue, 15 Dec 2009 17:57:35 +0800=EF=BC=8CPhil Blundell <philb@g=
nu.org> =E5=86=99=E9=81=93:

> On Tue, 2009-12-15 at 17:28 +0800, Guo Hongruan wrote:
>> /media/work-disk/workdir/oe-mini/work/i586-oe-linux/eglibc-2.9-r4/bui=
ld-i586-oe-linux/elf/librtld.os:
>> In function `_dl_tlsdesc_dynamic':
>> (.text+0x141f5): undefined reference to `__i686.get_pc_thunk.bx'
>> collect2: ld returned 1 exit status
>
> See tls_i486.patch from recipes/glibc/files/.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Mobile: +86-0-13484056007
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


