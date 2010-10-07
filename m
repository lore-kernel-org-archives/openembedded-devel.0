Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P3wal-0004ce-E2
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Oct 2010 21:57:28 +0200
Received: by ywl5 with SMTP id 5so97354ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 12:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=ypxpJr5zTFsmsAPCF8q+GDP3EMg6KF/b2s+2Q+hnF7I=;
	b=bcWR1YcB61+hYNr8x7g9ZGxBMwgUBozq4xgGDFlRgS+gYbSXteFQZmxCqEC0rEPeG8
	oNgHf3L5oQK6scVkTnYMLlwi4eDf7ooZjJ+XtrY0QbP4Jq+eAYk3qzhJFyiuXaH67MjD
	Gr4kj951tkKiVu2ACm8/qAS2Z2hI4S9XuPAuE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=gNrBJVdh6tLA6IEsR7qqeyb32Wqre/f9kLX4OouO/XQqA8mCFJ2ICgVA8QGEnB4Lhb
	HGax7bPVf6OmJSunoTj4j2jqca5ReOD6N7+4oGoTXv58W8yxV5Hyx+iknL8bjsM522L6
	wdL7knR9os08PuiVpyW79YzS+irgNkbjGSYZE=
MIME-Version: 1.0
Received: by 10.150.44.1 with SMTP id r1mr1678195ybr.285.1286481425173; Thu,
	07 Oct 2010 12:57:05 -0700 (PDT)
Received: by 10.151.41.5 with HTTP; Thu, 7 Oct 2010 12:57:05 -0700 (PDT)
In-Reply-To: <AANLkTimE8tt4k6nfRSbDJwZDEkecc1sfJQyB9LKtehKQ@mail.gmail.com>
References: <AANLkTimeMWsTvhkZjP+qjVJW7ynM69XcF_0WbS2VdenR@mail.gmail.com>
	<AANLkTimE8tt4k6nfRSbDJwZDEkecc1sfJQyB9LKtehKQ@mail.gmail.com>
Date: Thu, 7 Oct 2010 21:57:05 +0200
Message-ID: <AANLkTinoEE0FFA0EBC-qaNJD6EH35nN36abe2uzA5tuf@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake COMPATIBLE_MACHINE stack backtrace
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
X-List-Received-Date: Thu, 07 Oct 2010 19:57:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

Small addeddum.

Meanwhile had time to test bitbake -b with 1.10.0; this also gives the error.

Frans


