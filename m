Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Mzv6y-0007gL-DU
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Oct 2009 18:29:35 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 586D41417193
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2009 18:24:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XDfZGKkj48lH
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2009 18:24:37 +0200 (CEST)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id 2F42F1416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2009 18:24:36 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1255966150-1854-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1255966150-1854-1-git-send-email-marcin@juszkiewicz.com.pl>
Date: Mon, 19 Oct 2009 18:28:33 +0200
Message-Id: <1255969713.4434.5.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Updating kernels to latest stable versions
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
X-List-Received-Date: Mon, 19 Oct 2009 16:29:35 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Marcin Juszkiewicz wrote:
> Some time ago I asked about updating kernels to recent stable patch.
> There was nearly no discussion on it so this time I am sending mails for
> review. Did not build checked those patches yet.

Maybe it should be 2.6.21.7-r0 instead of 2.6.21-r13 and do the same for
other patched recipes.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



