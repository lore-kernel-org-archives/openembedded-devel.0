Received: from [209.85.146.176] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <shanevolpe@gmail.com>) id 1Kt0IP-0006rN-Hs
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Oct 2008 15:32:13 +0200
Received: by wa-out-1112.google.com with SMTP id l24so203784waf.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2008 06:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=GTrRvqT8ongAgMeNqP4SHLf7roA2+hlz4FLcgpzefFA=;
	b=xRZmAenfms5kbW/F8e33uPLaIuPcjMviIS8O/QFu8chgBXogE/4yll2Q2IwHjxZ+K8
	dTGq4Rcb5gV8CwGnEemN+hLhaqxG5R+fuPAoI6NTEcmiaRiRpJd381jYyrQfe4xqMmtV
	DBQJHLvv2TQUIgZalL+dpK/adZWNcWoGtcemQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=pqQbBE/BRiwTt3H6m6ouia8SGOM8WCAE3xgVmPE9APhW+tP9V6pxwc2Ebj+z2BbLrJ
	g0UMhrRZkBVM3ZoORysSstj3nCumP9gNdstSvKoaKfoNvJn1A0AJJA8depX0JriX7hVi
	ou8JFCvLb23SgCJA/xnm9iWcG0PSpPLkvGQhE=
Received: by 10.114.234.13 with SMTP id g13mr538812wah.176.1224768701846;
	Thu, 23 Oct 2008 06:31:41 -0700 (PDT)
Received: by 10.114.24.11 with HTTP; Thu, 23 Oct 2008 06:31:41 -0700 (PDT)
Message-ID: <8c7950360810230631k530398dajbcbbf444a67333e5@mail.gmail.com>
Date: Thu, 23 Oct 2008 09:31:41 -0400
From: "Shane Volpe" <shanevolpe@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: LTP (Linux Test Project) better embedded support
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
X-List-Received-Date: Thu, 23 Oct 2008 13:32:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

All,
I have been working with LTP (Linux Test Project) for several months
now and had quite a bit of issues with its default settings on many
tests mainly do to the limited resources on my hardware (RAM).  I have
got most of it working but came to the conclusion that  previsions
really needed made in the LTP mainline to better support embedded
systems in the future.

I posted to the LTP mailing list and received quite a bit of interest
in pushing LTP in that direction.  One of the main developers
(Subrata Modak) has posted an initial idea and has asked for feedback
from the community.  I thought since *most* of the OE developers are
working on embedded systems that quite a few of us may have good
suggestions/insight for Subrata so I ask anyone interested in LTP
please post your ideas/suggestions to LTP list
(ltp-list@lists.sf.net).  The initial thread I started, on the LTP
list, regarding this issue was:" embedded systems with limited memory
issues"
Regards,
Shane


