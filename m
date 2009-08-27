Received: from [209.85.221.196] (helo=mail-qy0-f196.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1Mgd10-0006pU-7a
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Aug 2009 13:19:38 +0200
Received: by qyk34 with SMTP id 34so462545qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2009 04:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KA+TTnCYFHh/Ba7qtJE+gNPtGBA6JM/W/DH+UVFQDHw=;
	b=bVf141ektT7/uUOcKd6gAQr1ByWV87O0AJioFfILAG3K4xEfs0+4Usghu3+H2J5+hD
	InFPTGQKhL8uqeOvMQOnSkszpG2XBObUqpv5mjhnmXrbdB4KQJBcK7FhSMhlTssndd6z
	uo5itkUpuaz0gT4DHIY0edbtKSII7zljeIzqo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BG4UsT/hXeI7Wa5O+05V2aUe241nKchRpJ7ainoxTfJs0cxmEjhmyv9NPKIVNPDsxB
	YmjqMknnp2SMlgsUu2LAid+1yCBMkZdHcDxVltL/Q9HveyhYIO6MEgEB17giiiPt9ulq
	XJwT9pDfgH5aVaE4JZjSPc14vVI9TV2X3dsc8=
MIME-Version: 1.0
Received: by 10.229.40.200 with SMTP id l8mr2708274qce.104.1251370893259; Thu, 
	27 Aug 2009 04:01:33 -0700 (PDT)
In-Reply-To: <1251370014.27780.13.camel@mill.internal.reciva.com>
References: <4A94E1CC.2090404@gmail.com>
	<1251370014.27780.13.camel@mill.internal.reciva.com>
Date: Thu, 27 Aug 2009 20:31:33 +0930
Message-ID: <6ec4247d0908270401o888561ka557ed55ff6f99a@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] enca_1.9.bb: remove unused configure test which is bound to fail.
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
X-List-Received-Date: Thu, 27 Aug 2009 11:19:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/8/27 Phil Blundell <pb@reciva.com>:
>
> Do you have commit access or do you want me to check it in for you?

I don't have commit access, so if you could commit it that would be great.

-Graham


