Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OvDf8-0008Fz-VQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 20:21:57 +0200
Received: by wye20 with SMTP id 20so6588162wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Sep 2010 11:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=8n2i4mnhHyApqAqvO6oph2LJlf/DfqJ1vX9aHkCUKmU=;
	b=B3D43bSG7j0HSI3RCCowOUufmNJf9M5L+Dd9mCHwvoENzJdLdmOPtppPG8oMv4Eryn
	lZDyZtTehncYZtRGK6xmA+Uw5hn5dNATuwoENwo3bgoZAeZd95fOmGd9Mnvk93+MeuyV
	YbPvE3YxGzRVA9BDwVPmjGD1P5QGIeWfl5N2k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=TQyRtC/IWXXWtiJo7jiUWwXbNnJGHnmACL8xbt16dqXb0PBRrSll9ZaIi618Fu0xIU
	8emPYXQ/AN8bjJM4XFER3lCXzs+oM/T/BxSq9QytZwJf89ynHUAcYLZpw3Hc6FbGRxtv
	0udxjMxQQo1KeUCexnJJrWmEM9gGEs1TOVgqY=
MIME-Version: 1.0
Received: by 10.216.22.70 with SMTP id s48mr2938243wes.27.1284402066564; Mon,
	13 Sep 2010 11:21:06 -0700 (PDT)
Received: by 10.216.72.212 with HTTP; Mon, 13 Sep 2010 11:21:06 -0700 (PDT)
Date: Mon, 13 Sep 2010 14:21:06 -0400
Message-ID: <AANLkTi=6fss18KJvTBYf3oV1MXkgJwT7cqTRz4rK+aTx@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: testing branch 2010-09-13
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
X-List-Received-Date: Mon, 13 Sep 2010 18:21:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

last weeks testing cycle was a success.

http://wiki.openembedded.net/index.php/Testing#Testing_Log

Firefox is failing in some configurations if the same version of
firefox is installed on the host system -- it would be nice to get
this resolved this week.

testing-next branch has been updated and is ready for clean builds.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


