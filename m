Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NmBQ9-00079J-64
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 20:36:50 +0100
Received: by gyd5 with SMTP id 5so1276893gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 11:33:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=2p28j1CTpzCJgtPLZAR8V6dpAxf9Xj58+Hf2jAfDypM=;
	b=LxUVAtLZGKm+nprOQVShfLJR9pSeu1br0gyHKJQSE6clklKnoI4xD74yE9dr/WBTwl
	KfkzJiemhmmdKw3JXVvCsp397r+A7LcjsXABCsgQOkhQMpD3LSBH1b2ke8GBgv7ZEl2h
	7MTWsGM5BJcpc9z9HkXcYJ5n91eVq70RyBags=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=jYwA5Qf6aFHZYnFQJRkzj88cwtbv1H+yw9aNDdUNC7Xg05rsKIB4mHc25r/VvQ9VC3
	t4cn4UAjhZ9I7/02gIayZIwKXvsvlykkuVUgVZwzzqqYvhpDaJqrpWAT405eYKdNuJpo
	qxNS2+2TPZr7UlAcQBcQ3Z2ABdnekSIesmx8w=
MIME-Version: 1.0
Received: by 10.101.175.31 with SMTP id c31mr6952054anp.99.1267472038738; Mon, 
	01 Mar 2010 11:33:58 -0800 (PST)
Date: Mon, 1 Mar 2010 20:33:58 +0100
Message-ID: <ac9c93b11003011133wa0f4e3bqe7af69ead4d7eec6@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: {TSC] request to discuss items.
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
X-List-Received-Date: Mon, 01 Mar 2010 19:36:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

As we have (as far as I know) no procedure to table issues for the
TSC, I'm proposing two issues for the TSC:

1) the location of distro specific files
2) how to handle legacy recipes that are not used by any known distro

Both have been discussed on this list, and several options have been coined
E.g. for 1) dedicated directories, overlays or retain the current solution
And for 2) an overlay, and "obsolete" directory, retain the current
solution and remove the recipes.

May I ask the TSC to provide a verdict on these.

Thanks alot,
Frans


