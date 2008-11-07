Received: from [64.233.182.191] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1KySry-00082P-7v
	for openembedded-devel@openembedded.org; Fri, 07 Nov 2008 16:03:30 +0100
Received: by nf-out-0910.google.com with SMTP id d3so727543nfc.20
	for <openembedded-devel@openembedded.org>;
	Fri, 07 Nov 2008 07:01:53 -0800 (PST)
Received: by 10.210.30.10 with SMTP id d10mr3752534ebd.80.1226054460524;
	Fri, 07 Nov 2008 02:41:00 -0800 (PST)
Received: from ?192.168.1.10? ([78.86.128.56])
	by mx.google.com with ESMTPS id h6sm12911234nfh.21.2008.11.07.02.40.59
	(version=SSLv3 cipher=RC4-MD5); Fri, 07 Nov 2008 02:40:59 -0800 (PST)
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@openembedded.org
Date: Fri, 07 Nov 2008 10:40:58 +0000
Message-Id: <1226054458.7175.3.camel@aquilonia>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1 
Subject: Xorg X11R7.4 updates
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
X-List-Received-Date: Fri, 07 Nov 2008 15:03:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi, sponsored by Openmoko I have been working on bring Xorg 7.4 to OE. I
have now reached the point where all the right versions of the packages
are now in and I have even checked that they compile to the extent I can
on arm (some are obviously x86 or exotic machine only).

So I would like people with an interest to please review the changes on
the shared/xorg-7.4-update branch. Especially x86 guys who can actually
use some of the drivers. Id like to get any problems ironed out now
ready for merging into OE mainline.

Thanks

Graeme




