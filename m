Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LlbXp-0008LH-Jz
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 05:13:49 +0100
Received: by qw-out-1920.google.com with SMTP id 5so874847qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Mar 2009 21:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=YMWFs0QUhBfpA41WicP/okF3wsufdh1yV0E4i3ZXpyg=;
	b=Pd6X6NTcXBxuj/nUbTbc6r00GesDYmVizxu8cZyfI2dXB2nsELgMR7o4YNPxFN73aT
	IIC7y7QdcNcSN9zikkG/CRkIWAXGO6cfQMeag5B901iEb53UkM9xUj77+xgddpqKMdIE
	TqfyhEnfPa41hFp0bNyX0V50jhepO7VABnpbw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=uKGw80dAgAF9VrnT2V2R9S4qJyE3XehBDLa2n1Knb9f2MQklSFL5QoGZCGv/9x0moa
	qWxCKxkzVAf7QUwaDMKkepjtTj4IIOkuVGroo2ddB9ianmWvWoiuJj89JolryFlG4t3N
	5y7lzZXi3L/eRBSznQE5sVarqTCBxZ9xfhC9I=
Received: by 10.224.74.11 with SMTP id s11mr8243770qaj.326.1237781549730;
	Sun, 22 Mar 2009 21:12:29 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm8766913ywn.52.2009.03.22.21.12.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 22 Mar 2009 21:12:29 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id E9FD06100DF; Mon, 23 Mar 2009 01:12:25 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <49BFA406.6030802@bolloretelecom.eu>
	<20090317143526.3e79150c@vanille.zapto.org>
	<49BFADB1.3090207@bolloretelecom.eu> <20090317171705.208a7d31@kmfms>
	<49C107E3.30505@bolloretelecom.eu> <gpr569$535$1@ger.gmane.org>
	<1d6c95c90903201026g709b2adfja5f5a6f8384cc798@mail.gmail.com>
User-Agent: Microsoft Gnus Express, Build 5.13 (5.13)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Mon, 23 Mar 2009 01:12:25 -0300
In-Reply-To: <1d6c95c90903201026g709b2adfja5f5a6f8384cc798@mail.gmail.com>
	(Aloisio Almeida's message of "Fri, 20 Mar 2009 14:26:53 -0300")
Message-ID: <87bprs6fo6.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: Dropping qtopia-core-4.3.3.bb and qtopia4core.bbclass
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
X-List-Received-Date: Mon, 23 Mar 2009 04:13:49 -0000
Content-Type: text/plain; charset=us-ascii

Aloisio Almeida <aloisio.almeida@openbossa.org> writes:


[...]

> I'm still testing the new bbclasses to build qt-4.5.0. When I finish,
> I'll send the patch to this list for comments.

[...]

I'm looking forward to Qt 4.5 support :-D

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


