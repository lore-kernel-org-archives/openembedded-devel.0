Received: from [209.85.128.186] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LmBVf-0002hW-J9
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Mar 2009 19:37:59 +0100
Received: by fk-out-0910.google.com with SMTP id z22so1001559fkz.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Mar 2009 11:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=RCqgTJ1Z3VHOMm5+soDrHDyksuA0w/y1CqNhPx/37AY=;
	b=v4DElKY2ryoZ+APoCm1P42pxy9FoM9n/fQRpvgjfp4A08tx7ed7GsZ/ZGZyl4kyJrd
	rauX7dWkyVO0KDkXQ1dQgBpkHvZSwzek5J9oh6ykg646PecT+qZp5mlG6KVM3IRARGlS
	K3LDbmr8IoEzwx6zST9FOSmfORyBcpUuS0zBo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=g1m4qefIpDK/bWwiVJWKGzl617+ORUexoGw8tmXLCRpp+bUUtbXGQj6/16+aWZGZ5o
	nzLWb+7qYFgqhNRgbbsrLd5IYrE+Cf5kvMdz7xD2mKRQDUxhDNdM7WQ29noy3iHybP16
	Yfuryg1QQW0dTIfyY8q+fhDtCw4nusrtXO6ag=
MIME-Version: 1.0
Received: by 10.223.127.4 with SMTP id e4mr7336009fas.100.1237919789615; Tue, 
	24 Mar 2009 11:36:29 -0700 (PDT)
In-Reply-To: <b6ebd0a50903240808p4e07c61g6a088df634e161b2@mail.gmail.com>
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>
	<b6ebd0a50903231335y1ddfcb3bpd447b646e18d439a@mail.gmail.com>
	<1237885606.5348.8.camel@dax.rpnet.com>
	<b6ebd0a50903240808p4e07c61g6a088df634e161b2@mail.gmail.com>
Date: Tue, 24 Mar 2009 19:36:29 +0100
Message-ID: <ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Package Maintenance
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
X-List-Received-Date: Tue, 24 Mar 2009 18:37:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Disadvantage of a Maintainers file is that it is yet another file to
update when you create a package (adjacent to the checksums file and
of course the package recipe). Guess it will be forgotten regularly.

Also I fear we're going to end up with a lot of orphaned packages.

Frans


