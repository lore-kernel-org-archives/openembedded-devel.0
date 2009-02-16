Received: from [209.85.218.164] (helo=mail-bw0-f164.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LZ774-000886-4z
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Feb 2009 18:18:34 +0100
Received: by bwz8 with SMTP id 8so1464380bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2009 09:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=WarbS0QBF9+Ak0g8q0m5bAvb/yiYpASRVti3FndKsPU=;
	b=gz0SG0CNByyGBvx4M9kCAeH1W4FAwqp6OHLbkzNWKm0pxEmtfE5Q3Qaxt6km4pFXyj
	fa2fOQINs+L7fcffQhTOuTS5ccsi6jHC/pCho/fCvJ1eUlO807Bym/XXMTRtCLBDWbbK
	rGFMuvp3Of3sfoc33negvyhONfJwu0hnoaiIY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=ET49dvcpq/Fc1B3CVmeUaZpCiHfapNZV5ZoIN0o8OiFvHddx5BjhI2jTzrmS3oqxMu
	k46RlzgW3HWb5lQEd25uniRcTSs2UmnJoWeRpBcIPOKMY2sIaevwBEpz/xvD77TzLT8V
	ZUAOtkHGu7vv6dbkmwany7cv1VIF69sypxNcU=
Received: by 10.103.244.4 with SMTP id w4mr1903220mur.90.1234804599074;
	Mon, 16 Feb 2009 09:16:39 -0800 (PST)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id l20sm3630067uga.44.2009.02.16.09.16.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Feb 2009 09:16:38 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id A0184610067; Mon, 16 Feb 2009 14:16:34 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <1234795059.5643.2.camel@EPBYMINW0568>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Mon, 16 Feb 2009 14:16:34 -0300
In-Reply-To: <1234795059.5643.2.camel@EPBYMINW0568> (Ihar Hrachyshka's message
	of "Mon, 16 Feb 2009 16:37:39 +0200")
Message-ID: <87ljs6fgjx.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Subject: Re: [PATCH] neon: bump version to 0.28.3
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
X-List-Received-Date: Mon, 16 Feb 2009 17:18:34 -0000
Content-Type: text/plain; charset=us-ascii

Ihar Hrachyshka <ihar.hrachyshka@gmail.com> writes:

> Seems that current neon versions doesn't work with gnutls 2.x

In this case I belive it could be droped; what others think?

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


