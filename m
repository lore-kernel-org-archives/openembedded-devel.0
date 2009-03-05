Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1LfHOy-0000cn-2g
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Mar 2009 18:30:33 +0100
Received: by bwz9 with SMTP id 9so30821bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2009 09:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Ull6NRSJfpaitHM4KNynLnHyBk6XFl9CP6RUdxQsgXs=;
	b=Edk1YJ3ECi/VLX5g3aFiVwvT+wxtYV4PwGtQFqYcEnJR00H81hyJehnyyEIPsrwe03
	y4xH7P9hUUh/WUkDNn+8obG4YQ2MTHoQHepByN/ykOS++d/B7ac6O/WXk6qDl3ZY7DON
	x0Gth8NbxOlrkcZL4eEug3BNvWjh6O1FYcuC0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=W3rgeOgXI89bpeviYT6fMzNnaQ+ewwW8Y2fS2PM8crrvqCB/jivks3rXDiHaKrl7XJ
	Tecl4ZqFyqJyzuHpjeV8MKpI1bafTD1noeVOlZA/V9003FEEA7Go2YDdwwgS5WiemXkh
	LuqwYLYRbEdAD1RhDv9FpFTsDzIMKLVpqROtQ=
MIME-Version: 1.0
Received: by 10.223.118.9 with SMTP id t9mr1175947faq.20.1236273968352; Thu, 
	05 Mar 2009 09:26:08 -0800 (PST)
In-Reply-To: <1236273338.10602.182.camel@andromeda>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
	<1236182004-4523-70-git-send-email-openembedded@haerwu.biz>
	<49AF4FBD.1010209@dls.net> <20090305044711.GE26343@smtp.west.cox.net>
	<49AFC6A3.9070406@dls.net> <49AFDBA5.7000308@balister.org>
	<ac9c93b10903050700g423ba896k658be62863eede@mail.gmail.com>
	<1236273338.10602.182.camel@andromeda>
Date: Thu, 5 Mar 2009 18:26:07 +0100
Message-ID: <ac9c93b10903050926u655ffe7biee83110283aa4fe6@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: I got the point - did everyone one else? [was: Re: [PATCH 70/70]...]
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
X-List-Received-Date: Thu, 05 Mar 2009 17:30:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/3/5 Michael 'Mickey' Lauer <mickey@openmoko.org>:
> Am Donnerstag, den 05.03.2009, 16:00 +0100 schrieb Frans Meulenbroeks:
>> Is the policy now to send *all* patches to the list?
>> Or only the critical ones (e.g. the ones that affect the build system
>> and core functionality)?
>
> Only critical ones. Otherwise we might as well stop developing at all.
>

Good. Then we're on the same page.
(and please bear with me if I do something wrong :-) )

Frans


