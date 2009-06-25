Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MJeWX-0007UB-Au
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Jun 2009 04:17:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 6EDE64E9C03
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2009 22:05:59 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06428-08 for <openembedded-devel@lists.openembedded.org>; 
	Wed, 24 Jun 2009 22:05:59 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 4F077460667
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2009 22:05:59 -0400 (EDT)
Date: Wed, 24 Jun 2009 22:05:59 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
Message-ID: <Pine.LNX.4.64.0906242154090.8101@juice.ott.cti.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Building against a local git repo
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
X-List-Received-Date: Thu, 25 Jun 2009 02:17:14 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hi,

I think in the past couple of months someone posted a trick for building 
out of an existing source directory, so changes can easily be gathered up 
and committed.

Basically, for local projects I'd like to occasionally break out of a 
development cycle of (edit, commit, push, bitbake) * n and just do (edit, 
bitbake) * n with a final commit and push at the end.

I remember the trick was being used for kernel development, and may have 
involved mangling S or WORKDIR, but that's about it; hoping someone might 
remember and save me some more hours scouring the archives :)

Thanks,
Mike


