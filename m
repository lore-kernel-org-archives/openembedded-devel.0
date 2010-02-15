Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NhAZa-0004NQ-Bs
	for openembedded-devel@openembedded.org; Tue, 16 Feb 2010 00:41:53 +0100
Received: by pzk30 with SMTP id 30so2422832pzk.6
	for <openembedded-devel@openembedded.org>;
	Mon, 15 Feb 2010 15:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=CMnKjWdFjIEvc+kHSu3eFnME2aVqBS3Qv+T6OX6s4mo=;
	b=eTxvg4xVDHRna3uGqsDASJ0DUBLEcyl/aeUYwi1MTzDtHbDoB16NMBSk1EzHHX5KL4
	9b2UmHIUgie0RkAM4mcSZPxpWOO5nSUZ6Qzui68nAWzsEMqBacukIJ3/P7dCFnqe5KXn
	EVP2jrA8QVcjQhYe8lgXPLGOJIWbSWg04h3/4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	b=AcOCpO4yzTU/9Q+bS34D3uXvO2MwCwoL8EJc3Wdf9lWRz9A7fdTSzz0RzAUm2GWZQH
	4IBo/cNlNt4+AnOwG/n97F8SGwEv36/qzcibwWqfS7MOcc2qFq/MQTPg0RHRa6ov4pcd
	mP4ngZGYUa5MS2FPDBUt6RVMUyel1jjZ2Y5K0=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.248.26 with SMTP id v26mr2508527wfh.335.1266277151063; 
	Mon, 15 Feb 2010 15:39:11 -0800 (PST)
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 15 Feb 2010 16:38:51 -0700
X-Google-Sender-Auth: 07ef0584cb7c01dc
Message-ID: <b6ebd0a51002151538o524cdf17s228535e93b28d4d4@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Cleanup / janitors
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
X-List-Received-Date: Mon, 15 Feb 2010 23:41:53 -0000
Content-Type: text/plain; charset=UTF-8

Greetings all,

Per discussion in the TSC meeting this month, I'm sending out this email as
a probe.  Would anyone on the list benefit from a "janitors" type project,
to outline and document specific cleanup tasks and how they should be done?
There are many tasks that need doing which involve editing of large amounts
of files in relatively simple ways, and I suspect, but am not yet certain,
that there are a group of individuals who wish to contribute to the project,
but are new enough that they don't feel confident diving into anything
invasive.  This sort of a task could be a starting point for that sort of
individual.  Thoughts?  Anyone out there in that camp currently that would
benefit from something like this?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

