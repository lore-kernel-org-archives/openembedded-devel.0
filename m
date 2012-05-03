Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1SPuYU-0000OH-Vg
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 May 2012 13:50:43 +0200
Received: by obhx4 with SMTP id x4so2614250obh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 May 2012 04:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=nhBqHYM3F1qAG9BRbYCb/s0IGKibLuNqJyRmaiwUU9U=;
	b=VObvtZB+6GJ15A+SAkBmHpOYa6j6CKnzP5c8eNWdN87dHiARcK1vPP/PcHiBEIp87m
	plaLwFFWU9ayWbiZhgdsSgX0bijKApGJEHz1IH5uaSKdpfWpeKOaoe3UtaplRCTKwOG2
	w4O0OUX3/bQteqMXTLcGvrmnZjDP8WX6BRf5tcUeuksx9ShTxAhU/ycwHCFZqSLqDZ4A
	DzTBAsVRoFZFJtTsVLbQRE0U6GijMAIloSyPf+l+u7pD4AU8FtHwe4kuQtQnOGf4RqSs
	/woTXM7HRxwB/D25UJXdlGq6n7/n2Ll7wGpv7VeoWWkpzFTWHobOCkhJHifHyDaikVzJ
	m+sw==
MIME-Version: 1.0
Received: by 10.182.164.105 with SMTP id yp9mr2313994obb.75.1336045256990;
	Thu, 03 May 2012 04:40:56 -0700 (PDT)
Received: by 10.60.11.98 with HTTP; Thu, 3 May 2012 04:40:56 -0700 (PDT)
In-Reply-To: <4FA26C26.7080105@nedap.com>
References: <4FA26C26.7080105@nedap.com>
Date: Thu, 3 May 2012 13:40:56 +0200
Message-ID: <CACW_hTb3huecpjkFWmm1zXAij-_hx+NBXfrA0ou6DvafGTWtEw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: upgrading from oe-classic to oe-core
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
X-List-Received-Date: Thu, 03 May 2012 11:50:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

Op 3 mei 2012 13:29 heeft Jaap de Jong <jaap.dejong@nedap.com> het
volgende geschreven:
> Hi All,
> If I have devices running on oe-classic and I want to upgrade them to
> oe-core, will the upgrade be without worries?
> It will probably download all packages?
> Or do I have to takes special steps?

Depends on the devices and how well they are supported in yocto (e.g.
is there a bsp for them)
And on the actual packages you want to have on your device.

If you have some recipes of your own, you definitely will have some
work upgrading these.

Frans


