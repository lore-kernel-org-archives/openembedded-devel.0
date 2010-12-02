Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PO3bR-0007P9-6L
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Dec 2010 08:29:17 +0100
Received: by gxk20 with SMTP id 20so4030846gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Dec 2010 23:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=cJgx/vQmfvsfijaJdwZhqT2RbhRiZ+jCPrbYmqn1BXw=;
	b=vE4QOWUeI0VA3jcgvXAbzPVBREQ7/l320B5YACIcWiqKSy/geCd800PGrEi4BkrN3u
	h2wANcKeswM/pBW/m6XHujLyj+YzEKro+GMiDFAnlrkm/W8hD/ocf4RVApp7TkSPk9Pb
	JDfgeVCEL1QyxJ9yxxy8zqkcDxzMihpKxGnUI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=PfXiOz9nYrHawNGH620224jdw6e2bElOrT1mCZuxJuTc7DFc+2SgFdtyurgx73JSqQ
	QdKUsW8i41uNOYu9aAww3mpGhvUpSno1D+qifGQOXrI4B6HEdq+Rd2PIn6iZh9zjyzPc
	7NcF/WsoheMoEMYW5XdFNHbDEthJdFhWHVwSA=
Received: by 10.91.10.21 with SMTP id n21mr772422agi.75.1291274873951; Wed, 01
	Dec 2010 23:27:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Wed, 1 Dec 2010 23:27:33 -0800 (PST)
In-Reply-To: <AANLkTinNkkHvb2SSZToTO1RwqZaOXo1qX=qsuWm76Bi8@mail.gmail.com>
References: <20101130182855.GA5759@gmail.com>
	<20101130184222.GA19832@excalibur.local>
	<201012010840.49388.marcin@juszkiewicz.com.pl>
	<AANLkTinNkkHvb2SSZToTO1RwqZaOXo1qX=qsuWm76Bi8@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Dec 2010 23:27:33 -0800
Message-ID: <AANLkTim974KS=FNKsJZPk-Lqcb0jY+zV=mk=3T+Sss5U@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Commit Access for Graham Gower (grg)
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
X-List-Received-Date: Thu, 02 Dec 2010 07:29:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/12/1 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> 2010/12/1 Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>:
>> Dnia wtorek, 30 listopada 2010 o 19:42:23 Stefan Schmidt napisa=C5=82(a)=
:
>>
>>> Indeed. Actually I wonder why he does not already have commit access.
>>
>> I am also surprised - I thought that he has r/w already.
>>
>> So I support giving r/w access to Graham Gower.
>>
>> Regards,
>> --
>> JID: =C2=A0 =C2=A0 =C2=A0hrw@jabber.org
>> Website: =C2=A0http://marcin.juszkiewicz.com.pl/
>> LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz
>
> +1 from me too (actually I thought too this was already discussed and don=
e).


With this note. Graham can you send your ssh key to Cliff Brake
or me.

>
> Frans.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


