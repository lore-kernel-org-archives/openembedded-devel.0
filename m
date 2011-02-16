Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ppqb3-0004GH-Qv
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 00:15:45 +0100
Received: by bwz10 with SMTP id 10so2003605bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 15:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=68zTQ+8vOYUj/QZI3lxM73UYXyGPayLgRWqJS9BXZVc=;
	b=dJqchsKopvXCwrE7z5RGc8NybqgEgZqIHZpb6IaoSWTMfqm4IAo3RGIkIzi5pnPLkL
	NdS4VJwVADQBOWUJ0L55B2AK0ej/Pyl7o34qMwavnbthPxiZaHq+LbpLFO894/v5dDWr
	ZCmLmhpxnI4q8+rWafB1TqYiJL/ZzIxDz5KqU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=Jk8vrVwRgxnpl82s+4ln41ebITYctlPeameYPkIzSIpH80LM0rCXeqS5yPQduKw2ax
	IogNZHrbqWvSFHKe7YDhhhf9EDVyNdE566pZeWltIcHBze1LGptFi2viXFYj+TIr8F+t
	bN5HUmInM9lata/dYPQM2Eb5RLUntVYD3Wg3Y=
MIME-Version: 1.0
Received: by 10.204.47.227 with SMTP id o35mr972333bkf.132.1297898073846; Wed,
	16 Feb 2011 15:14:33 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Wed, 16 Feb 2011 15:14:33 -0800 (PST)
In-Reply-To: <20110216230438.GQ14525@sakrah.homelinux.org>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-2-git-send-email-otavio@ossystems.com.br>
	<20110216230438.GQ14525@sakrah.homelinux.org>
Date: Wed, 16 Feb 2011 23:14:33 +0000
X-Google-Sender-Auth: g2_1xG5Hsqh1P4n5LT6zbXnJb8A
Message-ID: <AANLkTi=3FiQZFfdXX0jxRm=EN3qEqDGdG9X5SU9=p4aP@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org, 
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 02/13] python-dbus: update to 0.83.2 and fix rpath to use absolute path
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
X-List-Received-Date: Wed, 16 Feb 2011 23:15:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 16, 2011 at 23:04, Khem Raj <raj.khem@gmail.com> wrote:
> why is PR different then 'mlX'

Any specific reason to use mlX? Most recipes use rX so I changed it while o=
n it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


