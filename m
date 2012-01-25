Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Rq6qC-0003Xe-49
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 18:41:00 +0100
Received: by vcbfk26 with SMTP id fk26so3794708vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 09:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=hVyXx92Dkg6a6Snp+5hkNdcjjeIz/6tJamm1TmWEXHM=;
	b=hFd/rJSIwf1lK4b8UofzKqjuRFGLTWUQQP/OWdLSWVVegy38HJm9PJ7YVGYegXX1pu
	1OiZQEZmoXvNASIA5rdSgiOHjrcQk49PCi9JEozmUR9Ur/nkpR3EP5970G1JCjHA+FZH
	HdopjbWuR9dzLhUouJru0Ga19egrLwcAPCaXw=
MIME-Version: 1.0
Received: by 10.220.154.135 with SMTP id o7mr8583087vcw.2.1327512793110; Wed,
	25 Jan 2012 09:33:13 -0800 (PST)
Received: by 10.52.67.171 with HTTP; Wed, 25 Jan 2012 09:33:13 -0800 (PST)
In-Reply-To: <4F202735.8040405@balister.org>
References: <1592899.mTy93uB97i@helios> <4F20130D.2010208@balister.org>
	<1908796.glHMrEiIxU@helios> <4F202735.8040405@balister.org>
Date: Wed, 25 Jan 2012 18:33:13 +0100
Message-ID: <CACW_hTYpQHcHT3YoN=-G1FFu2-KiUu_FOfkdEPk4P7wMNQEZZw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Splitting meta-oe
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
X-List-Received-Date: Wed, 25 Jan 2012 17:41:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

I like the idea of putting toolchains in a layer.

Wrt DP = -1:
I feel if a recipe needs DP = -1 it is not good enough to be added to
meta-oe. Probably it is more something for an unstable layer.
(and DP = -1 encourages the growth of deadwood; I still recall in OE that
there were some recipes that had the last 3 or 4 versions all with DP = -1;
let's try to avoid this in oe-core/meta-oe)

Best regards, Frans.

