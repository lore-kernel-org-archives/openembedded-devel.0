Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1PBCfB-0006ds-So
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Oct 2010 22:32:02 +0200
Received: by fxm3 with SMTP id 3so1206342fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 13:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=PiHbb4lWujh55X8RpY6gjE9RkbA++C/jox82tD7fpd0=;
	b=VpfibYTJEgUdi8SJddNQ6FsvLh73CgQoJgGI1cJ97hZ8ZYtA6VEvJRWSUAhEEYlOVz
	3vDubHwUAWHBpSUvZbM2vh1N6ma/2AIsVs0tyQYk3d1/pXxBa6CYFZ5hQPk5V2xkcoIL
	TTDNRydQF8/7pAXsEQjYVKQ/hASlfmQwcDalY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=Fb7wH2djmCryCCOSejLVPhb/Q77P7miBcyJSTI95AKRUq0oIQaN6KKux3VtcVzYRNY
	BCnSHa6K5wBkfcHp4tIET8UIFl9fDelRrGNFFe+nCr4/qwbgXUMiqWuY1v9WHn3Z5FwW
	v6IaInRJyMdVc3pPz9mpH0C7Kl4qu1noWuAPg=
Received: by 10.223.79.72 with SMTP id o8mr2897578fak.137.1288211475305; Wed,
	27 Oct 2010 13:31:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.112.201 with HTTP; Wed, 27 Oct 2010 13:30:55 -0700 (PDT)
From: AJ ONeal <coolaj86@gmail.com>
Date: Wed, 27 Oct 2010 14:30:55 -0600
Message-ID: <AANLkTinY_pXnaDBEnV6abcmgcjN7LT5vx22UCsPqeRiS@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: netpbm fails - "No file to patch"
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
X-List-Received-Date: Wed, 27 Oct 2010 20:32:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

Applying patch ppmtojpeg.patch
can't find file to patch at input line 5
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|# This patch makes the /usr/bin/ppmtojpeg work on OE.
|
|--- netpbm-10.28/netpbm.c.orig 2005-08-04 13:20:15.665273549 -0700
|+++ netpbm-10.28/netpbm.c      2005-08-04 13:21:09.288647855 -0700
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
Patch ppmtojpeg.patch does not apply (enforce with -f)
ERROR: Task 1
(/mnt/local/overo-coolaj86/org.openembedded.dev/recipes/netpbm/
netpbm_10.28.bb, do_patch) failed


AJ ONeal

