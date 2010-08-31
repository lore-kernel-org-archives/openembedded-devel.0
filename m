Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OqH03-0007iJ-Ra
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Aug 2010 04:55:05 +0200
Received: by iwn2 with SMTP id 2so5314470iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 19:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=a4lRdGbkN15cpnkRcZ9mRHSCHhy1vRf1CRsoV1c01Z4=;
	b=xsC/3GJ57G5km7rPtLSIGbpBpvLZ8Zo0CZsW1/yMr78Vut46ulr91x53nt9a2Fci0g
	rbBOBHh90IXWofuNoMI4ZqoFd+mTjybESxbtXJM2KQ6lDEmo9VQb3Oa60+KJ/zXLt9ZW
	bRPvyMmD6GS3cxH9wnuYV5RRrphVrlAolklnU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=GElUtOpKtqTmWSMRfI/UA090SIQqYsKs3IOFyAZsQSE/obC1o8C8UpPfgVK0iK1mHq
	PTxF5JspXYbDWlcceJxvASZpLCtU/zLffClG1sNBO+eSvVLlppf5bPPH5XPMU8xpZBN7
	eJjr8WFX8l6aXa0vByupkhn68aOvhDbVv04CY=
MIME-Version: 1.0
Received: by 10.231.58.201 with SMTP id i9mr6377335ibh.98.1283223272279; Mon,
	30 Aug 2010 19:54:32 -0700 (PDT)
Received: by 10.231.167.79 with HTTP; Mon, 30 Aug 2010 19:54:32 -0700 (PDT)
Date: Tue, 31 Aug 2010 12:24:32 +0930
Message-ID: <AANLkTi=1tFx5YDCMPmB4EVz944EJbDDGKxoK=mt-jgNO@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Michael 'Mickey' Lauer : vala: add 0.9.6.1
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
X-List-Received-Date: Tue, 31 Aug 2010 02:55:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

This new version breaks vala-dbus-binding-tool-native.

http://tinderbox.openembedded.net/packages/722530/

-Graham


