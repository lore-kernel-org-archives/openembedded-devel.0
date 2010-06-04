Received: from mail-yw0-f176.google.com ([209.85.211.176])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aspnair@gmail.com>) id 1OKS2A-0004dS-PO
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 10:13:44 +0200
Received: by ywh6 with SMTP id 6so914390ywh.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 01:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=kAjVXA2dxpJg+MpWKBs6nAdKgUI/KAy2xgbJ5d6dreM=;
	b=sPWAguGbyUZ0HvXcQ+DFunsG3MHmBq7yq7m14fujddbuk2T8SQiH0WqzUNoEf29FY/
	/gWcL2OgOBquOJJV821hPa8HygIAq4LgAexQduY0Kgz0gRp9TOQvDH6ylAFMgLQFW7Hn
	GaHh4psMy1pDNpch93mitV7V5I0GvEa5XO35c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=uoRUrkZ6sSGEb5b8A+u+Mna0bUVp3wG1huNHf4QvrZkPKeQHEq7rkdpNTnqeDPGe18
	y+HVDkPixsQF2lh4XaxrcDZkgZw7b5CqmmPeMP6QEtKH+EbHzK7oiU+574gpYkwrBP3o
	4xRNNvK0JXHpe1BG1DNbPu8MoDVrca6J8hlrQ=
MIME-Version: 1.0
Received: by 10.150.250.2 with SMTP id x2mr10563634ybh.267.1275638965218; Fri, 
	04 Jun 2010 01:09:25 -0700 (PDT)
Received: by 10.150.228.21 with HTTP; Fri, 4 Jun 2010 01:09:25 -0700 (PDT)
Date: Fri, 4 Jun 2010 13:39:25 +0530
Message-ID: <AANLkTinzFcGTINenNR72-NtuZUijkAY55BVKYL9r0ea8@mail.gmail.com>
From: Anand Sivaram <aspnair@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.176
X-SA-Exim-Mail-From: aspnair@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00, HTML_FONT_FACE_BAD, 
	HTML_MESSAGE,SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Questions about openembedded stable branch
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
X-List-Received-Date: Fri, 04 Jun 2010 08:13:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

As I was going through the stable documentation given at
http://wiki.openembedded.net/index.php/Stable
I had a couple of questions.

* Seems like there should have been a release "stable/2010" some time around
  March, but I could not find any mention about that release.

* OE repository contains very few tags.  Also there is no
  "year.month" tag as given by the stable branch documentation.

* Is there any testing branch (like in Debian) where relatively "stable"
  packages are moved and they eventually become stable?
  Or is it like mainline linux kernel where features are frozen, then
  do RC releases and finally the stable release?  It looks like
  origin/org.openembedded.dev is a rolling/floating place where
  packages/features are constantly getting included.

* I would like to know how the stable/2010 branch is created.

* My main objective is to find a branch/tag/version
  newer than stable/2009 and more stable than the dev main branch.

Thanks and Regards

Anand

