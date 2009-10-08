Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1MvsVH-0001sj-Pb
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Oct 2009 14:53:58 +0200
Received: by fxm3 with SMTP id 3so6228648fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Oct 2009 05:53:05 -0700 (PDT)
Received: by 10.86.220.9 with SMTP id s9mr1114648fgg.40.1255006385470;
	Thu, 08 Oct 2009 05:53:05 -0700 (PDT)
Received: from xora.vm.bytemark.co.uk (www.xora.org.uk [80.68.91.202])
	by mx.google.com with ESMTPS id 4sm380670fgg.18.2009.10.08.05.53.04
	(version=SSLv3 cipher=RC4-MD5); Thu, 08 Oct 2009 05:53:04 -0700 (PDT)
Date: Thu, 8 Oct 2009 13:53:02 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091008125302.GE10797@xora.vm.bytemark.co.uk>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.207
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Revert Request for linux -> linux-gnu changes
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
X-List-Received-Date: Thu, 08 Oct 2009 12:53:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, I cannot actually carry out this request as I will be without net
access for the eV meeting.

But it is becoming clear that the linux -> linux-gnu change is throwing
up many issues for arches != linux-gnueabi. Partial fixes have been
implemented but for every fix another issue seems to pop up.

I suggest these changes should be reverted, placed in a branch and
properly merged at a later date after proper review.

Graeme (XorA)



