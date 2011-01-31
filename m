Received: from mail-qy0-f193.google.com ([209.85.216.193])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sujak.marek@gmail.com>) id 1PjpNU-0002K1-QD
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 09:44:52 +0100
Received: by qyl38 with SMTP id 38so750561qyl.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 00:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=jS3dA3oL3D8yj5jjf0x9swCNTCyNfUmZiFK+mxMUcWo=;
	b=PS6vORIe8zJNx02UY9Ci0lwzTI4hHhHJpwCH30fxn/deyanbCg317fsuFT3CRGifoB
	K4WxYK6ve+1R/PsQRMcP+EDf1TKYcTp/sx/QIh1pQaYzl2hnjGwOK+w3zO3oXRjI6JVB
	R3XqKSTD1vpVT50VjXeCqA4KzCjk+dHC1evLk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=DaoZc9mk7muHfp4SpJfw0JGaDIkhoXE8metMLrbdygYa6lTSK5vXuPG5jzt3tfDbt+
	/HjM1xs3ELDgUYZMSvOD+h1pkAVn8TsRnS1CQrL38a5vIjIepjFghAuZSOvek9da1O9d
	bqkLePAbzWtwAUJ2R5N48MeWI99VvG0XpKay0=
MIME-Version: 1.0
Received: by 10.224.60.74 with SMTP id o10mr4440235qah.317.1296463439217; Mon,
	31 Jan 2011 00:43:59 -0800 (PST)
Received: by 10.220.188.3 with HTTP; Mon, 31 Jan 2011 00:43:58 -0800 (PST)
In-Reply-To: <20110129140758.GM2466@ibawizard.net>
References: <1296220046-14636-1-git-send-email-sujak.marek@gmail.com>
	<20110129140758.GM2466@ibawizard.net>
Date: Mon, 31 Jan 2011 09:43:58 +0100
Message-ID: <AANLkTikMy0Hw9Yi3B1fHoDbF5jq_J8DaS3vPT+bGs=6h@mail.gmail.com>
From: Marek Sujak <sujak.marek@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v2] barebox: added recipe for barebox v 2010.10
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
X-List-Received-Date: Mon, 31 Jan 2011 08:44:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
> Duplicate DP=-1 and you can drop the comment also, it's wrong anyway.
>

Done.  Should be removed in Patch v3. I was unable to git cherry-pick ... so
i rather cloned whole repository and make patch again.

Thanks
Marek

