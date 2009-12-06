Received: from mail-ew0-f224.google.com ([209.85.219.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NHPrJ-00008E-Ph
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Dec 2009 23:45:44 +0100
Received: by ewy24 with SMTP id 24so4865577ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Dec 2009 14:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=JLOBkjiCbb6yaTLxU+tYPqz/B1UdtzaP6Ur6ZhlyR/8=;
	b=ou+1UB/jW/zWtvhDvZS3+1qWMSuZQViirsuJDfnHjPqtOZlvEwNGjjZ6W790tCHAJc
	5Nq9z7KCTxQxxEIL4pDlXa6ZQcEeLq8ptswbHUki+WDyuNpLASWmTuwie6o3aq2h37dV
	XeTighLiM51j/YFNZw8Ai5uUdGQiGoGIv62ZI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=FO2Lf2Ufp6d/RqFIyVQ3lrwl66VggAAq7GRZxasMecGzZk7GJotTl+ipzMqMWEN6gy
	ywTmw6UlX0lxOqnjDKta2kDO3l2Qc1nuhJREdaPDWSJT7ZoGCGj4BXQWWqogILh4+egr
	6MlecrktGX8UFxMi3OQ1A1A+A+eD9sVDLNYfI=
MIME-Version: 1.0
Received: by 10.213.2.73 with SMTP id 9mr6371135ebi.21.1260139442881; Sun, 06 
	Dec 2009 14:44:02 -0800 (PST)
Date: Sun, 6 Dec 2009 23:44:02 +0100
Message-ID: <c384c5ea0912061444l1e7f6533g93ecf5da13794e90@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.219.224
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC] [HEADS UP] [TSC] Patches coming up to merge nios2 support
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
X-List-Received-Date: Sun, 06 Dec 2009 22:45:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I'm about to dump patches on this list, folding my nios2 work into .dev.

Just tested against .dev, I'm gitting them down on the list now.

Regards,
-- 
Leon [LIKEWISE] Woestenberg


