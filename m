Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Kq2kk-0005L3-JE
	for openembedded-devel@openembedded.org; Wed, 15 Oct 2008 11:33:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9F9S7de009903
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 10:28:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09739-03 for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 10:28:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9F9RxDT009896
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 10:28:00 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1223990240.29816.58.camel@polaris>
References: <1223989999.29816.56.camel@polaris>
	<1223990240.29816.58.camel@polaris>
Date: Wed, 15 Oct 2008 10:27:59 +0100
Message-Id: <1224062879.5189.49.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: please check BK&MTN to GIT conversion dry-run repository
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
X-List-Received-Date: Wed, 15 Oct 2008 09:33:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-10-14 at 15:17 +0200, Jan Luebbe wrote:
> And here it is: http://git.sicherheitsschwankung.de/?p=jan/oetest.git

The BKCVS conversion still has the problems I wanted to get resolved
before we did this for example:

http://git.sicherheitsschwankung.de/?p=jan/oetest.git;a=commit;h=66944efa040bdf36062522c7c33413fc1e039d83

Where two commits have been rolled into one.

The original plan was to add the BKCVS later as a git tree graft rather
than hardcoding it into the history now in a broken form. Is it too late
to do this now?

Cheers,

Richard



