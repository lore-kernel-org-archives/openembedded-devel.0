Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koansoftware@gmail.com>) id 1NpiGq-0001pm-E5
	for Openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 14:17:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id B8E902CA13
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 11 Mar 2010 13:10:08 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UupEI5kO5WM0; Thu, 11 Mar 2010 13:10:04 +0000 (UTC)
Received: from [10.1.10.2] (host61-87-static.14-79-b.business.telecomitalia.it
	[79.14.87.61]) by wiki.koala.it (Postfix) with ESMTPSA id ABDB02C7DC;
	Thu, 11 Mar 2010 13:10:03 +0000 (UTC)
Message-ID: <4B98ECC5.8090202@gmail.com>
Date: Thu, 11 Mar 2010 14:14:45 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: KOAN sas - Bergamo - Italia
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: Openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 64.22.125.45
X-SA-Exim-Mail-From: koansoftware@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_00,SPF_NEUTRAL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Marco Cavallini <m.cavallini@koansoftware.com>
Subject: [RFC][ANNOUNCE] KaeilOS Openembedded Manager (KOM)
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
X-List-Received-Date: Thu, 11 Mar 2010 13:17:53 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

[RFC][ANNOUNCE] KaeilOS Openembedded Manager (KOM)

Dear OE developers,
I'd like introduce you a new product we developed at KOAN with the aim
to semplificate the management of OE [1] building tree and recipes when
using (more or less complex) overlays, creating something like an
abstraction from the underlying framework.

We called it KaeilOS Openembedded Manager (KOM for short) [2] and is a
tool designed to create and manage any OpenEmbedded based project, like
KaeilOS [3], Angstrom [4], and others.
All KOM projects are a full-fledged overlay where you can also build
your personal image or software packages.
At the same time you can override other overlay in a simple way.

Aside from personal opinions on the name KOM, Leonardo (IRC:hachreak)
and me (IRC:mckoan) would like to have your impressions on the product,
and of course we will welcome comments, criticisms and no less important
patches.

Thanks and sorry to bother you with this,

 [1] http://www.openembedded.org/
 [2] http://kom.kaeilos.com/
 [3] http://www.kaeilos.com/
 [4] http://www.angstrom-distribution.org/

Cheers
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com


