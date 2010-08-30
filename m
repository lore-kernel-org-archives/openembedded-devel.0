Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Oq6ji-0004Qq-1P
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 17:57:54 +0200
Received: by ewy7 with SMTP id 7so3308853ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 08:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=SX8B5XH9UXfASK8446lVHRlRaA7mmxIbKM4M9gzGasU=;
	b=h9rCpYGsdWbF3EdV/NDDoJZEkLXLCJe5h6v3ZspLUurI7N4CkJYKeN/cGb+agKQwvx
	LfQ2psHXQNADLzefJ9NflSXlIP7IzzXy5pOzqfsuW6HtTAEOEnvUgSIQpxsXZu+wxA0d
	+28sXe9e75tiH34Gx/sgrf+rSADPg7z6qWmjo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=O5kKSLQIM80gSLTwobo00KRURBIq4vEp067JLDth2c3d6BtCz0mHCFVO+SSFYHDZR/
	huHbTZgoLCe6igRX/VDUOMeQGvHSZ6PpX6TaQVTxYTs67uoG+/5pRxn+yLVu7lq01emd
	t4FmcU7ssN/0r8gezMLQd7vmOWpqdTHZAk1l4=
MIME-Version: 1.0
Received: by 10.216.203.71 with SMTP id e49mr5109861weo.60.1283183812946; Mon,
	30 Aug 2010 08:56:52 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Mon, 30 Aug 2010 08:56:52 -0700 (PDT)
Date: Mon, 30 Aug 2010 11:56:52 -0400
Message-ID: <AANLkTimgF4zbXEyzYK-BQqtgiv2fk1rvgi3W4MdfQ5Wt@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: branch namespace clutter
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
X-List-Received-Date: Mon, 30 Aug 2010 15:57:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

If there are any branches in the OE git repo that are no longer in
use, please let me know and I'll delete them.  Our branch namespace is
getting rather cluttered.

http://cgit.openembedded.org/cgit.cgi/openembedded/refs/heads

Thanks,
Cliff

-- 
=================
http://bec-systems.com


