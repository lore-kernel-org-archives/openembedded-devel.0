Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PNL9H-0006QA-Fz
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 09:01:15 +0100
Received: by iwn8 with SMTP id 8so4189950iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 23:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=oJPpBrms8rpXXon+GoAYwN6mPHl7pJgHjSlXFZVb97Q=;
	b=RBobt3OyXcutJPBBf8SvjguRNzWYPsO7Siz5ExePtEmHHL4iQw9HxwDbLi/zY1JJjL
	u8I0y6DS63MhKFciP6Wbp9pieLo82Cr6Lz9jpAHGXMgnNvuNuUS7Z3DIwNYWZNZLs0tr
	ArkBdsY1RsUnMrqt4bWnwraiwnefeDDjm8mDQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=SucN5+u/ENCa5pJhTeMY55/dv5Wf6IVkP0bbpnvSVPEAWi62g9qjRIozusyIkfuIm9
	g2KMPtOaOikbt3UtYXzxuOo2LzM5xjeCNlpLnLe6KTTu6GxPhKW69iKKzCrPOBP7pAO3
	qsp+RXnnoX1MhFdMTbTgVenwU+3IVWDkFUsZ0=
MIME-Version: 1.0
Received: by 10.231.14.10 with SMTP id e10mr6900963iba.132.1291103995633; Mon,
	29 Nov 2010 23:59:55 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Mon, 29 Nov 2010 23:59:55 -0800 (PST)
In-Reply-To: <AANLkTinqmryB1Ofe2gDV959h2cLbLkrC-ZohbgrPMicA@mail.gmail.com>
References: <AANLkTinyc8Pnpd3XMnTu=psPPHAmGKi4+DjvgWhSE1jt@mail.gmail.com>
	<AANLkTinqmryB1Ofe2gDV959h2cLbLkrC-ZohbgrPMicA@mail.gmail.com>
Date: Tue, 30 Nov 2010 08:59:55 +0100
Message-ID: <AANLkTinJmmVgtmcuO8pybJBAZL8BxkD2Kn2ipsQ0fx3+@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release-2010 - last moment hot fixes
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
X-List-Received-Date: Tue, 30 Nov 2010 08:01:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Oh btw, I strongly suggest that we also try to solve the multiple
providers thing.
I've seen it for mysqlclient, depmod and one other package and have
reported this a few times.
I do not feel myself sufficiently empowered to remove the old provider
or add a pinning or so.

Frans


