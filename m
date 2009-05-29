Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MA5Mx-0007Uk-TY
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 May 2009 18:55:48 +0200
Received: by qw-out-1920.google.com with SMTP id 14so2013130qwa.36
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 May 2009 09:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=UIQOncrKg5sw4cLoC/ilEDkMq+NJ9GsynRo/FLdrhyc=;
	b=G5XV9WspTbHSPAx+JZDTvV31LLMymSSRjds3IjLOodAMyR8d5hc25sb8eYY2bHCebH
	RwCzP+y7geDy0x2s4sjCV4R3o2xC2K+/qfGmj4XzGoYibQ+nw/IqFAfaAKET6HCqTagy
	8t3yYcypER8YCIuXbaNZRRDERgAgz7L47OAig=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type
	:content-transfer-encoding;
	b=j523gOgkfdoAgliL9frG8Nc8APqCDEDH+CVLYgfis+EWnWCG7/54bI34c6ajuZFJhW
	oMOfYWl2wuCdTZTmihAF7/ZWhvt658/CwoP4+oIrATQ3fsnw0JEkSnI7/rkRVaX/xctq
	IrdizGiGGZ1ogP1gwxjBLhnHmw9eRClbuTp7w=
Received: by 10.220.95.194 with SMTP id e2mr2691624vcn.65.1243615641405;
	Fri, 29 May 2009 09:47:21 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 9sm4340498yxs.3.2009.05.29.09.47.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 29 May 2009 09:47:17 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id E66ACC495BC; Fri, 29 May 2009 13:47:23 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <4A1F82D2.6020707@bolloretelecom.eu> <gvo5v8$1ef$1@ger.gmane.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.94 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Fri, 29 May 2009 13:47:23 -0300
In-Reply-To: <gvo5v8$1ef$1@ger.gmane.org> (Koen Kooi's message of "Fri, 29 May
	2009 10:22:00 +0200")
Message-ID: <87iqjjonz8.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: libx11 1.2 problems (dolt vs. libtool)
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
X-List-Received-Date: Fri, 29 May 2009 16:55:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Mario,

Koen Kooi <k.kooi@student.utwente.nl> writes:

> On 29-05-09 08:38, Jeremy Lain=C3=A9 wrote:

[...]

> Powerpc is in the dolt whitelist (upstream, not OE), we already see
> this problem with webkit, and solve it in the exact same way.

It looks like OE people is having same issue that us had while updating
our internal tree for X 1.6.1 and would be nice if you could get a patch
handy for them.

Can you take a look into that?

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


